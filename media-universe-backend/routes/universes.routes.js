// routes/universes.routes.js — Discover Universe (Page 6) and Universe page (Page 7).
const router = require('express').Router();
const c = require('../controllers/universes.controller');
const { requireRole } = require('../middleware/auth');
const staff = requireRole('admin', 'developer');

router.get('/',       c.list);              // Flow 9: top 10 universes
router.get('/:id',    c.getOne);            // all media + books of one universe
router.post('/',      staff, c.create);     // admin adds a universe
router.delete('/:id', staff, c.remove);     // admin deletes a universe; its media become standalone

module.exports = router;
