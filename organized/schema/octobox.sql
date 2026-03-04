CREATE TABLE `app_installation_permissions`(
    `id` BIGINT NOT NULL,
    `app_installation_id` INT NULL,
    `user_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `app_installations`(
    `id` BIGINT NOT NULL,
    `github_id` INT NULL,
    `app_id` INT NULL,
    `account_login` VARCHAR(255) NULL,
    `account_id` INT NULL,
    `account_type` VARCHAR(255) NULL,
    `target_type` VARCHAR(255) NULL,
    `target_id` INT NULL,
    `permission_pull_requests` VARCHAR(255) NULL,
    `permission_issues` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `permission_statuses` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `comments`(
    `id` BIGINT NOT NULL,
    `subject_id` INT NULL,
    `github_id` BIGINT NULL,
    `author` VARCHAR(255) NULL,
    `author_association` VARCHAR(255) NULL,
    `body` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `review_state` VARCHAR(255) NULL,
    `url` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `comments` ADD INDEX `comments_subject_id_index`(`subject_id`);
CREATE TABLE `labels`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NULL,
    `color` VARCHAR(255) NULL,
    `subject_id` BIGINT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `github_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `labels` ADD INDEX `labels_name_index`(`name`);
ALTER TABLE
    `labels` ADD INDEX `labels_subject_id_index`(`subject_id`);
CREATE TABLE `notifications`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `github_id` INT NULL,
    `repository_id` INT NULL,
    `repository_full_name` VARCHAR(255) NULL,
    `subject_title` TEXT NULL,
    `subject_url` VARCHAR(255) NULL,
    `subject_type` VARCHAR(255) NULL,
    `reason` VARCHAR(255) NULL,
    `unread` TINYINT NULL,
    `last_read_at` VARCHAR(255) NULL,
    `url` VARCHAR(255) NULL,
    `archived` TINYINT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `starred` TINYINT NULL,
    `repository_owner_name` VARCHAR(255) NULL,
    `latest_comment_url` VARCHAR(255) NULL,
    `muted_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notifications` ADD UNIQUE `notifications_user_id_github_id_unique`(`user_id`, `github_id`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_user_id_archived_updated_at_index`(`user_id`, `archived`, `updated_at`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_repository_full_name_index`(`repository_full_name`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_subject_url_index`(`subject_url`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_muted_at_index`(`muted_at`);
CREATE TABLE `pinned_searches`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NULL,
    `query` VARCHAR(255) NULL,
    `name` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `pinned_searches` ADD INDEX `pinned_searches_user_id_index`(`user_id`);
CREATE TABLE `repositories`(
    `id` BIGINT NOT NULL,
    `full_name` VARCHAR(255) NOT NULL,
    `github_id` INT NULL,
    `private` TINYINT NULL,
    `owner` VARCHAR(255) NULL,
    `last_synced_at` DATETIME NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `app_installation_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `repositories` ADD UNIQUE `repositories_full_name_unique`(`full_name`);
ALTER TABLE
    `repositories` ADD INDEX `repositories_github_id_index`(`github_id`);
CREATE TABLE `subjects`(
    `id` BIGINT NOT NULL,
    `url` VARCHAR(255) NULL,
    `state` VARCHAR(255) NULL,
    `author` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `html_url` VARCHAR(255) NULL,
    `assignees` VARCHAR(255) NULL,
    `github_id` INT NULL,
    `repository_full_name` VARCHAR(255) NULL,
    `locked` TINYINT NULL,
    `sha` VARCHAR(255) NULL,
    `status` VARCHAR(255) NULL,
    `body` TEXT NULL,
    `comment_count` INT NULL,
    `draft` TINYINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `subjects` ADD INDEX `subjects_url_index`(`url`);
ALTER TABLE
    `subjects` ADD INDEX `subjects_repository_full_name_index`(`repository_full_name`);
CREATE TABLE `subscription_plans`(
    `id` BIGINT NOT NULL,
    `github_id` INT NULL,
    `name` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `monthly_price_in_cents` INT NULL,
    `yearly_price_in_cents` INT NULL,
    `price_model` VARCHAR(255) NULL,
    `has_free_trial` TINYINT NULL,
    `unit_name` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `number` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `subscription_purchases`(
    `id` BIGINT NOT NULL,
    `subscription_plan_id` INT NULL,
    `account_id` INT NULL,
    `billing_cycle` VARCHAR(255) NULL,
    `unit_count` INT NULL,
    `on_free_trial` TINYINT NULL,
    `free_trial_ends_on` DATETIME NULL,
    `next_billing_date` DATETIME NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `oc_transactionid` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `github_id` INT NOT NULL,
    `github_login` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `last_synced_at` DATETIME NULL,
    `refresh_interval` INT NULL,
    `api_token` VARCHAR(255) NULL,
    `sync_job_id` VARCHAR(255) NULL,
    `encrypted_access_token` VARCHAR(255) NULL,
    `encrypted_access_token_iv` VARCHAR(255) NULL,
    `encrypted_personal_access_token` VARCHAR(255) NULL,
    `encrypted_personal_access_token_iv` VARCHAR(255) NULL,
    `encrypted_app_token` VARCHAR(255) NULL,
    `encrypted_app_token_iv` VARCHAR(255) NULL,
    `theme` VARCHAR(255) NULL,
    `display_comments` TINYINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_github_id_unique`(`github_id`);
ALTER TABLE
    `users` ADD UNIQUE `users_api_token_unique`(`api_token`);
ALTER TABLE
    `repositories` ADD CONSTRAINT `repositories_app_installation_id_foreign` FOREIGN KEY(`app_installation_id`) REFERENCES `app_installations`(`id`);
ALTER TABLE
    `subscription_purchases` ADD CONSTRAINT `subscription_purchases_subscription_plan_id_foreign` FOREIGN KEY(`subscription_plan_id`) REFERENCES `subscription_plans`(`id`);
ALTER TABLE
    `app_installation_permissions` ADD CONSTRAINT `app_installation_permissions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_subject_id_foreign` FOREIGN KEY(`subject_id`) REFERENCES `subjects`(`id`);
ALTER TABLE
    `labels` ADD CONSTRAINT `labels_subject_id_foreign` FOREIGN KEY(`subject_id`) REFERENCES `subjects`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_repository_id_foreign` FOREIGN KEY(`repository_id`) REFERENCES `repositories`(`id`);
ALTER TABLE
    `pinned_searches` ADD CONSTRAINT `pinned_searches_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `app_installation_permissions` ADD CONSTRAINT `app_installation_permissions_app_installation_id_foreign` FOREIGN KEY(`app_installation_id`) REFERENCES `app_installations`(`id`);