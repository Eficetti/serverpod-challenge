BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "tag" DROP COLUMN "users";
ALTER TABLE "tag" ADD COLUMN "_userTagsUserId" bigint;
ALTER TABLE "tag" ALTER COLUMN "image" SET DEFAULT 'default.jpg'::text;
ALTER TABLE ONLY "tag"
    ADD CONSTRAINT "tag_fk_0"
    FOREIGN KEY("_userTagsUserId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "user" DROP COLUMN "tag";
ALTER TABLE "user" ADD COLUMN "_tagUsersTagId" bigint;
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_0"
    FOREIGN KEY("_tagUsersTagId")
    REFERENCES "tag"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_tags" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "tagId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_tag_idx" ON "user_tags" USING btree ("userId", "tagId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_tags"
    ADD CONSTRAINT "user_tags_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "user_tags"
    ADD CONSTRAINT "user_tags_fk_1"
    FOREIGN KEY("tagId")
    REFERENCES "tag"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR serverpod_challenge
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_challenge', '20250121003608284', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250121003608284', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
