// controllers/media.query.js — the "Media joined table" every page reads from.
// Movies and Series are disjoint subtypes of Media, so media_type comes from
// whichever subtype table has the id.
exports.MEDIA_SELECT = `
  SELECT m.id, m.title, m.publish_date, m.age_rating, m.status, m.synopsis,
         m.category, m.country, m.rating,
         CASE WHEN mv.id IS NOT NULL THEN 'Movie'
              WHEN s.id  IS NOT NULL THEN 'Series'
              ELSE 'Other' END AS media_type,
         mv.duration, s.episode_number,
         m.main_genre_id, g.genre_name AS main_genre,
         m.director_id,   d.director_name,
         m.universe_id,   u.universe_name,
         m.sequel_parent_id, m.remake_parent_id
  FROM Media m
  LEFT JOIN Movies mv  ON mv.id = m.id
  LEFT JOIN Series s   ON s.id  = m.id
  LEFT JOIN Genre g    ON g.genre_id    = m.main_genre_id
  LEFT JOIN Director d ON d.director_id = m.director_id
  LEFT JOIN Universe u ON u.universe_id = m.universe_id`;

// Adds up a Media.visits JSON value ({ "YYYY-MM-DD": count }), optionally from one day onward.
exports.sumVisits = (visits, since = '') =>
  Object.entries(visits || {}).reduce((sum, [day, count]) => (day >= since ? sum + count : sum), 0);
