BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tag" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "image" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "users" json NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "address" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "tag" json NOT NULL
);


--
-- MIGRATION VERSION FOR serverpod_challenge
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_challenge', '20250120230145857', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250120230145857', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
