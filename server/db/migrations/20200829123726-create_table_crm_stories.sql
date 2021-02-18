-- +migrate Up
CREATE TABLE IF NOT EXISTS "crm_stories"
(
    "id"         char(36) PRIMARY KEY NOT NULL DEFAULT (uuid_generate_v4()),
    "slug"       varchar(255)         NOT NULL,
    "name"       varchar(50)          NOT NULL,
    "created_at" timestamp            NOT NULL,
    "updated_at" timestamp            NOT NULL,
    "deleted_at" timestamp
);

-- +migrate Down
DROP TABLE IF EXISTS "crm_stories";