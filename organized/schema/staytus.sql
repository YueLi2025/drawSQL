CREATE TABLE `api_tokens`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `token` VARCHAR(255) NULL,
    `secret` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `delayed_jobs`(
    `id` INT NOT NULL,
    `priority` INT NOT NULL,
    `attempts` INT NOT NULL,
    `handler` TEXT NOT NULL,
    `last_error` TEXT NULL,
    `run_at` DATETIME NULL,
    `locked_at` DATETIME NULL,
    `failed_at` DATETIME NULL,
    `locked_by` VARCHAR(255) NULL,
    `queue` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `delayed_jobs` ADD INDEX `delayed_jobs_priority_run_at_index`(`priority`, `run_at`);
CREATE TABLE `email_templates`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `subject` VARCHAR(255) NULL,
    `content` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `history_items`(
    `id` INT NOT NULL,
    `item_type` VARCHAR(255) NULL,
    `item_id` INT NULL,
    `date` DATETIME NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `issue_service_joins`(
    `id` INT NOT NULL,
    `issue_id` INT NULL,
    `service_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `issue_updates`(
    `id` INT NOT NULL,
    `issue_id` INT NULL,
    `user_id` INT NULL,
    `service_status_id` INT NULL,
    `state` VARCHAR(255) NULL,
    `text` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `identifier` VARCHAR(255) NULL,
    `notify` TINYINT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `issues`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NULL,
    `state` VARCHAR(255) NULL,
    `service_status_id` INT NULL,
    `all_services` TINYINT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `user_id` INT NULL,
    `identifier` VARCHAR(255) NULL,
    `notify` TINYINT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `maintenance_service_joins`(
    `id` INT NOT NULL,
    `maintenance_id` INT NULL,
    `service_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `maintenance_updates`(
    `id` INT NOT NULL,
    `maintenance_id` INT NULL,
    `user_id` INT NULL,
    `text` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `identifier` VARCHAR(255) NULL,
    `notify` TINYINT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `maintenances`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `start_at` DATETIME NULL,
    `finish_at` DATETIME NULL,
    `length_in_minutes` INT NULL,
    `user_id` INT NULL,
    `service_status_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `closed_at` DATETIME NULL,
    `identifier` VARCHAR(255) NULL,
    `notify` TINYINT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `nifty_attachments`(
    `id` INT NOT NULL,
    `parent_id` INT NULL,
    `parent_type` VARCHAR(255) NULL,
    `token` VARCHAR(255) NULL,
    `digest` VARCHAR(255) NULL,
    `role` VARCHAR(255) NULL,
    `file_name` VARCHAR(255) NULL,
    `file_type` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `schema_migrations`(
    `version` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`version`)
);
CREATE TABLE `service_groups`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `service_statuses`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `permalink` VARCHAR(255) NULL,
    `color` VARCHAR(255) NULL,
    `status_type` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `services`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `permalink` VARCHAR(255) NULL,
    `position` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `status_id` INT NULL,
    `description` TEXT NULL,
    `group_id` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `sites`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `domain` VARCHAR(255) NULL,
    `support_email` VARCHAR(255) NULL,
    `website_url` VARCHAR(255) NULL,
    `time_zone` VARCHAR(255) NULL,
    `crawling_permitted` TINYINT NULL,
    `email_from_name` VARCHAR(255) NULL,
    `email_from_address` VARCHAR(255) NULL,
    `allow_subscriptions` TINYINT NULL,
    `http_protocol` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `subscribers`(
    `id` INT NOT NULL,
    `email_address` VARCHAR(255) NULL,
    `verification_token` VARCHAR(255) NULL,
    `verified_at` DATETIME NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `email_address` VARCHAR(255) NULL,
    `name` VARCHAR(255) NULL,
    `password_digest` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `issues` ADD CONSTRAINT `issues_service_status_id_foreign` FOREIGN KEY(`service_status_id`) REFERENCES `service_statuses`(`id`);
ALTER TABLE
    `issues` ADD CONSTRAINT `issues_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `maintenance_service_joins` ADD CONSTRAINT `maintenance_service_joins_maintenance_id_foreign` FOREIGN KEY(`maintenance_id`) REFERENCES `maintenances`(`id`);
ALTER TABLE
    `issue_updates` ADD CONSTRAINT `issue_updates_service_status_id_foreign` FOREIGN KEY(`service_status_id`) REFERENCES `service_statuses`(`id`);
ALTER TABLE
    `issue_updates` ADD CONSTRAINT `issue_updates_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `issue_updates` ADD CONSTRAINT `issue_updates_issue_id_foreign` FOREIGN KEY(`issue_id`) REFERENCES `issues`(`id`);
ALTER TABLE
    `maintenance_updates` ADD CONSTRAINT `maintenance_updates_maintenance_id_foreign` FOREIGN KEY(`maintenance_id`) REFERENCES `maintenances`(`id`);
ALTER TABLE
    `issue_service_joins` ADD CONSTRAINT `issue_service_joins_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `services`(`id`);
ALTER TABLE
    `issue_service_joins` ADD CONSTRAINT `issue_service_joins_issue_id_foreign` FOREIGN KEY(`issue_id`) REFERENCES `issues`(`id`);
ALTER TABLE
    `maintenances` ADD CONSTRAINT `maintenances_service_status_id_foreign` FOREIGN KEY(`service_status_id`) REFERENCES `service_statuses`(`id`);
ALTER TABLE
    `maintenance_service_joins` ADD CONSTRAINT `maintenance_service_joins_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `services`(`id`);
ALTER TABLE
    `maintenance_updates` ADD CONSTRAINT `maintenance_updates_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `maintenances` ADD CONSTRAINT `maintenances_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);