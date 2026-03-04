CREATE TABLE `features`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `active` BOOLEAN NOT NULL DEFAULT '1',
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `expires_at` DATETIME NULL
);
CREATE TABLE `feature_groups`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `active` BOOLEAN NOT NULL DEFAULT '1',
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `feature_feature_groups`(
    `feature_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `feature_group_id` BIGINT NOT NULL,
    PRIMARY KEY(`feature_id`, `feature_group_id`)
);
CREATE TABLE `feature_user`(
    `feature_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    PRIMARY KEY(`feature_id`, `user_id`)
);
CREATE TABLE `users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ``.``.``.`` INT NOT NULL
);
CREATE TABLE `feature_group_user`(
    `feature_group_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    PRIMARY KEY(`feature_group_id`, `user_id`)
);
ALTER TABLE
    `feature_user` ADD CONSTRAINT `feature_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `feature_group_user` ADD CONSTRAINT `feature_group_user_feature_group_id_foreign` FOREIGN KEY(`feature_group_id`) REFERENCES `feature_groups`(`id`);
ALTER TABLE
    `feature_group_user` ADD CONSTRAINT `feature_group_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `feature_feature_groups` ADD CONSTRAINT `feature_feature_groups_feature_id_foreign` FOREIGN KEY(`feature_id`) REFERENCES `features`(`id`);
ALTER TABLE
    `feature_user` ADD CONSTRAINT `feature_user_feature_id_foreign` FOREIGN KEY(`feature_id`) REFERENCES `features`(`id`);
ALTER TABLE
    `feature_feature_groups` ADD CONSTRAINT `feature_feature_groups_feature_group_id_foreign` FOREIGN KEY(`feature_group_id`) REFERENCES `feature_groups`(`id`);