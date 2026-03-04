CREATE TABLE `users`(
    `id` BIGINT NOT NULL,
    `avatar` VARCHAR(255) NULL,
    `role_id` BIGINT NULL,
    `settings` TEXT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `data_types`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `display_name_singular` VARCHAR(255) NOT NULL,
    `display_name_plural` VARCHAR(255) NOT NULL,
    `icon` VARCHAR(255) NULL,
    `model_name` VARCHAR(255) NULL,
    `policy_name` VARCHAR(255) NULL,
    `controller` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `generate_permissions` BOOLEAN NOT NULL,
    `server_side` TINYINT NOT NULL,
    `details` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `data_types` ADD UNIQUE `data_types_name_unique`(`name`);
ALTER TABLE
    `data_types` ADD UNIQUE `data_types_slug_unique`(`slug`);
CREATE TABLE `menus`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `menus` ADD UNIQUE `menus_name_unique`(`name`);
CREATE TABLE `menu_items`(
    `id` INT NOT NULL,
    `menu_id` INT NULL,
    `title` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `target` VARCHAR(255) NOT NULL,
    `icon_class` VARCHAR(255) NULL,
    `color` VARCHAR(255) NULL,
    `parent_id` INT NULL,
    `order` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `route` VARCHAR(255) NULL,
    `parameters` TEXT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `roles`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `roles` ADD UNIQUE `roles_name_unique`(`name`);
CREATE TABLE `settings`(
    `id` INT NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NOT NULL,
    `value` TEXT NULL,
    `details` TEXT NULL,
    `type` VARCHAR(255) NOT NULL,
    `order` INT NOT NULL,
    `group` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `settings` ADD UNIQUE `settings_key_unique`(`key`);
CREATE TABLE `permissions`(
    `id` BIGINT NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `table_name` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `permissions` ADD INDEX `permissions_key_index`(`key`);
CREATE TABLE `permission_role`(
    `permission_id` BIGINT NOT NULL,
    `role_id` BIGINT NOT NULL,
    PRIMARY KEY(`permission_id`, `role_id`)
);
ALTER TABLE
    `permission_role` ADD INDEX `permission_role_permission_id_index`(`permission_id`);
ALTER TABLE
    `permission_role` ADD INDEX `permission_role_role_id_index`(`role_id`);
CREATE TABLE `translations`(
    `id` INT NOT NULL,
    `table_name` VARCHAR(255) NOT NULL,
    `column_name` VARCHAR(255) NOT NULL,
    `foreign_key` INT NOT NULL,
    `locale` VARCHAR(255) NOT NULL,
    `value` TEXT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `translations` ADD UNIQUE `translations_table_name_column_name_foreign_key_locale_unique`(
        `table_name`,
        `column_name`,
        `foreign_key`,
        `locale`
    );
CREATE TABLE `data_rows`(
    `id` INT NOT NULL,
    `data_type_id` INT NOT NULL,
    `field` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NOT NULL,
    `required` BOOLEAN NOT NULL,
    `browse` BOOLEAN NOT NULL,
    `read` BOOLEAN NOT NULL,
    `edit` BOOLEAN NOT NULL,
    `add` BOOLEAN NOT NULL,
    `delete` BOOLEAN NOT NULL,
    `details` TEXT NULL,
    `order` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `user_roles`(
    `user_id` BIGINT NOT NULL,
    `role_id` BIGINT NOT NULL,
    PRIMARY KEY(`user_id`, `role_id`)
);
ALTER TABLE
    `user_roles` ADD INDEX `user_roles_user_id_index`(`user_id`);
ALTER TABLE
    `user_roles` ADD INDEX `user_roles_role_id_index`(`role_id`);
ALTER TABLE
    `menu_items` ADD CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY(`parent_id`) REFERENCES `menu_items`(`id`);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `user_roles` ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `menu_items` ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY(`menu_id`) REFERENCES `menus`(`id`);
ALTER TABLE
    `user_roles` ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `data_rows` ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY(`data_type_id`) REFERENCES `data_types`(`id`);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);