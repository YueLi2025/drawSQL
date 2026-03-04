CREATE TABLE `personal_access_tokens`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tokenable_type` VARCHAR(255) UNSIGNED NOT NULL,
    `tokenable_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) UNSIGNED NOT NULL,
    `token` VARCHAR(255) UNSIGNED NOT NULL,
    `abilities` TEXT UNSIGNED NULL,
    `last_used_at` TIMESTAMP UNSIGNED NULL,
    `created_at` TIMESTAMP UNSIGNED NULL,
    `updated_at` TIMESTAMP UNSIGNED NULL
);
ALTER TABLE
    `personal_access_tokens` ADD INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`);
CREATE TABLE `team_user`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `team_id` CHAR(255) UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `role` VARCHAR(255) UNSIGNED NULL,
    `created_at` TIMESTAMP UNSIGNED NULL,
    `updated_at` TIMESTAMP UNSIGNED NULL
);
ALTER TABLE
    `team_user` ADD UNIQUE `team_user_team_id_user_id_unique`(`team_id`, `user_id`);
CREATE TABLE `teams`(
    `id` CHAR(255) UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'Owner of the team',
    `name` VARCHAR(255) UNSIGNED NOT NULL,
    `personal_team` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `created_at` TIMESTAMP UNSIGNED NULL,
    `updated_at` TIMESTAMP UNSIGNED NULL
);
ALTER TABLE
    `teams` ADD INDEX `teams_user_id_index`(`user_id`);
CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) UNSIGNED NOT NULL,
    `email` VARCHAR(255) UNSIGNED NOT NULL,
    `email_verified_at` TIMESTAMP UNSIGNED NULL,
    `password` VARCHAR(255) UNSIGNED NOT NULL,
    `two_factor_secret` TEXT UNSIGNED NULL,
    `two_factor_recovery_codes` TEXT UNSIGNED NULL,
    `remember_token` VARCHAR(255) UNSIGNED NULL,
    `current_team_id` VARCHAR(255) UNSIGNED NULL COMMENT 'User\'s active team',
    `profile_photo_path` TEXT UNSIGNED NULL,
    `created_at` TIMESTAMP UNSIGNED NULL,
    `updated_at` TIMESTAMP UNSIGNED NULL
);
ALTER TABLE
    `teams` ADD CONSTRAINT `teams_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `team_user` ADD CONSTRAINT `team_user_team_id_foreign` FOREIGN KEY(`team_id`) REFERENCES `teams`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_current_team_id_foreign` FOREIGN KEY(`current_team_id`) REFERENCES `teams`(`id`);
ALTER TABLE
    `personal_access_tokens` ADD CONSTRAINT `personal_access_tokens_tokenable_id_foreign` FOREIGN KEY(`tokenable_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `team_user` ADD CONSTRAINT `team_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);