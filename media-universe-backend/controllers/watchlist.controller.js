// controllers/watchlist.controller.js — Watch list page (Page 8).
// Every route here runs after requireRole('user'), so req.user.accountID is
// always a logged-in Normal_User (Watchlist.accountID references Normal_User).
const pool = require('../db');
const { serverError } = require('../middleware/errors');
const { MEDIA_SELECT } = require('./media.query');
const { addMediaThumbnail } = require('../thumbnails');

const isId = (value) => /^[1-9]\d*$/.test(String(value));

// GET /watchlist?genre=&platforms=1,2 — the logged-in user's watchlist.
// genre: main genre OR sub genre. platforms: on ANY of these platforms.
exports.list = async (req, res) => {
  try {
    const where = ['w.accountID = ?'];
    const params = [req.user.accountID];
    if (isId(req.query.genre)) {
      where.push(`(m.main_genre_id = ? OR EXISTS
                   (SELECT 1 FROM Subgenre sg WHERE sg.id = m.id AND sg.genre_id = ?))`);
      params.push(req.query.genre, req.query.genre);
    }
    const platforms = String(req.query.platforms || '').split(',').filter(isId);
    if (platforms.length) {
      where.push(`EXISTS (SELECT 1 FROM Media_Platform mp
                          WHERE mp.id = m.id AND mp.platform_id IN (${platforms.map(() => '?').join(', ')}))`);
      params.push(...platforms);
    }
    const [rows] = await pool.execute(`
      ${MEDIA_SELECT}
      JOIN Watchlist w ON w.id = m.id
      WHERE ${where.join(' AND ')}
      ORDER BY m.title`, params);
    res.json(rows.map(addMediaThumbnail));
  } catch (err) {
    serverError(res, err);
  }
};

// GET /watchlist/filters — for the whole watchlist: its size and how many titles each platform has.
exports.filters = async (req, res) => {
  try {
    const [[[{ total }]], [platforms]] = await Promise.all([
      pool.execute('SELECT COUNT(*) AS total FROM Watchlist WHERE accountID = ?', [req.user.accountID]),
      pool.execute(`
        SELECT p.platform_id, p.platform_name, COUNT(w.id) AS media_count
        FROM Platform p
        LEFT JOIN Media_Platform mp ON mp.platform_id = p.platform_id
        LEFT JOIN Watchlist w ON w.id = mp.id AND w.accountID = ?
        GROUP BY p.platform_id, p.platform_name
        ORDER BY media_count DESC, p.platform_name`, [req.user.accountID])
    ]);
    res.json({ total, platforms });
  } catch (err) {
    serverError(res, err);
  }
};

// POST /watchlist   { media_id }
// User Flow 4: user adds a media -> login already checked -> INSERT for this account.
exports.add = async (req, res) => {
  try {
    const { media_id } = req.body;
    if (!media_id) return res.status(400).json({ error: 'media_id is required' });
    await pool.execute(
      'INSERT INTO Watchlist (accountID, id) VALUES (?, ?)',
      [req.user.accountID, media_id]);
    res.status(201).json({ accountID: req.user.accountID, media_id: Number(media_id) });
  } catch (err) {
    if (err.code === 'ER_DUP_ENTRY')
      return res.status(409).json({ error: 'already in your watchlist' });
    if (err.code === 'ER_NO_REFERENCED_ROW_2')
      return res.status(404).json({ error: 'media not found' });
    serverError(res, err);
  }
};

// DELETE /watchlist/:mediaId
// User Flow 6: user removes a media -> DELETE by media id for this account.
exports.remove = async (req, res) => {
  try {
    const [r] = await pool.execute(
      'DELETE FROM Watchlist WHERE accountID = ? AND id = ?',
      [req.user.accountID, req.params.mediaId]);
    if (r.affectedRows === 0) return res.status(404).json({ error: 'not in your watchlist' });
    res.status(204).end();
  } catch (err) {
    serverError(res, err);
  }
};
