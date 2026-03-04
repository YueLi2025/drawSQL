CREATE TABLE `role_user`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `role_id` INT UNSIGNED NULL,
    `user_id` INT UNSIGNED NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `role_user` ADD INDEX `role_user_role_id_index`(`role_id`);
ALTER TABLE
    `role_user` ADD INDEX `role_user_user_id_index`(`user_id`);
CREATE TABLE `roles`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `roles` ADD UNIQUE `roles_slug_unique`(`slug`);
ALTER TABLE
    `roles` ADD UNIQUE `roles_name_unique`(`name`);
CREATE TABLE `permissions`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `permissions` ADD UNIQUE `permissions_slug_unique`(`slug`);
ALTER TABLE
    `permissions` ADD UNIQUE `permissions_name_unique`(`name`);
CREATE TABLE `permission_role`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `permission_id` INT UNSIGNED NULL,
    `role_id` INT UNSIGNED NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `permission_role` ADD INDEX `permission_role_permission_id_index`(`permission_id`);
ALTER TABLE
    `permission_role` ADD INDEX `permission_role_role_id_index`(`role_id`);
CREATE TABLE `permission_user`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `permission_id` INT UNSIGNED NULL,
    `user_id` INT UNSIGNED NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `permission_user` ADD INDEX `permission_user_permission_id_index`(`permission_id`);
ALTER TABLE
    `permission_user` ADD INDEX `permission_user_user_id_index`(`user_id`);
CREATE TABLE `users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `role_user` ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `role_user` ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `permission_user` ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `permission_user` ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);