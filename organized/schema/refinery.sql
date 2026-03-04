CREATE TABLE `ticketit_statuses`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `color` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `ticketit_priorities`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `color` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `ticketit_categories`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `color` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `ticketit_categories_users`(
    `category_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`category_id`)
);
CREATE TABLE `ticketit`(
    `id` INT NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `content` LONGTEXT NOT NULL,
    `html` LONGTEXT NULL,
    `status_id` INT NOT NULL,
    `priority_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `agent_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` BIGINT NOT NULL,
    `completed_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `ticketit` ADD INDEX `ticketit_subject_index`(`subject`);
ALTER TABLE
    `ticketit` ADD INDEX `ticketit_status_id_index`(`status_id`);
ALTER TABLE
    `ticketit` ADD INDEX `ticketit_priority_id_index`(`priority_id`);
ALTER TABLE
    `ticketit` ADD INDEX `ticketit_user_id_index`(`user_id`);
ALTER TABLE
    `ticketit` ADD INDEX `ticketit_agent_id_index`(`agent_id`);
ALTER TABLE
    `ticketit` ADD INDEX `ticketit_category_id_index`(`category_id`);
ALTER TABLE
    `ticketit` ADD INDEX `ticketit_completed_at_index`(`completed_at`);
CREATE TABLE `ticketit_comments`(
    `id` INT NOT NULL,
    `content` TEXT NOT NULL,
    `user_id` INT NOT NULL,
    `ticket_id` INT NOT NULL,
    `created_at` BIGINT NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `content` LONGTEXT NOT NULL,
    `html` LONGTEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `ticketit_comments` ADD INDEX `ticketit_comments_user_id_index`(`user_id`);
ALTER TABLE
    `ticketit_comments` ADD INDEX `ticketit_comments_ticket_id_index`(`ticket_id`);
CREATE TABLE `ticketit_audits`(
    `id` INT NOT NULL,
    `operation` TEXT NOT NULL,
    `user_id` INT NOT NULL,
    `ticket_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `ticketit_admin` BOOLEAN NOT NULL,
    `ticketit_agent` BOOLEAN NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `ticketit_settings`(
    `id` INT NOT NULL,
    `lang` VARCHAR(255) NULL,
    `slug` VARCHAR(255) NOT NULL,
    `value` MEDIUMTEXT NOT NULL,
    `default` MEDIUMTEXT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `ticketit_settings` ADD UNIQUE `ticketit_settings_lang_unique`(`lang`);
ALTER TABLE
    `ticketit_settings` ADD UNIQUE `ticketit_settings_slug_unique`(`slug`);
ALTER TABLE
    `ticketit_audits` ADD CONSTRAINT `ticketit_audits_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `ticketit_categories_users` ADD CONSTRAINT `ticketit_categories_users_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `ticketit` ADD CONSTRAINT `ticketit_agent_id_foreign` FOREIGN KEY(`agent_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `ticketit` ADD CONSTRAINT `ticketit_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `ticketit_categories`(`id`);
ALTER TABLE
    `ticketit` ADD CONSTRAINT `ticketit_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `ticketit` ADD CONSTRAINT `ticketit_status_id_foreign` FOREIGN KEY(`status_id`) REFERENCES `ticketit_statuses`(`id`);
ALTER TABLE
    `ticketit_audits` ADD CONSTRAINT `ticketit_audits_ticket_id_foreign` FOREIGN KEY(`ticket_id`) REFERENCES `ticketit`(`id`);
ALTER TABLE
    `ticketit_categories_users` ADD CONSTRAINT `ticketit_categories_users_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `ticketit_categories`(`id`);
ALTER TABLE
    `ticketit_comments` ADD CONSTRAINT `ticketit_comments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `ticketit` ADD CONSTRAINT `ticketit_priority_id_foreign` FOREIGN KEY(`priority_id`) REFERENCES `ticketit_priorities`(`id`);
ALTER TABLE
    `ticketit_comments` ADD CONSTRAINT `ticketit_comments_ticket_id_foreign` FOREIGN KEY(`ticket_id`) REFERENCES `ticketit`(`id`);