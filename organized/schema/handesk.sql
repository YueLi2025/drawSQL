CREATE TABLE `attachments`(
    `id` INT NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `attachable_id` INT NOT NULL,
    `attachable_type` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `comments`(
    `id` INT NOT NULL,
    `ticket_id` INT NOT NULL,
    `user_id` INT NULL,
    `new_status` TINYINT NOT NULL,
    `private` TINYINT NOT NULL,
    `body` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `failed_jobs`(
    `id` BIGINT NOT NULL,
    `connection` TEXT NOT NULL,
    `queue` TEXT NOT NULL,
    `payload` LONGTEXT NOT NULL,
    `exception` LONGTEXT NOT NULL,
    `failed_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `ideas`(
    `id` INT NOT NULL,
    `requester_id` INT NOT NULL,
    `status` TINYINT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `repository` VARCHAR(255) NULL,
    `issue_id` INT NULL,
    `due_date` DATE NULL,
    `body` TEXT NOT NULL,
    `development_effort` TINYINT NOT NULL,
    `sales_impact` TINYINT NOT NULL,
    `current_impact` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `kpis`(
    `date` DATE NOT NULL,
    `type` TINYINT NOT NULL,
    `kpi` TINYINT NOT NULL,
    `relation_id` INT NOT NULL,
    `total` INT NOT NULL,
    `count` INT NOT NULL,
    PRIMARY KEY(`date`, `type`, `kpi`, `relation_id`)
);
CREATE TABLE `lead_status_updates`(
    `id` INT NOT NULL,
    `new_status` INT NOT NULL,
    `body` TEXT NULL,
    `lead_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `leads`(
    `id` INT NOT NULL,
    `email` VARCHAR(255) NULL,
    `status` INT NOT NULL,
    `team_id` INT NULL,
    `user_id` INT NULL,
    `name` VARCHAR(255) NOT NULL,
    `body` TEXT NULL,
    `username` VARCHAR(255) NULL,
    `address` VARCHAR(255) NULL,
    `city` VARCHAR(255) NULL,
    `country` VARCHAR(255) NULL,
    `postal_code` VARCHAR(255) NULL,
    `company` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `memberships`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `team_id` INT NOT NULL,
    `admin` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `merged_tickets`(
    `id` INT NOT NULL,
    `ticket_id` INT NOT NULL,
    `merged_ticket_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `migrations`(
    `id` INT NOT NULL,
    `migration` VARCHAR(255) NOT NULL,
    `batch` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL
);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_email_index`(`email`);
CREATE TABLE `requesters`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `no_reply` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `requesters` ADD UNIQUE `requesters_email_unique`(`email`);
CREATE TABLE `settings`(
    `id` INT NOT NULL,
    `slack_webhook_url` VARCHAR(255) NULL,
    `default_team_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `taggables`(
    `tag_id` INT NOT NULL,
    `taggable_id` INT NOT NULL,
    `taggable_type` VARCHAR(255) NOT NULL
);
CREATE TABLE `tags`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `tasks`(
    `id` INT NOT NULL,
    `lead_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `body` TEXT NOT NULL,
    `datetime` DATETIME NULL,
    `completed` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `teams`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NULL,
    `slack_webhook_url` VARCHAR(255) NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `ticket_events`(
    `id` INT NOT NULL,
    `ticket_id` INT NOT NULL,
    `user_id` INT NULL,
    `body` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `ticket_types`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `color` VARCHAR(255) NOT NULL,
    `deleted_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `tickets`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `body` TEXT NOT NULL,
    `public_token` VARCHAR(255) NOT NULL,
    `requester_id` INT NOT NULL,
    `team_id` INT NULL,
    `user_id` INT NULL,
    `status` TINYINT NOT NULL,
    `priority` TINYINT NOT NULL,
    `level` TINYINT NOT NULL,
    `rating` TINYINT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `ticket_type_id` INT NULL,
    `subject` VARCHAR(255) NULL,
    `summary` TEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tickets` ADD UNIQUE `tickets_public_token_unique`(`public_token`);
CREATE TABLE `user_settings`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `daily_tasks_notification` TINYINT NOT NULL,
    `tickets_signature` VARCHAR(255) NULL,
    `new_ticket_notification` TINYINT NOT NULL,
    `ticket_assigned_notification` TINYINT NOT NULL,
    `ticket_updated_notification` TINYINT NOT NULL,
    `new_lead_notification` TINYINT NOT NULL,
    `lead_assigned_notification` TINYINT NOT NULL,
    `new_idea_notification` TINYINT NOT NULL,
    `mention_notification` TINYINT NOT NULL,
    `ticket_rated_notification` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `escalated_ticket_notification` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `locale` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `admin` TINYINT NOT NULL,
    `assistant` TINYINT NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `can_see_reports` TINYINT NOT NULL,
    `token` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD UNIQUE `users_token_unique`(`token`);
ALTER TABLE
    `memberships` ADD CONSTRAINT `memberships_team_id_foreign` FOREIGN KEY(`team_id`) REFERENCES `teams`(`id`);
ALTER TABLE
    `ticket_events` ADD CONSTRAINT `ticket_events_ticket_id_foreign` FOREIGN KEY(`ticket_id`) REFERENCES `tickets`(`id`);
ALTER TABLE
    `merged_tickets` ADD CONSTRAINT `merged_tickets_ticket_id_foreign` FOREIGN KEY(`ticket_id`) REFERENCES `tickets`(`id`);
ALTER TABLE
    `taggables` ADD CONSTRAINT `taggables_taggable_id_foreign` FOREIGN KEY(`taggable_id`) REFERENCES `leads`(`id`);
ALTER TABLE
    `ticket_events` ADD CONSTRAINT `ticket_events_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `taggables` ADD CONSTRAINT `taggables_taggable_id_foreign` FOREIGN KEY(`taggable_id`) REFERENCES `tickets`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_ticket_id_foreign` FOREIGN KEY(`ticket_id`) REFERENCES `tickets`(`id`);
ALTER TABLE
    `tasks` ADD CONSTRAINT `tasks_lead_id_foreign` FOREIGN KEY(`lead_id`) REFERENCES `leads`(`id`);
ALTER TABLE
    `memberships` ADD CONSTRAINT `memberships_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `leads` ADD CONSTRAINT `leads_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `taggables` ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);
ALTER TABLE
    `user_settings` ADD CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `tickets` ADD CONSTRAINT `tickets_ticket_type_id_foreign` FOREIGN KEY(`ticket_type_id`) REFERENCES `ticket_types`(`id`);
ALTER TABLE
    `merged_tickets` ADD CONSTRAINT `merged_tickets_merged_ticket_id_foreign` FOREIGN KEY(`merged_ticket_id`) REFERENCES `merged_tickets`(`id`);
ALTER TABLE
    `leads` ADD CONSTRAINT `leads_team_id_foreign` FOREIGN KEY(`team_id`) REFERENCES `teams`(`id`);
ALTER TABLE
    `tickets` ADD CONSTRAINT `tickets_team_id_foreign` FOREIGN KEY(`team_id`) REFERENCES `teams`(`id`);
ALTER TABLE
    `lead_status_updates` ADD CONSTRAINT `lead_status_updates_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `lead_status_updates` ADD CONSTRAINT `lead_status_updates_lead_id_foreign` FOREIGN KEY(`lead_id`) REFERENCES `leads`(`id`);
ALTER TABLE
    `tasks` ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `tickets` ADD CONSTRAINT `tickets_requester_id_foreign` FOREIGN KEY(`requester_id`) REFERENCES `requesters`(`id`);
ALTER TABLE
    `tickets` ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `ideas` ADD CONSTRAINT `ideas_requester_id_foreign` FOREIGN KEY(`requester_id`) REFERENCES `requesters`(`id`);