// controllers/universes.controller.js — Discover Universe page (Page 6)
// and Universe page (Page 7).
// User Flow 9: user opens discover universe -> DB SELECT top 10 universes.
const pool = require('../db');
const { serverError } = require('../middleware/errors');
const { addMediaThumbnail, addBookThumbnail } = require('../thumbnails');

// GET /universes — top 10 universes, biggest first, with a short summary.
exports.list = async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT u.universe_id, u.universe_name,
             COUNT(m.id)                    AS media_count,
             SUM(mv.id IS NOT NULL)         AS movie_count,
             SUM(s.id IS NOT NULL)          AS series_count,
             ROUND(AVG(m.rating), 1)        AS avg_rating,
             MIN(YEAR(m.publish_date))      AS first_year,
             MAX(YEAR(m.publish_date))      AS latest_year
      FROM Universe u
      LEFT JOIN Media m   ON m.universe_id = u.universe_id
      LEFT JOIN Movies mv ON mv.id = m.id
      LEFT JOIN Series s  ON s.id  = m.id
      GROUP BY u.universe_id, u.universe_name
      ORDER BY media_count DESC, avg_rating DESC
      LIMIT 10`);
    res.json(rows);
  } catch (err) {
    serverError(res, err);
  }
};

// GET /universes/:id — one universe with all its media (in release order)
// and every book those media are based on.
// The media list comes from the stored procedure get_universe_media (sql/routines.sql).
exports.getOne = async (req, res) => {
  try {
    const id = req.params.id;
    const [universe] = await pool.execute('SELECT * FROM Universe WHERE universe_id = ?', [id]);
    if (universe.length === 0) return res.status(404).json({ error: 'universe not found' });

    // CALL returns [rows, status]; the first element holds the SELECT's rows.
    const [[media]] = await pool.execute('CALL get_universe_media(?)', [id]);
    const [books] = await pool.execute(`
      SELECT DISTINCT b.ISBN, b.book_title, b.volume, b.book_type, b.publish_date,
             a.author_name, p.publisher_name
      FROM Media m
      JOIN Media_Book mb    ON mb.id = m.id
      JOIN Book b           ON b.ISBN = mb.ISBN
      LEFT JOIN Author a    ON a.author_id = b.author_id
      LEFT JOIN Publisher p ON p.publisher_id = b.publisher_id
      WHERE m.universe_id = ?
      ORDER BY b.publish_date, b.volume`, [id]);

    res.json({
      ...universe[0],
      media_count: media.length,
      media: media.map(addMediaThumbnail),
      books: books.map(addBookThumbnail)
    });
  } catch (err) {
    serverError(res, err);
  }
};

// POST /universes   (admin / developer)   { universe_name }
// New media can then be linked with PUT /media/:id { universe_id }.
exports.create = async (req, res) => {
  try {
    const name = String(req.body.universe_name || '').trim();
    if (!name || name.length > 100)
      return res.status(400).json({ error: 'universe_name must be 1 to 100 characters' });
    const [r] = await pool.execute('INSERT INTO Universe (universe_name) VALUES (?)', [name]);
    res.status(201).json({ universe_id: r.insertId, universe_name: name });
  } catch (err) {
    serverError(res, err);
  }
};

// DELETE /universes/:id   (admin / developer)
// Its media are kept and become standalone (universe_id = NULL), in one transaction.
exports.remove = async (req, res) => {
  const id = req.params.id;
  const conn = await pool.getConnection();
  try {
    await conn.beginTransaction();
    const [unlinked] = await conn.execute('UPDATE Media SET universe_id = NULL WHERE universe_id = ?', [id]);
    const [r] = await conn.execute('DELETE FROM Universe WHERE universe_id = ?', [id]);

    if (r.affectedRows === 0) {
      await conn.rollback();
      return res.status(404).json({ error: 'universe not found' });
    }
    await conn.commit();
    res.json({ universe_id: Number(id), media_unlinked: unlinked.affectedRows });
  } catch (err) {
    await conn.rollback();
    serverError(res, err);
  } finally {
    conn.release();
  }
};
