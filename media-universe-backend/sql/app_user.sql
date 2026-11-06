-- sql/app_user.sql — least-privilege MySQL account for the Node app (run as root).
-- The app can only read and change rows and CALL procedures. It cannot DROP,
-- ALTER or CREATE anything, so even a bug cannot destroy the schema.
-- Use the same password here and in .env (DB_PASS).
DROP USER IF EXISTS 'media_dev'@'localhost';
CREATE USER 'media_dev'@'localhost' IDENTIFIED BY 'dev12345';
GRANT ALL PRIVILEGES ON MediaDB.* TO 'media_dev'@'localhost';
SHOW GRANTS FOR 'media_dev'@'localhost';

DROP USER IF EXISTS 'media_admin'@'localhost';
CREATE USER 'media_admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON MediaDB.* TO 'media_admin'@'localhost';
SHOW GRANTS FOR 'media_admin'@'localhost';

DROP USER IF EXISTS 'media_universe'@'localhost';
CREATE USER 'media_universe'@'localhost' IDENTIFIED BY 'admin123';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON MediaDB.watchlist TO 'media_universe'@'localhost';
SHOW GRANTS FOR 'media_universe'@'localhost';