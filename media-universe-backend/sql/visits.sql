-- sql/visits.sql — visit counts for each information page (run as root, AFTER MediaDB_ALL_IN_ONE.sql).
-- A JSON object of counts per day, e.g. {"2026-11-01": 3}, not a single counter, so the
-- Statistics page can plot visits over time. NULL until the first visit.
USE MediaDB;

ALTER TABLE Media ADD COLUMN visits JSON NULL;
