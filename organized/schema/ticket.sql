CREATE TABLE `permissions`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `guard_name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `roles`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `guard_name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `model_has_permissions`(
    `permission_id` BIGINT NOT NULL,
    `model_type` VARCHAR(255) NOT NULL,
    `model_id` INT NOT NULL,
    PRIMARY KEY(
        `permission_id`,
        `model_id`,
        `model_type`
    )
);
ALTER TABLE
    `model_has_permissions` ADD INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`);
ALTER TABLE
    `model_has_permissions` ADD PRIMARY KEY(`permission_id`);
CREATE TABLE `model_has_roles`(
    `role_id` BIGINT NOT NULL,
    `model_type` VARCHAR(255) NOT NULL,
    `model_id` INT NOT NULL,
    PRIMARY KEY(`role_id`, `model_id`, `model_type`)
);
ALTER TABLE
    `model_has_roles` ADD INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`);
ALTER TABLE
    `model_has_roles` ADD PRIMARY KEY(`role_id`);
CREATE TABLE `role_has_permissions`(
    `permission_id` BIGINT NOT NULL,
    `role_id` BIGINT NOT NULL,
    PRIMARY KEY(`permission_id`, `role_id`)
);
ALTER TABLE
    `role_has_permissions` ADD PRIMARY KEY(`permission_id`);
ALTER TABLE
    `role_has_permissions` ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `role_has_permissions` ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `model_has_roles` ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `model_has_permissions` ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);