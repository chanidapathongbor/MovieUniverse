# Cross-referencing Media Universe

**CSS326 Database Programming Laboratory · Final project · Semester 1, 2026**

| Member | ID | Role |
|---|---|---|
| Mr. Wayupuk Sommuang | 6722782388 | Project manager, backend design |
| Ms. Chanidapa Thongbor | 6722782735 | User flow, frontend design |
| Ms. Sirikorn Nukpook | 6722782981 | Database design |

A website for movie, series and book fans: pick a title and see everything it is connected to —
its sequels and remakes, the books it adapts, the rest of its universe, where to watch it — without
searching the internet by hand.

**Stack:** MySQL 8+ · Node.js + Express · mysql2/promise · bcryptjs · dotenv · plain HTML/CSS/JS.

---

## Folder layout

```
Databasse_project/
├── README.md                     ← this file
├── CSS326-Project_Proposal_…pdf  proposal (ERD, user flows, physical design)
├── CSS326_Final_Project_*.pdf    criteria, rubric, hashing handout
├── docs/                         project page for GitHub Pages (screenshots, no live data)
├── DB_lab_project/
│   ├── MediaDB_ALL_IN_ONE.sql    schema + all seed data  (run this one)
│   ├── ShowAllTable.sql          example join queries
│   ├── DB_image/                 movie & series posters
│   └── book_image/               book covers
└── media-universe-backend/       the app (API + frontend)
    ├── README.md                 API reference
    ├── app.js · db.js · thumbnails.js
    ├── controllers/ · routes/ · middleware/
    ├── sql/                      staff accounts, routines, app user
    ├── public/                   the 10 pages
    └── curl-commands.txt
```

## Setup (once)

**1. Database** — in MySQL Workbench, as root, run these four files in order:

| # | File | What it does |
|---|---|---|
| 1 | `DB_lab_project/MediaDB_ALL_IN_ONE.sql` | creates `MediaDB`: 20 tables, 33 titles, 30 books … |
| 2 | `media-universe-backend/sql/seed_staff_accounts.sql` | demo admin + developer (bcrypt-hashed) |
| 3 | `media-universe-backend/sql/routines.sql` | stored procedure + trigger |
| 4 | `media-universe-backend/sql/app_user.sql` | MySQL account `media_app` for the app |
| 5 | `media-universe-backend/sql/visits.sql` | JSON column `Media.visits` for the visit statistics |

Running 1–3 again resets the data to a clean state (step 4 only needs to run once).

**In MySQL Workbench**
- Open each file with **File → Open SQL Script…** and run it with the plain **lightning ⚡ button**
  (*Execute all*), not the ⚡ with the cursor (that one runs only the current statement).
  `routines.sql` contains `DELIMITER //` lines — that is expected and works in Workbench.
- Click the **refresh** icon in the *Schemas* panel afterwards; the database appears as `mediadb`
  (macOS shows schema names in lowercase).
- Workbench and the app talk to the same MySQL server (`127.0.0.1:3306`). Workbench logs in as
  `root` to set things up, the app logs in as `media_app`. Any change made in the website shows
  up in Workbench as soon as you re-run your `SELECT`.
- *For the security demo:* add a second Workbench connection with user `media_app` (password from
  `sql/app_user.sql`, default schema `MediaDB`). `SELECT` works there, but `DROP TABLE Watchlist;`
  fails with *DROP command denied* — the least-privilege account in action.

**2. App**

```bash
cd media-universe-backend
cp .env.example .env          # then put the media_app password in DB_PASS (see sql/app_user.sql)
npm install
npm start                     # → http://localhost:4500
```

## Demo accounts

| Role | Username | Password |
|---|---|---|
| admin | `admin` | `admin123` |
| developer | `developer` | `dev12345` |
| user | create one on the **Log in → Create account** tab | ≥ 8 characters |

## Pages

| # | Page | File | Who |
|---|---|---|---|
| 1 | Home — highest rated, universes, full catalogue with filters | `index.html` | everyone |
| 2 | Search — titles, actors, directors, books, authors… | `search.html` | everyone |
| 3 | Information page — details, adaptation chain, books, same universe | `media.html?id=` | everyone (+ staff tools) |
| 4 | Genre selection | `genres.html` | everyone |
| 5 | Log in / create account | `login.html` | everyone |
| 6 | Discover universes (top 10) | `universes.html` | everyone |
| 7 | Universe — release-order timeline + books | `universe.html?id=` | everyone |
| 8 | My watchlist | `watchlist.html` | user |
| 9 | Edit — add / edit / delete media, add / delete universe | `edit.html` | admin, developer |
| 10 | Statistics + accounts | `stats.html` | admin, developer |

## Roles

| Can… | guest | user | admin | developer |
|---|:-:|:-:|:-:|:-:|
| browse, search, genres, universes, information page | ✓ | ✓ | ✓ | ✓ |
| keep a watchlist | | ✓ | | |
| add / edit / delete media, change genre, add / delete universe | | | ✓ | ✓ |
| statistics, see all accounts | | | ✓ | ✓ |
| change roles, delete accounts | | | | ✓ |

The server checks the role on every protected request (`401` not logged in, `403` wrong role).
The frontend only hides what you can't use.

---

## How the project meets the rubric

| Criterion | Pts | Where to show it |
|---|---|---|
| **1. ER diagram & schema** | 6 | 20 tables: 15 entity tables (`User` + 3 role subtypes, `Media` + `Movies` / `Series`, `Universe`, `Book`, `Author`, `Publisher`, `Actor`, `Platform`, `Director`, `Genre`) and 5 junction tables. Relationships: 1:N (Universe→Media, Director→Media, Author→Book), M:N (Watchlist, Media_Actor, Media_Platform, Media_Book, Subgenre), recursive 1:N (sequel / remake of Media), disjoint subtypes. Every join is visible in `GET /media/:id`. |
| **2. CRUD** | 7 | **C** create account, add to watchlist, add media / universe · **R** every page · **U** edit media, change genre, change role · **D** remove from watchlist, delete media, delete account. All from the UI; refresh Workbench to see the row change. Validation messages on every form, transactions for multi-table writes. |
| **3. UI & navigation** | 3 | 10 pages, one header with search on every page, role-aware menu, works on a phone. |
| **4. Access control** | 4 | 3 roles with different rights (table above), enforced in `routes/*.routes.js` with `requireRole(...)`. |
| **5. Security** | 4 | `?` placeholders everywhere · credentials in `.env` (git-ignored), app connects as least-privilege `media_app` · generic 500 message, real error only in the terminal · **bonus:** bcrypt password hashing. |
| **6. Trigger & stored procedure** | 3 | `sql/routines.sql` — **SP** `get_universe_media` is called by the Universe page · **trigger** `media_inherit_universe` puts a new sequel / remake into its parent's universe. |
| **7. Q&A** | 3 | Each member explains their part (see the split below). |

### Who explains what

- **Database (Sirikorn):** ERD → `MediaDB_ALL_IN_ONE.sql`, subtype tables, junction tables, the recursive sequel/remake keys, `routines.sql`.
- **Backend (Wayupuk):** routers → controllers → `db.js`, transactions, `requireRole`, bcrypt, `.env` + `media_app`, generic errors, why names in `ORDER BY` come from a fixed list.
- **Frontend (Chanidapa):** user flows → pages, `public/js/common.js` (`api()` sends the token, `Auth` keeps the login), what each role sees.

---

## Demo script (≈ 8 minutes)

Before the demo: run setup files 1–3 to reset the data, then `npm start`.
Keep Workbench open next to the browser.

1. **Guest browsing** — Home → click a poster (Flow 2) → show the adaptation chain and the books.
   Search `rowling` (Flow 1: matches by author). Genres → *Historical* (Flow 3).
   Universes → *Marvel* (Flow 9) → release-order timeline.
2. **Create account** (Flow 5) — Log in → Create account. In Workbench:
   `SELECT * FROM User;` → the password column holds `$2a$10$…`, not the password.
   Register a second user with the **same** password → different hash (salt).
3. **Watchlist** (Flows 4 & 6) — as the user, open a title → *+ Add to watchlist*;
   Watchlist page → remove it. `SELECT * FROM Watchlist;` before and after.
   Show that the Edit page says *only for admin / developer*.
4. **Admin** (Flows 7 & 8) — log in as `admin`. Edit page → add *Iron Man 4*:
   *Sequel of* = Iron Man 3, **leave Universe empty** → save → the page shows
   *Marvel Cinematic Universe*: that was the **trigger**. On the information page use
   *Change main genre*, then *Delete*. Statistics → the Accounts table is **read only**.
5. **Developer** — log in as `developer` → Statistics → change the demo user's role to
   *admin* (they are logged out at once) → delete an account. Admin could not do this.
6. **Stored procedure** — in Workbench: `CALL get_universe_media(3);` — the same rows the Universe page shows.
7. **Security** — open `.env` / `db.js` (no password in the code, user `media_app`);
   `SHOW GRANTS FOR 'media_app'@'localhost';`. Break something on purpose
   (`DROP PROCEDURE get_universe_media;`, open a universe): the browser gets
   *"Something went wrong"*, the terminal shows the real error. Restore with `routines.sql`.
   Point at a `?` placeholder in any controller.

## Testing without the UI

`media-universe-backend/curl-commands.txt` has a ready-to-paste curl command for every endpoint,
including the error cases.

## Known limits

- Login tokens are kept in server memory, so everyone logs in again after a restart.
- The statistics use watchlist saves, ratings and counts; the schema has no table for search or page-view counts.
- Thumbnails are matched by file name. To add one, drop `<title>.jpg` into `DB_image` or `book_image`
  and restart. There is no upload button.
- One file in `DB_lab_project/DB_image/` is misnamed: `Harry Potter and the Philosopher's Stone.jpg`
  (top level) is actually the *Chamber of Secrets* book cover. The app uses the correct poster from
  `Harry potter universe/`, but the stray file can be deleted.
