CREATE TABLE `abilities`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NULL,
    `entity_id` BIGINT NULL,
    `entity_type` VARCHAR(255) NULL,
    `only_owned` TINYINT NOT NULL,
    `options` JSON NULL,
    `scope` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `abilities` ADD INDEX `abilities_scope_index`(`scope`);
CREATE TABLE `assigned_roles`(
    `id` BIGINT NOT NULL,
    `role_id` BIGINT NOT NULL,
    `entity_id` BIGINT NOT NULL,
    `entity_type` VARCHAR(255) NOT NULL,
    `restricted_to_id` BIGINT NULL,
    `restricted_to_type` VARCHAR(255) NULL,
    `scope` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `assigned_roles` ADD INDEX `assigned_roles_entity_id_entity_type_scope_index`(`entity_id`, `entity_type`, `scope`);
ALTER TABLE
    `assigned_roles` ADD INDEX `assigned_roles_role_id_index`(`role_id`);
ALTER TABLE
    `assigned_roles` ADD INDEX `assigned_roles_scope_index`(`scope`);
CREATE TABLE `permissions`(
    `id` BIGINT NOT NULL,
    `ability_id` BIGINT NOT NULL,
    `entity_id` BIGINT NULL,
    `entity_type` VARCHAR(255) NULL,
    `forbidden` TINYINT NOT NULL,
    `scope` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `permissions` ADD INDEX `permissions_entity_id_entity_type_scope_index`(`entity_id`, `entity_type`, `scope`);
ALTER TABLE
    `permissions` ADD INDEX `permissions_ability_id_index`(`ability_id`);
ALTER TABLE
    `permissions` ADD INDEX `permissions_scope_index`(`scope`);
CREATE TABLE `roles`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NULL,
    `level` INT NULL,
    `scope` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `roles` ADD UNIQUE `roles_name_scope_unique`(`name`, `scope`);
ALTER TABLE
    `roles` ADD INDEX `roles_scope_index`(`scope`);
ALTER TABLE
    `permissions` ADD CONSTRAINT `permissions_ability_id_foreign` FOREIGN KEY(`ability_id`) REFERENCES `abilities`(`id`);
ALTER TABLE
    `assigned_roles` ADD CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);