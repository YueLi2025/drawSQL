CREATE TABLE `permission_role`(
    `permission_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    PRIMARY KEY(`permission_id`, `role_id`)
);
ALTER TABLE
    `permission_role` ADD INDEX `permission_role_role_id_index`(`role_id`);
CREATE TABLE `permission_user`(
    `permission_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `user_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(
        `permission_id`,
        `user_id`,
        `user_type`
    )
);
ALTER TABLE
    `permission_user` ADD INDEX `permission_user_permission_id_index`(`permission_id`);
CREATE TABLE `permissions`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `permissions` ADD UNIQUE `permissions_name_unique`(`name`);
CREATE TABLE `role_user`(
    `role_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `user_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`role_id`, `user_id`, `user_type`)
);
ALTER TABLE
    `role_user` ADD INDEX `role_user_role_id_index`(`role_id`);
CREATE TABLE `roles`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `roles` ADD UNIQUE `roles_name_unique`(`name`);
CREATE TABLE `users`(
    `id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `permission_user` ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `role_user` ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `permission_user` ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `role_user` ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);