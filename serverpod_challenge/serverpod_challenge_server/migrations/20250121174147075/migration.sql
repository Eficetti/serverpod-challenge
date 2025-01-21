BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "tag" DROP CONSTRAINT "tag_fk_0";
ALTER TABLE "tag" DROP COLUMN "_userTagsUserId";
ALTER TABLE "tag" ADD COLUMN "users" json;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "user" DROP CONSTRAINT "user_fk_0";
ALTER TABLE "user" DROP COLUMN "_tagUsersTagId";
ALTER TABLE "user" ADD COLUMN "tags" json;

--
-- MIGRATION VERSION FOR serverpod_challenge
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_challenge', '20250121174147075', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250121174147075', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
