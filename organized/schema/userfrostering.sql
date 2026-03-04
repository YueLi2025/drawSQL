CREATE TABLE `activities`(
    `id` INT NOT NULL,
    `ip_address` VARCHAR(255) NULL,
    `user_id` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `occurred_at` TIMESTAMP NULL,
    `description` TEXT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `groups`(
    `id` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `icon` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `password_resets`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `hash` VARCHAR(255) NOT NULL,
    `completed` TINYINT NOT NULL,
    `expires_at` TIMESTAMP NULL,
    `completed_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `permission_roles`(
    `permission_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `roles`(
    `id` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `permissions`(
    `id` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `conditions` TEXT NOT NULL,
    `description` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `persistences`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `persistent_token` VARCHAR(255) NOT NULL,
    `expires_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `role_users`(
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `user_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `locale` VARCHAR(255) NOT NULL,
    `theme` VARCHAR(255) NULL,
    `group_id` INT NOT NULL,
    `flag_verified` TINYINT NOT NULL,
    `flag_enabled` TINYINT NOT NULL,
    `last_activity_id` INT NULL,
    `password` VARCHAR(255) NOT NULL,
    `deleted_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `verifications`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `hash` VARCHAR(255) NOT NULL,
    `completed` TINYINT NOT NULL,
    `expires_at` TIMESTAMP NULL,
    `completed_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `sessions`(
    `id` VARCHAR(255) NOT NULL,
    `user_id` INT NULL,
    `ip_address` VARCHAR(255) NULL,
    `user_agent` TEXT NULL,
    `payload` TEXT NOT NULL,
    `last_activity` INT NOT NULL
);
CREATE TABLE `throttles`(
    `id` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `ip` VARCHAR(255) NULL,
    `request_data` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `role_users` ADD CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `persistences` ADD CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `sessions` ADD CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `permission_roles` ADD CONSTRAINT `permission_roles_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `password_resets` ADD CONSTRAINT `password_resets_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `role_users` ADD CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `verifications` ADD CONSTRAINT `verifications_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `activities` ADD CONSTRAINT `activities_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `permission_roles` ADD CONSTRAINT `permission_roles_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `groups`(`id`);