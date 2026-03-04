CREATE TABLE `websites`(
    `id` BIGINT NOT NULL,
    `uuid` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `deleted_at` DATETIME NOT NULL,
    `managed_by_database_connection` VARCHAR(255) NULL
);
CREATE TABLE `hostnames`(
    `id` BIGINT NOT NULL,
    `fqdn` VARCHAR(255) NOT NULL,
    `redirect_to` VARCHAR(255) NULL,
    `force_https` BOOLEAN NOT NULL,
    `under_maintenance_since` TIMESTAMP NULL,
    `website_id` BIGINT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `deleted_at` DATETIME NOT NULL
);
ALTER TABLE
    `hostnames` ADD UNIQUE `hostnames_fqdn_unique`(`fqdn`);
ALTER TABLE
    `hostnames` ADD CONSTRAINT `hostnames_website_id_foreign` FOREIGN KEY(`website_id`) REFERENCES `websites`(`id`);