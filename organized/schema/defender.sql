CREATE TABLE `roles`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `roles` ADD UNIQUE `roles_name_unique`(`name`);
CREATE TABLE `permissions`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `readable_name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `permissions` ADD UNIQUE `permissions_name_unique`(`name`);
CREATE TABLE `role_user`(
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL
);
ALTER TABLE
    `role_user` ADD INDEX `role_user_user_id_index`(`user_id`);
ALTER TABLE
    `role_user` ADD INDEX `role_user_role_id_index`(`role_id`);
CREATE TABLE `permission_role`(
    `permission_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    `value` TINYINT NOT NULL,
    `expires` TIMESTAMP NULL
);
ALTER TABLE
    `permission_role` ADD INDEX `permission_role_permission_id_index`(`permission_id`);
ALTER TABLE
    `permission_role` ADD INDEX `permission_role_role_id_index`(`role_id`);
CREATE TABLE `permission_user`(
    `user_id` INT NOT NULL,
    `permission_id` INT NOT NULL,
    `value` TINYINT NOT NULL,
    `expires` TIMESTAMP NULL
);
ALTER TABLE
    `permission_user` ADD INDEX `permission_user_user_id_index`(`user_id`);
ALTER TABLE
    `permission_user` ADD INDEX `permission_user_permission_id_index`(`permission_id`);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `role_user` ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `permission_user` ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `role_user` ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `permission_user` ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);