// app.js — Cross-referencing media universe: API + frontend (public/).
// Setup: see README.md (run the SQL files, copy .env.example to .env),
// then npm install (once) and npm start
require('dotenv').config();
const express = require('express');
const path = require('path');
const { errorHandler } = require('./middleware/errors');
const app = express();

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Thumbnails: the picture folders in DB_lab_project (matched to titles in thumbnails.js).
const { FOLDERS } = require('./thumbnails');
app.use(FOLDERS.media.url, express.static(FOLDERS.media.dir));
app.use(FOLDERS.books.url, express.static(FOLDERS.books.dir));

app.use('/accounts',  require('./routes/accounts.routes'));   // register / login / account management
app.use('/media',     require('./routes/media.routes'));      // home, search, info page, admin edit
app.use('/genres',    require('./routes/genres.routes'));     // genre selection page
app.use('/universes', require('./routes/universes.routes'));  // discover universe + universe page
app.use('/watchlist', require('./routes/watchlist.routes'));  // watchlist page
app.use('/stats',     require('./routes/stats.routes'));      // statistics page (admin / developer)
app.use('/lookups',   require('./routes/lookups.routes'));    // dropdown data for the edit page

// Unknown endpoint -> JSON 404 instead of Express's HTML page.
app.use((req, res) => res.status(404).json({ error: 'endpoint not found' }));

// Bad JSON body -> 400, anything else -> generic 500 (details only in the terminal).
app.use(errorHandler);
app.set('trust proxy', 1)

const PORT = process.env.PORT || 4500;
app.listen(PORT, () => console.log(`Media Universe on http://localhost:${PORT}`));
