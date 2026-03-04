CREATE TABLE `api_keys`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_keys` ADD UNIQUE `api_keys_key_unique`(`key`);
ALTER TABLE
    `api_keys` ADD INDEX `api_keys_user_id_index`(`user_id`);
CREATE TABLE `api_log`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `api_key_id` INT NULL,
    `images` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_log` ADD INDEX `api_log_user_id_index`(`user_id`);
CREATE TABLE `migrations`(
    `id` INT NOT NULL,
    `migration` VARCHAR(255) NOT NULL,
    `batch` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL
);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_email_index`(`email`);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_token_index`(`token`);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NULL,
    `provider` VARCHAR(255) NULL,
    `provider_id` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    `name` VARCHAR(255) NULL,
    `password` VARCHAR(255) NULL,
    `remember_token` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `api_log` ADD CONSTRAINT `api_log_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `api_keys` ADD CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);