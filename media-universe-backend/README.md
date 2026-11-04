# Media Universe — app & API reference

Node.js + Express + mysql2 app for the `MediaDB` database. The frontend lives in `public/`
and is served by the same server. **Setup, the demo script and the rubric checklist are in the
[project README](../README.md).** This file is the technical reference.

```
app.js                      mounts routers, serves public/ and the thumbnails, error handler
db.js                       mysql2 pool — settings from .env, connects as media_app
thumbnails.js               links pictures in DB_lab_project to media / books by file name
.env.example                copy to .env (never commit .env)
middleware/auth.js          login tokens + requireLogin / requireRole
middleware/errors.js        generic 500 answers (real error only in the terminal)
controllers/media.query.js  the shared "Media joined table" SELECT
controllers/*.controller.js one file per feature
routes/*.routes.js          URL -> controller function, and who may call it
sql/seed_staff_accounts.sql demo admin and developer accounts (bcrypt hashes)
sql/routines.sql            stored procedure get_universe_media + trigger media_inherit_universe
sql/visits.sql              JSON column Media.visits: visits per day to an information page
sql/app_user.sql            least-privilege MySQL account media_app
public/                     the 10 pages (HTML + css/style.css + js/)
curl-commands.txt           ready-to-paste curl commands for every endpoint
```

## Configuration (`.env`)

```
DB_HOST=localhost
DB_USER=media_app            # from sql/app_user.sql — never root
DB_PASS="MediaApp#2026"      # quoted because of the #
DB_NAME=MediaDB
PORT=4500
```

`media_app` has only `SELECT, INSERT, UPDATE, DELETE, EXECUTE` on `MediaDB`, so the app
cannot `DROP`, `ALTER` or `CREATE` anything. `EXECUTE` is needed for `CALL get_universe_media`.

## Roles

Roles come from the disjoint subtypes of `User`: `Normal_User` → `user`, `Admin` → `admin`,
`Developer` → `developer`. Every protected route checks the role on the server
(`requireRole` in the router). Hiding buttons in the frontend is only for comfort.

| Can… | guest | user | admin | developer |
|---|:-:|:-:|:-:|:-:|
| browse, search, genres, universes, information page | ✓ | ✓ | ✓ | ✓ |
| keep a watchlist | | ✓ | | |
| add / edit / delete media, change genre, add / delete universe | | | ✓ | ✓ |
| statistics, see all accounts | | | ✓ | ✓ |
| change an account's role, delete an account | | | | ✓ |

## Logging in

`POST /accounts/login` returns `{ token, accountID, username, role }`. Protected routes need

```
Authorization: Bearer <token>
```

Passwords are bcrypt hashes (`bcrypt.hash(password, 10)` on register, `bcrypt.compare` on login),
60 characters, which fits `User.password VARCHAR(60)`. Wrong username and wrong password give the
same message. Tokens live in server memory: everyone logs in again after a restart, and a role
change or account deletion logs that account out immediately.

## Endpoints

| Flow / Page | Method & URL | Who | Notes |
|---|---|---|---|
| Home · Page 1 | `GET /media` | everyone | filters `type`, `genre`, `universe`, `category`, `country`, `status`, `sort=rating\|newest\|oldest\|title`, `limit` |
| 1 Search · Page 2 | `GET /media/search?q=` | everyone | title, synopsis, director, universe, genre, actor, book title, author · same filters |
| 2 Click banner · Page 3 | `GET /media/:id` | everyone | + subgenres, actors, platforms, books, sequel_of / sequels, remake_of / remakes, same_universe |
| 3 Select genre · Page 4 | `GET /genres` · `GET /genres/:id/media` | everyone | main **or** sub genre |
| 5 Create account · Page 5 | `POST /accounts/register` `{username, password, gmail}` | everyone | password ≥ 8 chars · `User` + `Normal_User` in one transaction |
| Log in / out | `POST /accounts/login` · `POST /accounts/logout` · `GET /accounts/me` | | `username` may also be the email |
| 9 Discover universe · Page 6 | `GET /universes` | everyone | top 10 |
| Universe page · Page 7 | `GET /universes/:id` | everyone | media from `CALL get_universe_media(?)` + books |
| | `POST /universes` `{universe_name}` | admin, developer | |
| | `DELETE /universes/:id` | admin, developer | its media are kept and become standalone (`universe_id = NULL`) |
| 4 Add to watchlist · Page 8 | `POST /watchlist` `{media_id}` | user | 409 if already added |
| Watchlist page | `GET /watchlist` | user | |
| 6 Remove from watchlist | `DELETE /watchlist/:mediaId` | user | |
| 7 Add media · Page 9 | `POST /media` | admin, developer | body below |
| Edit media · Page 9 | `PUT /media/:id` | admin, developer | send only the fields to change |
| Delete media · Page 9 | `DELETE /media/:id` | admin, developer | also clears watchlist / junction rows |
| 8 Change genre | `PUT /media/:id/genres` `{main_genre_id, subgenre_ids}` | admin, developer | |
| Count a visit | `POST /media/:id/visit` | everyone | called when the information page opens |
| 10 Statistics · Page 10 | `GET /stats` · `GET /stats/group?by=&sort=` · `GET /stats/visits?type=all\|movie\|series&days=7\|30\|90` · `GET /stats/media/:id` | admin, developer | |
| Inspect users | `GET /accounts` | admin, developer | never returns password hashes |
| Change role | `PUT /accounts/:id/role` `{role, contract?}` | **developer** | not your own account |
| Delete account | `DELETE /accounts/:id` | **developer** | not your own account |
| Edit-page dropdowns | `GET /lookups` | everyone | directors, genres, universes, actors, platforms, books |

### Body for `POST /media`

```json
{
  "title": "Harry Potter and the Cursed Child",
  "publish_date": "2027-07-01",
  "age_rating": "PG-13", "status": "Upcoming",
  "synopsis": "Albus Potter struggles with the weight of his family legacy.",
  "category": "Live action", "country": "UK", "rating": 0,
  "director_id": 4, "main_genre_id": 1,
  "universe_id": null, "sequel_parent_id": 8, "remake_parent_id": null,
  "type": "movie", "duration": 150,
  "subgenre_ids": [8, 5], "actor_ids": [1, 2], "platform_ids": [3], "isbns": []
}
```

`type` is `"movie"` (needs `duration` in minutes) or `"series"` (needs `episode_number`).
The four arrays are optional; on `PUT` a sent array replaces the old links.
`director_name` and `actor_names: []` can be sent instead of `director_id` and `actor_ids`:
an existing person is reused by name, and a new name is added to the table.
With `universe_id: null` and a `sequel_parent_id`, the trigger puts the new title in its
parent's universe (here: Harry Potter).

## Errors

Every error is JSON: `{ "error": "message" }`.

`200` ok · `201` created · `204` deleted · `400` bad input or unknown referenced id ·
`401` not logged in · `403` wrong role · `404` not found · `409` duplicate ·
`500` *"Something went wrong, please try again later"*.

A 500 never contains MySQL details; the real error is printed in the server terminal
(`middleware/errors.js`).

## SQL injection

Every value goes through a `?` placeholder (`pool.execute` / `pool.query` with a values array).
A few places must put a **name** into the SQL text — junction-table names, `ORDER BY` and
`GROUP BY` columns — because placeholders only work for values. Those names are only ever taken
from fixed lists in the code (`RELATIONS`, `SORTS`, `GROUP_BY`, `ROLE_TABLES`), never from the request.

## Thumbnails

Every media and book in a response has a `thumbnail` URL (or `null`).

| Folder | Served at |
|---|---|
| `DB_lab_project/DB_image`   | `/images/media/...` |
| `DB_lab_project/book_image` | `/images/books/...` |

`thumbnails.js` matches a file to a title by **file name**, ignoring case, accents, apostrophes and
punctuation (`Avengers- Endgame.jpg` → *Avengers: Endgame*). It tries `title year`, then `title`
(with or without a leading "The") for media, and `title volume`, then `title` for books.
If two files share a name, the one inside a sub-folder wins. Names that can't be guessed go in
`MEDIA_ALIASES` / `BOOK_ALIASES` at the top of `thumbnails.js`. Restart the server after adding pictures.
