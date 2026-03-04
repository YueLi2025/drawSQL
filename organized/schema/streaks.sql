CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `level_id` BIGINT NULL
);
CREATE TABLE `streaks`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `activity_id` BIGINT NOT NULL,
    `count` INT NOT NULL DEFAULT '1',
    `activity_at` DATETIME NOT NULL,
    `frozen_until` DATETIME NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
CREATE TABLE `streak_histories`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `streak_activity_id` BIGINT UNSIGNED NOT NULL,
    `count` INT NOT NULL DEFAULT '1',
    `started_at` DATETIME NOT NULL,
    `ended_at` DATETIME NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
CREATE TABLE `streak_activities`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `streak_activities` ADD UNIQUE `streak_activities_name_unique`(`name`);
CREATE TABLE `levels`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `level` INT NOT NULL,
    `next_level_experience` INT NULL,
    `created_at` BIGINT NOT NULL,
    `updated_at` BIGINT NOT NULL
);
ALTER TABLE
    `levels` ADD UNIQUE `levels_level_unique`(`level`);
ALTER TABLE
    `levels` ADD INDEX `levels_next_level_experience_index`(`next_level_experience`);
CREATE TABLE `experiences`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `level_id` BIGINT NOT NULL,
    `experience_points` INT NOT NULL DEFAULT '0',
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `experiences` ADD INDEX `experiences_experience_points_index`(`experience_points`);
CREATE TABLE `experience_audits`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `points` INT NOT NULL,
    `levelled_up` BOOLEAN NOT NULL DEFAULT '0',
    `level_to` INT NULL,
    `type` ENUM('') NOT NULL,
    `reason` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `experience_audits` ADD INDEX `experience_audits_points_index`(`points`);
CREATE TABLE `achievements`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `is_secret` BOOLEAN NOT NULL DEFAULT '0',
    `description` TEXT NULL,
    `image` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
CREATE TABLE `achievement_user`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `achievement_id` BIGINT NOT NULL,
    `progress` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `achievement_user` ADD INDEX `achievement_user_progress_index`(`progress`);
ALTER TABLE
    `streak_histories` ADD CONSTRAINT `streak_histories_streak_activity_id_foreign` FOREIGN KEY(`streak_activity_id`) REFERENCES `streak_activities`(`id`);
ALTER TABLE
    `experiences` ADD CONSTRAINT `experiences_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `achievement_user` ADD CONSTRAINT `achievement_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `streaks` ADD CONSTRAINT `streaks_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `streak_histories` ADD CONSTRAINT `streak_histories_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `streaks` ADD CONSTRAINT `streaks_activity_id_foreign` FOREIGN KEY(`activity_id`) REFERENCES `streak_activities`(`id`);
ALTER TABLE
    `experience_audits` ADD CONSTRAINT `experience_audits_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_level_id_foreign` FOREIGN KEY(`level_id`) REFERENCES `levels`(`id`);
ALTER TABLE
    `achievement_user` ADD CONSTRAINT `achievement_user_achievement_id_foreign` FOREIGN KEY(`achievement_id`) REFERENCES `achievements`(`id`);
ALTER TABLE
    `experiences` ADD CONSTRAINT `experiences_level_id_foreign` FOREIGN KEY(`level_id`) REFERENCES `levels`(`id`);