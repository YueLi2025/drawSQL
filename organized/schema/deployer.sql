CREATE TABLE `cache`(
    `key` VARCHAR(255) NOT NULL,
    `value` TEXT NOT NULL,
    `expiration` INT NOT NULL
);
ALTER TABLE
    `cache` ADD UNIQUE `cache_key_unique`(`key`);
CREATE TABLE `channels`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `config` TEXT NOT NULL,
    `on_deployment_success` TINYINT NOT NULL,
    `on_deployment_failure` TINYINT NOT NULL,
    `on_link_down` TINYINT NOT NULL,
    `on_link_still_down` TINYINT NOT NULL,
    `on_link_recovered` TINYINT NOT NULL,
    `on_heartbeat_missing` TINYINT NOT NULL,
    `on_heartbeat_still_missing` TINYINT NOT NULL,
    `on_heartbeat_recovered` TINYINT NOT NULL,
    `project_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `channels` ADD INDEX `channels_project_id_index`(`project_id`);
CREATE TABLE `check_urls`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `project_id` INT NOT NULL,
    `period` INT NOT NULL,
    `match` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `missed` INT NOT NULL,
    `last_seen` DATETIME NULL,
    `status` INT NOT NULL,
    `last_log` TEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `check_urls` ADD INDEX `check_urls_project_id_index`(`project_id`);
ALTER TABLE
    `check_urls` ADD INDEX `check_urls_period_index`(`period`);
CREATE TABLE `command_server`(
    `id` INT NOT NULL,
    `command_id` INT NOT NULL,
    `server_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `command_server` ADD INDEX `command_server_command_id_index`(`command_id`);
ALTER TABLE
    `command_server` ADD INDEX `command_server_server_id_index`(`server_id`);
CREATE TABLE `commands`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `user` TEXT NULL,
    `script` TEXT NOT NULL,
    `order` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `optional` TINYINT NOT NULL,
    `default_on` TINYINT NOT NULL,
    `target_id` INT NOT NULL,
    `target_type` VARCHAR(255) NOT NULL,
    `step` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `config_files`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `path` TEXT NOT NULL,
    `content` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `target_id` INT NOT NULL,
    `target_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `deploy_steps`(
    `id` INT NOT NULL,
    `deployment_id` INT NOT NULL,
    `stage` INT NOT NULL,
    `command_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `deploy_steps` ADD INDEX `deploy_steps_deployment_id_index`(`deployment_id`);
ALTER TABLE
    `deploy_steps` ADD INDEX `deploy_steps_command_id_index`(`command_id`);
CREATE TABLE `deployments`(
    `id` INT NOT NULL,
    `committer` VARCHAR(255) NULL,
    `committer_email` VARCHAR(255) NULL,
    `commit` VARCHAR(255) NULL,
    `project_id` INT NOT NULL,
    `user_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `started_at` DATETIME NULL,
    `finished_at` DATETIME NULL,
    `reason` TEXT NULL,
    `branch` VARCHAR(255) NOT NULL,
    `is_webhook` TINYINT NOT NULL,
    `source` VARCHAR(255) NULL,
    `build_url` VARCHAR(255) NULL,
    `status` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `deployments` ADD INDEX `deployments_project_id_index`(`project_id`);
ALTER TABLE
    `deployments` ADD INDEX `deployments_user_id_index`(`user_id`);
CREATE TABLE `failed_jobs`(
    `id` INT NOT NULL,
    `connection` TEXT NOT NULL,
    `queue` TEXT NOT NULL,
    `payload` LONGTEXT NOT NULL,
    `exception` LONGTEXT NOT NULL,
    `failed_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `groups`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `order` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `heartbeats`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `hash` VARCHAR(255) NOT NULL,
    `interval` INT NOT NULL,
    `project_id` INT NOT NULL,
    `missed` INT NOT NULL,
    `last_activity` DATETIME NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `status` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `heartbeats` ADD UNIQUE `heartbeats_hash_unique`(`hash`);
ALTER TABLE
    `heartbeats` ADD INDEX `heartbeats_project_id_index`(`project_id`);
CREATE TABLE `jobs`(
    `id` BIGINT NOT NULL,
    `queue` VARCHAR(255) NOT NULL,
    `payload` LONGTEXT NOT NULL,
    `attempts` TINYINT NOT NULL,
    `reserved_at` INT NULL,
    `available_at` INT NOT NULL,
    `created_at` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `jobs` ADD INDEX `jobs_queue_reserved_at_index`(`queue`, `reserved_at`);
CREATE TABLE `migrations`(
    `id` INT NOT NULL,
    `migration` VARCHAR(255) NOT NULL,
    `batch` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `notifications`(
    `id` CHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `notifiable_id` INT NOT NULL,
    `notifiable_type` VARCHAR(255) NOT NULL,
    `data` TEXT NOT NULL,
    `read_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notifications` ADD INDEX `notifications_notifiable_id_notifiable_type_index`(`notifiable_id`, `notifiable_type`);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL
);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_email_index`(`email`);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_token_index`(`token`);
CREATE TABLE `project_user`(
    `id` INT NOT NULL,
    `project_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `role` ENUM('') NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `project_user` ADD UNIQUE `project_user_project_id_user_id_unique`(`project_id`, `user_id`);
ALTER TABLE
    `project_user` ADD INDEX `project_user_user_id_index`(`user_id`);
CREATE TABLE `projects`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `repository` VARCHAR(255) NOT NULL,
    `hash` VARCHAR(255) NOT NULL,
    `branch` VARCHAR(255) NOT NULL,
    `private_key` TEXT NOT NULL,
    `public_key` TEXT NOT NULL,
    `group_id` INT NOT NULL,
    `builds_to_keep` INT NOT NULL,
    `url` VARCHAR(255) NULL,
    `build_url` VARCHAR(255) NULL,
    `last_run` DATETIME NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `last_mirrored` DATETIME NULL,
    `allow_other_branch` TINYINT NOT NULL,
    `include_dev` TINYINT NOT NULL,
    `status` INT NOT NULL,
    `is_mirroring` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `projects` ADD INDEX `projects_group_id_index`(`group_id`);
CREATE TABLE `refs`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `is_tag` TINYINT NOT NULL,
    `project_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `refs` ADD INDEX `refs_project_id_index`(`project_id`);
CREATE TABLE `server_logs`(
    `id` INT NOT NULL,
    `server_id` INT NOT NULL,
    `deploy_step_id` INT NOT NULL,
    `output` LONGTEXT NULL,
    `started_at` DATETIME NULL,
    `finished_at` DATETIME NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `status` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `server_logs` ADD INDEX `server_logs_server_id_index`(`server_id`);
ALTER TABLE
    `server_logs` ADD INDEX `server_logs_deploy_step_id_index`(`deploy_step_id`);
CREATE TABLE `servers`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `ip_address` VARCHAR(255) NOT NULL,
    `user` VARCHAR(255) NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `project_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `deploy_code` TINYINT NOT NULL,
    `port` INT NOT NULL,
    `order` INT NOT NULL,
    `status` INT NOT NULL,
    `connect_log` TEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `servers` ADD INDEX `servers_project_id_index`(`project_id`);
CREATE TABLE `shared_files`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `file` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `target_id` INT NOT NULL,
    `target_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `templates`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `is_admin` TINYINT NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `email_token` VARCHAR(255) NULL,
    `avatar` VARCHAR(255) NULL,
    `language` VARCHAR(255) NULL,
    `skin` VARCHAR(255) NULL,
    `google2fa_secret` VARCHAR(255) NULL,
    `scheme` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD INDEX `users_email_token_index`(`email_token`);
CREATE TABLE `variables`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `target_id` INT NOT NULL,
    `target_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `server_logs` ADD CONSTRAINT `server_logs_server_id_foreign` FOREIGN KEY(`server_id`) REFERENCES `servers`(`id`);
ALTER TABLE
    `deployments` ADD CONSTRAINT `deployments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `deploy_steps` ADD CONSTRAINT `deploy_steps_command_id_foreign` FOREIGN KEY(`command_id`) REFERENCES `commands`(`id`);
ALTER TABLE
    `project_user` ADD CONSTRAINT `project_user_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `projects`(`id`);
ALTER TABLE
    `command_server` ADD CONSTRAINT `command_server_server_id_foreign` FOREIGN KEY(`server_id`) REFERENCES `servers`(`id`);
ALTER TABLE
    `servers` ADD CONSTRAINT `servers_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `projects`(`id`);
ALTER TABLE
    `check_urls` ADD CONSTRAINT `check_urls_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `projects`(`id`);
ALTER TABLE
    `project_user` ADD CONSTRAINT `project_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `heartbeats` ADD CONSTRAINT `heartbeats_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `projects`(`id`);
ALTER TABLE
    `command_server` ADD CONSTRAINT `command_server_command_id_foreign` FOREIGN KEY(`command_id`) REFERENCES `commands`(`id`);
ALTER TABLE
    `server_logs` ADD CONSTRAINT `server_logs_deploy_step_id_foreign` FOREIGN KEY(`deploy_step_id`) REFERENCES `deploy_steps`(`id`);
ALTER TABLE
    `refs` ADD CONSTRAINT `refs_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `projects`(`id`);
ALTER TABLE
    `projects` ADD CONSTRAINT `projects_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `groups`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_notifiable_id_foreign` FOREIGN KEY(`notifiable_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `deployments` ADD CONSTRAINT `deployments_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `projects`(`id`);
ALTER TABLE
    `deploy_steps` ADD CONSTRAINT `deploy_steps_deployment_id_foreign` FOREIGN KEY(`deployment_id`) REFERENCES `deployments`(`id`);
ALTER TABLE
    `channels` ADD CONSTRAINT `channels_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `projects`(`id`);