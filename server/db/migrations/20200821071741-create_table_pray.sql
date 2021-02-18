-- +migrate Up
CREATE TABLE IF NOT EXISTS "prays"
(
    "id"         char(36) PRIMARY KEY NOT NULL DEFAULT (uuid_generate_v4()),
    "name"       varchar(50)          NOT NULL,
    "file_id"    char(36)             NOT NULL,
    "is_active"  bool,
    "created_at" timestamp            NOT NULL,
    "updated_at" timestamp            NOT NULL,
    "deleted_at" timestamp
);

-- +migrate Down
DROP TABLE IF EXISTS "prays";