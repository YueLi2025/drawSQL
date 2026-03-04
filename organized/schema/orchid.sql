CREATE TABLE `attachmentable`(
    `id` INT NOT NULL,
    `attachmentable_type` VARCHAR(255) NOT NULL,
    `attachmentable_id` INT NOT NULL,
    `attachment_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `attachmentable` ADD INDEX `attachmentable_attachmentable_type_attachmentable_id_index`(
        `attachmentable_type`,
        `attachmentable_id`
    );
ALTER TABLE
    `attachmentable` ADD INDEX `attachmentable_attachment_id_index`(`attachment_id`);
CREATE TABLE `attachments`(
    `id` INT NOT NULL,
    `name` TEXT NOT NULL,
    `original_name` TEXT NOT NULL,
    `mime` VARCHAR(255) NOT NULL,
    `extension` VARCHAR(255) NULL,
    `size` BIGINT NOT NULL,
    `sort` INT NOT NULL,
    `path` TEXT NOT NULL,
    `description` TEXT NULL,
    `alt` TEXT NULL,
    `hash` TEXT NULL,
    `disk` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NULL,
    `group` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `notifications`(
    `id` CHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `notifiable_type` VARCHAR(255) NOT NULL,
    `notifiable_id` BIGINT NOT NULL,
    `data` TEXT NOT NULL,
    `read_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notifications` ADD INDEX `notifications_notifiable_type_notifiable_id_index`(`notifiable_type`, `notifiable_id`);
CREATE TABLE `role_users`(
    `user_id` BIGINT NOT NULL,
    `role_id` INT NOT NULL,
    PRIMARY KEY(`user_id`, `role_id`)
);
ALTER TABLE
    `role_users` ADD INDEX `role_users_role_id_index`(`role_id`);
CREATE TABLE `roles`(
    `id` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `permissions` JSON NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `roles` ADD UNIQUE `roles_slug_unique`(`slug`);
CREATE TABLE `settings`(
    `key` VARCHAR(255) NOT NULL,
    `value` JSON NOT NULL,
    PRIMARY KEY(`key`)
);
CREATE TABLE `users`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `email_verified_at` TIMESTAMP NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `last_login` TIMESTAMP NULL,
    `permissions` JSON NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `attachmentable` ADD CONSTRAINT `attachmentable_attachment_id_foreign` FOREIGN KEY(`attachment_id`) REFERENCES `attachments`(`id`);
ALTER TABLE
    `role_users` ADD CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `role_users` ADD CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_notifiable_id_foreign` FOREIGN KEY(`notifiable_id`) REFERENCES `users`(`id`);