CREATE TABLE `actions`(
    `id` INT NOT NULL,
    `class_name` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `information` VARCHAR(255) NULL,
    `description` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `actions` ADD INDEX `actions_user_id_index`(`user_id`);
CREATE TABLE `cache`(
    `key` VARCHAR(255) NOT NULL,
    `value` TEXT NOT NULL,
    `expiration` INT NOT NULL
);
ALTER TABLE
    `cache` ADD UNIQUE `cache_key_unique`(`key`);
CREATE TABLE `component_groups`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `order` INT NOT NULL,
    `visible` TINYINT NOT NULL,
    `collapsed` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `component_groups` ADD INDEX `component_groups_order_index`(`order`);
ALTER TABLE
    `component_groups` ADD INDEX `component_groups_visible_index`(`visible`);
CREATE TABLE `components`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `link` TEXT NULL,
    `status` INT NOT NULL,
    `order` INT NOT NULL,
    `group_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `enabled` TINYINT NOT NULL,
    `meta` LONGTEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `components` ADD INDEX `components_status_index`(`status`);
ALTER TABLE
    `components` ADD INDEX `components_order_index`(`order`);
ALTER TABLE
    `components` ADD INDEX `components_group_id_index`(`group_id`);
ALTER TABLE
    `components` ADD INDEX `components_user_id_index`(`user_id`);
CREATE TABLE `failed_jobs`(
    `id` INT NOT NULL,
    `connection` TEXT NOT NULL,
    `queue` TEXT NOT NULL,
    `payload` TEXT NOT NULL,
    `failed_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `incident_components`(
    `id` INT NOT NULL,
    `incident_id` INT NOT NULL,
    `component_id` INT NOT NULL,
    `status_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `incident_components` ADD INDEX `incident_components_incident_id_index`(`incident_id`);
ALTER TABLE
    `incident_components` ADD INDEX `incident_components_component_id_index`(`component_id`);
ALTER TABLE
    `incident_components` ADD INDEX `incident_components_status_id_index`(`status_id`);
CREATE TABLE `incident_templates`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `template` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `incident_updates`(
    `id` INT NOT NULL,
    `incident_id` INT NOT NULL,
    `status` INT NOT NULL,
    `message` LONGTEXT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `incident_updates` ADD INDEX `incident_updates_incident_id_index`(`incident_id`);
CREATE TABLE `incidents`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `component_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `status` INT NOT NULL,
    `visible` TINYINT NOT NULL,
    `stickied` TINYINT NOT NULL,
    `notifications` TINYINT NOT NULL,
    `message` LONGTEXT NOT NULL,
    `occurred_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `incidents` ADD INDEX `incidents_user_id_index`(`user_id`);
ALTER TABLE
    `incidents` ADD INDEX `incidents_component_id_index`(`component_id`);
ALTER TABLE
    `incidents` ADD INDEX `incidents_status_index`(`status`);
ALTER TABLE
    `incidents` ADD INDEX `incidents_visible_index`(`visible`);
ALTER TABLE
    `incidents` ADD INDEX `incidents_stickied_index`(`stickied`);
CREATE TABLE `invites`(
    `id` INT NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `claimed_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `invites` ADD UNIQUE `invites_code_unique`(`code`);
CREATE TABLE `jobs`(
    `id` BIGINT NOT NULL,
    `queue` VARCHAR(255) NOT NULL,
    `payload` TEXT NOT NULL,
    `attempts` TINYINT NOT NULL,
    `reserved` TINYINT NOT NULL,
    `reserved_at` INT NULL,
    `available_at` INT NOT NULL,
    `created_at` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `meta`(
    `id` INT NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NOT NULL,
    `meta_id` INT NOT NULL,
    `meta_type` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `meta` ADD INDEX `meta_meta_id_meta_type_index`(`meta_id`, `meta_type`);
ALTER TABLE
    `meta` ADD INDEX `meta_key_index`(`key`);
CREATE TABLE `metric_points`(
    `id` INT NOT NULL,
    `metric_id` INT NOT NULL,
    `value` DECIMAL(8, 2) NOT NULL,
    `counter` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `metric_points` ADD INDEX `metric_points_metric_id_index`(`metric_id`);
CREATE TABLE `metrics`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `suffix` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `default_value` DECIMAL(8, 2) NOT NULL,
    `calc_type` TINYINT NOT NULL,
    `display_chart` TINYINT NOT NULL,
    `places` INT NOT NULL,
    `default_view` TINYINT NOT NULL,
    `threshold` INT NOT NULL,
    `order` TINYINT NOT NULL,
    `visible` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `metrics` ADD INDEX `metrics_display_chart_index`(`display_chart`);
ALTER TABLE
    `metrics` ADD INDEX `metrics_visible_index`(`visible`);
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
CREATE TABLE `schedule_components`(
    `id` INT NOT NULL,
    `schedule_id` INT NOT NULL,
    `component_id` INT NOT NULL,
    `component_status` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `schedules`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `message` LONGTEXT NULL,
    `status` TINYINT NOT NULL,
    `scheduled_at` TIMESTAMP NOT NULL,
    `completed_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
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
ALTER TABLE
    `sessions` ADD UNIQUE `sessions_id_unique`(`id`);
CREATE TABLE `settings`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `value` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `subscribers`(
    `id` INT NOT NULL,
    `email` VARCHAR(255) NULL,
    `verify_code` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(255) NULL,
    `slack_webhook_url` VARCHAR(255) NULL,
    `verified_at` TIMESTAMP NULL,
    `global` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `subscribers` ADD UNIQUE `subscribers_email_unique`(`email`);
CREATE TABLE `subscriptions`(
    `id` INT NOT NULL,
    `subscriber_id` INT NOT NULL,
    `component_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `subscriptions` ADD INDEX `subscriptions_subscriber_id_index`(`subscriber_id`);
ALTER TABLE
    `subscriptions` ADD INDEX `subscriptions_component_id_index`(`component_id`);
CREATE TABLE `taggables`(
    `id` INT NOT NULL,
    `tag_id` INT NOT NULL,
    `taggable_type` VARCHAR(255) NOT NULL,
    `taggable_id` BIGINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `taggables` ADD INDEX `taggables_tag_id_index`(`tag_id`);
CREATE TABLE `tags`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tags` ADD UNIQUE `tags_name_slug_unique`(`name`, `slug`);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `google_2fa_secret` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `api_key` VARCHAR(255) NOT NULL,
    `active` TINYINT NOT NULL,
    `level` TINYINT NOT NULL,
    `welcomed` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_username_unique`(`username`);
ALTER TABLE
    `users` ADD INDEX `users_remember_token_index`(`remember_token`);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD UNIQUE `users_api_key_unique`(`api_key`);
ALTER TABLE
    `users` ADD INDEX `users_active_index`(`active`);
ALTER TABLE
    `taggables` ADD CONSTRAINT `taggables_taggable_id_foreign` FOREIGN KEY(`taggable_id`) REFERENCES `components`(`id`);
ALTER TABLE
    `subscriptions` ADD CONSTRAINT `subscriptions_subscriber_id_foreign` FOREIGN KEY(`subscriber_id`) REFERENCES `subscribers`(`id`);
ALTER TABLE
    `incident_components` ADD CONSTRAINT `incident_components_incident_id_foreign` FOREIGN KEY(`incident_id`) REFERENCES `incidents`(`id`);
ALTER TABLE
    `incident_updates` ADD CONSTRAINT `incident_updates_incident_id_foreign` FOREIGN KEY(`incident_id`) REFERENCES `incidents`(`id`);
ALTER TABLE
    `taggables` ADD CONSTRAINT `taggables_taggable_id_foreign` FOREIGN KEY(`taggable_id`) REFERENCES `incidents`(`id`);
ALTER TABLE
    `sessions` ADD CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `schedule_components` ADD CONSTRAINT `schedule_components_component_id_foreign` FOREIGN KEY(`component_id`) REFERENCES `components`(`id`);
ALTER TABLE
    `incident_components` ADD CONSTRAINT `incident_components_component_id_foreign` FOREIGN KEY(`component_id`) REFERENCES `components`(`id`);
ALTER TABLE
    `schedule_components` ADD CONSTRAINT `schedule_components_schedule_id_foreign` FOREIGN KEY(`schedule_id`) REFERENCES `schedules`(`id`);
ALTER TABLE
    `subscriptions` ADD CONSTRAINT `subscriptions_component_id_foreign` FOREIGN KEY(`component_id`) REFERENCES `components`(`id`);
ALTER TABLE
    `incidents` ADD CONSTRAINT `incidents_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `metric_points` ADD CONSTRAINT `metric_points_metric_id_foreign` FOREIGN KEY(`metric_id`) REFERENCES `metrics`(`id`);
ALTER TABLE
    `actions` ADD CONSTRAINT `actions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `components` ADD CONSTRAINT `components_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `component_groups`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_notifiable_id_foreign` FOREIGN KEY(`notifiable_id`) REFERENCES `invites`(`id`);
ALTER TABLE
    `incident_updates` ADD CONSTRAINT `incident_updates_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_notifiable_id_foreign` FOREIGN KEY(`notifiable_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `taggables` ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);
ALTER TABLE
    `components` ADD CONSTRAINT `components_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `incidents` ADD CONSTRAINT `incidents_component_id_foreign` FOREIGN KEY(`component_id`) REFERENCES `components`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_notifiable_id_foreign` FOREIGN KEY(`notifiable_id`) REFERENCES `subscribers`(`id`);