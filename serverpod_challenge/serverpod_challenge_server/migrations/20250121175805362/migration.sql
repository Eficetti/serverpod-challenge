BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "user_tags" CASCADE;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "tag" DROP COLUMN "users";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "user" DROP COLUMN "tags";
--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_tag" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "tagId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "user_tag_idx" ON "user_tag" USING btree ("userId", "tagId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_tag"
    ADD CONSTRAINT "user_tag_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "user_tag"
    ADD CONSTRAINT "user_tag_fk_1"
    FOREIGN KEY("tagId")
    REFERENCES "tag"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR serverpod_challenge
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_challenge', '20250121175805362', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250121175805362', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
