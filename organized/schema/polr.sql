CREATE TABLE `clicks`(
    `id` INT NOT NULL,
    `ip` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NULL,
    `referer` VARCHAR(255) NULL,
    `referer_host` VARCHAR(255) NULL,
    `user_agent` TEXT NULL,
    `link_id` INT NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `clicks` ADD INDEX `clicks_ip_index`(`ip`);
ALTER TABLE
    `clicks` ADD INDEX `clicks_referer_host_index`(`referer_host`);
ALTER TABLE
    `clicks` ADD INDEX `clicks_link_id_index`(`link_id`);
CREATE TABLE `links`(
    `id` INT NOT NULL,
    `short_url` VARCHAR(255) NOT NULL,
    `long_url` LONGTEXT NOT NULL,
    `ip` VARCHAR(255) NOT NULL,
    `creator` VARCHAR(255) NOT NULL,
    `clicks` INT NOT NULL,
    `secret_key` VARCHAR(255) NOT NULL,
    `is_disabled` TINYINT NOT NULL,
    `is_custom` TINYINT NOT NULL,
    `is_api` TINYINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    `long_url_hash` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `links` ADD INDEX `links_creator_is_api_created_at_index`(`creator`, `is_api`, `created_at`);
ALTER TABLE
    `links` ADD UNIQUE `links_short_url_unique`(`short_url`);
ALTER TABLE
    `links` ADD INDEX `links_long_url_hash_index`(`long_url_hash`);
CREATE TABLE `migrations`(
    `migration` VARCHAR(255) NOT NULL,
    `batch` INT NOT NULL
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `ip` TEXT NOT NULL,
    `recovery_key` VARCHAR(255) NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `active` VARCHAR(255) NOT NULL,
    `api_key` VARCHAR(255) NULL,
    `api_active` TINYINT NOT NULL,
    `api_quota` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_username_unique`(`username`);
ALTER TABLE
    `clicks` ADD CONSTRAINT `clicks_link_id_foreign` FOREIGN KEY(`link_id`) REFERENCES `links`(`id`);
ALTER TABLE
    `links` ADD CONSTRAINT `links_creator_foreign` FOREIGN KEY(`creator`) REFERENCES `users`(`id`);