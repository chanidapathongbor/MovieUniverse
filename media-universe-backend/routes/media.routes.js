// routes/media.routes.js — Home, All Search, Information and Edit pages.
const router = require('express').Router();
const c = require('../controllers/media.controller');
const { requireRole } = require('../middleware/auth');
const staff = requireRole('admin', 'developer');

router.get('/',            c.list);                 // Home page (filters + sort)
router.get('/search',      c.search);               // Flow 1: search  (must be before /:id)
router.get('/toprates',    c.toprates);             // Home page: top 5 
router.get('/:id',         c.getOne);               // Flow 2: click banner -> information page
router.post('/:id/visit',  c.recordVisit);          // information page opened: count one visit
router.post('/',           staff, c.create);        // Flow 7: admin adds movie / series
router.put('/:id',         staff, c.update);        // Edit page: update any field
router.put('/:id/genres',  staff, c.updateGenres);  // Flow 8: admin changes genre
router.delete('/:id',      staff, c.remove);        // Edit page: delete media

module.exports = router;
