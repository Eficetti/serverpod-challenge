BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "tag" ALTER COLUMN "image" DROP NOT NULL;

--
-- MIGRATION VERSION FOR serverpod_challenge
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_challenge', '20250121174014794', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250121174014794', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
