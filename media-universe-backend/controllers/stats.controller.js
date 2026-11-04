// controllers/stats.controller.js — Statistics page (Page 10), admin / developer only.
// User Flow 10: admin opens statistics -> DB SELECT -> backend aggregates and sends back.
const pool = require('../db');
const { serverError } = require('../middleware/errors');
const { MEDIA_SELECT, sumVisits } = require('./media.query');
const { addMediaThumbnail } = require('../thumbnails');

// GET /stats — dashboard overview.
exports.overview = async (req, res) => {
  try {
    const [[totals], [usersByRole], [byType], [byGenre], [byUniverse],
           [topWatchlisted], [topRated], [visited]] = await Promise.all([
      pool.query(`
        SELECT (SELECT COUNT(*) FROM Media)     AS media,
               (SELECT COUNT(*) FROM Movies)    AS movies,
               (SELECT COUNT(*) FROM Series)    AS series,
               (SELECT COUNT(*) FROM Book)      AS books,
               (SELECT COUNT(*) FROM Universe)  AS universes,
               (SELECT COUNT(*) FROM User)      AS accounts,
               (SELECT COUNT(*) FROM Watchlist) AS watchlist_entries`),
      pool.query(`
        SELECT 'user' AS role, COUNT(*) AS count FROM Normal_User
        UNION ALL SELECT 'admin', COUNT(*) FROM Admin
        UNION ALL SELECT 'developer', COUNT(*) FROM Developer`),
      pool.query(`
        SELECT CASE WHEN mv.id IS NOT NULL THEN 'Movie' ELSE 'Series' END AS media_type,
               COUNT(*) AS count, ROUND(AVG(m.rating), 2) AS avg_rating
        FROM Media m LEFT JOIN Movies mv ON mv.id = m.id
        GROUP BY media_type`),
      pool.query(`
        SELECT g.genre_name, COUNT(m.id) AS count, ROUND(AVG(m.rating), 2) AS avg_rating
        FROM Genre g LEFT JOIN Media m ON m.main_genre_id = g.genre_id
        GROUP BY g.genre_id, g.genre_name
        ORDER BY count DESC, g.genre_name`),
      pool.query(`
        SELECT COALESCE(u.universe_name, '(standalone)') AS universe_name,
               COUNT(*) AS count, ROUND(AVG(m.rating), 2) AS avg_rating
        FROM Media m LEFT JOIN Universe u ON u.universe_id = m.universe_id
        GROUP BY u.universe_id, u.universe_name
        ORDER BY count DESC`),
      pool.query(`
        SELECT m.id, m.title, COUNT(*) AS watchlist_count
        FROM Watchlist w JOIN Media m ON m.id = w.id
        GROUP BY m.id, m.title
        ORDER BY watchlist_count DESC, m.title
        LIMIT 10`),
      pool.query(`
        SELECT id, title, rating FROM Media
        ORDER BY rating DESC, title
        LIMIT 10`),
      pool.query('SELECT visits FROM Media WHERE visits IS NOT NULL')
    ]);

    res.json({
      totals: { ...totals[0], visits: visited.reduce((sum, m) => sum + sumVisits(m.visits), 0) },
      users_by_role: usersByRole,
      media_by_type: byType,
      media_by_genre: byGenre,
      media_by_universe: byUniverse,
      top_watchlisted: topWatchlisted,
      top_rated: topRated
    });
  } catch (err) {
    serverError(res, err);
  }
};

// GET /stats/group?by=genre|universe|category|country|type|age_rating|status|director|year
//                 &sort=count|avg_rating|watchlist|name
// "Selected, sorted and grouped by custom feature for further analysis."
// Only names from these lists are ever put into the SQL text.
const GROUP_BY = {
  genre:      'main_genre',
  universe:   "COALESCE(universe_name, '(standalone)')",
  category:   'category',
  country:    'country',
  type:       'media_type',
  age_rating: 'age_rating',
  status:     'status',
  director:   'director_name',
  year:       'YEAR(publish_date)'
};
const SORT_BY = {
  count:      'media_count DESC',
  avg_rating: 'avg_rating DESC',
  watchlist:  'watchlist_count DESC',
  name:       'group_name ASC'
};

exports.group = async (req, res) => {
  try {
    const by = req.query.by || 'genre';
    const groupExpr = GROUP_BY[by];
    if (!groupExpr)
      return res.status(400).json({ error: `by must be one of: ${Object.keys(GROUP_BY).join(', ')}` });
    const order = SORT_BY[req.query.sort] || SORT_BY.count;

    const [rows] = await pool.query(`
      SELECT ${groupExpr}        AS group_name,
             COUNT(*)            AS media_count,
             ROUND(AVG(rating), 2) AS avg_rating,
             MAX(rating)         AS best_rating,
             SUM(watchlist_count) AS watchlist_count
      FROM (
        SELECT x.*, (SELECT COUNT(*) FROM Watchlist w WHERE w.id = x.id) AS watchlist_count
        FROM (${MEDIA_SELECT}) AS x
      ) AS media
      GROUP BY group_name
      ORDER BY ${order}, group_name`);
    res.json({ grouped_by: by, groups: rows });
  } catch (err) {
    serverError(res, err);
  }
};

// GET /stats/visits?type=all|movie|series&days=7|30|90
// Visits per day (days without visits count as 0) and the most visited titles in that period.
const VISIT_TYPE_JOIN = {
  all:    '',
  movie:  'JOIN Movies t ON t.id = m.id',
  series: 'JOIN Series t ON t.id = m.id'
};
const VISIT_DAYS = [7, 30, 90];

exports.visits = async (req, res) => {
  const type = req.query.type || 'all';
  const days = Number(req.query.days || 30);
  const typeJoin = VISIT_TYPE_JOIN[type];
  if (typeJoin === undefined)
    return res.status(400).json({ error: `type must be one of: ${Object.keys(VISIT_TYPE_JOIN).join(', ')}` });
  if (!VISIT_DAYS.includes(days))
    return res.status(400).json({ error: `days must be one of: ${VISIT_DAYS.join(', ')}` });

  try {
    const [[[{ today }]], [media]] = await Promise.all([
      pool.query("SELECT DATE_FORMAT(CURDATE(), '%Y-%m-%d') AS today"),
      pool.query(`SELECT m.id, m.title, m.visits FROM Media m ${typeJoin} WHERE m.visits IS NOT NULL`)
    ]);

    const counts = new Map();
    for (const m of media)
      for (const [day, count] of Object.entries(m.visits))
        counts.set(day, (counts.get(day) || 0) + count);

    const series = [];
    for (let back = days - 1; back >= 0; back--) {
      const date = new Date(`${today}T00:00:00Z`);
      date.setUTCDate(date.getUTCDate() - back);
      const day = date.toISOString().slice(0, 10);
      series.push({ day, visits: counts.get(day) || 0 });
    }

    const top = media
      .map((m) => ({ id: m.id, title: m.title, visits: sumVisits(m.visits, series[0].day) }))
      .filter((m) => m.visits > 0)
      .sort((a, b) => b.visits - a.visits || a.title.localeCompare(b.title))
      .slice(0, 5);
    res.json({ type, days, total: series.reduce((sum, p) => sum + p.visits, 0), series, top });
  } catch (err) {
    serverError(res, err);
  }
};

// GET /stats/media/:id — the profile of one media for analysis.
exports.mediaProfile = async (req, res) => {
  try {
    const id = req.params.id;
    const [rows] = await pool.execute(`
      SELECT x.*,
        (SELECT COUNT(*) FROM Watchlist w      WHERE w.id = x.id)  AS watchlist_count,
        (SELECT visits FROM Media v            WHERE v.id = x.id)  AS visits,
        (SELECT COUNT(*) FROM Media_Actor ma   WHERE ma.id = x.id) AS actor_count,
        (SELECT COUNT(*) FROM Media_Platform p WHERE p.id = x.id)  AS platform_count,
        (SELECT COUNT(*) FROM Media_Book mb    WHERE mb.id = x.id) AS book_count,
        (SELECT COUNT(*) FROM Media c WHERE c.sequel_parent_id = x.id) AS sequel_count,
        (SELECT COUNT(*) FROM Media c WHERE c.remake_parent_id = x.id) AS remake_count,
        (SELECT COUNT(*) + 1 FROM Media o WHERE o.rating > x.rating)   AS rating_rank
      FROM (${MEDIA_SELECT}) AS x
      WHERE x.id = ?`, [id]);
    if (rows.length === 0) return res.status(404).json({ error: 'media not found' });

    const [watchers] = await pool.execute(`
      SELECT u.accountID, u.username
      FROM Watchlist w JOIN User u ON u.accountID = w.accountID
      WHERE w.id = ? ORDER BY u.username`, [id]);
    const { visits, ...profile } = rows[0];
    res.json({ ...addMediaThumbnail(profile), visit_count: sumVisits(visits), watchers });
  } catch (err) {
    serverError(res, err);
  }
};
