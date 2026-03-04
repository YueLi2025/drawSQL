CREATE TABLE `accounts_profile`(
    `id` INT NOT NULL,
    `next_report_date` DATETIME NULL,
    `reports_allowed` TINYINT NOT NULL,
    `user_id` INT NULL,
    `ping_log_limit` INT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `check_limit` INT NOT NULL,
    `last_sms_date` DATETIME NULL,
    `sms_limit` INT NOT NULL,
    `sms_sent` INT NOT NULL,
    `team_limit` INT NOT NULL,
    `sort` VARCHAR(255) NOT NULL,
    `nag_period` BIGINT NOT NULL,
    `next_nag_date` DATETIME NULL,
    `deletion_notice_date` DATETIME NULL,
    `last_active_date` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `accounts_profile` ADD UNIQUE `accounts_profile_user_id_unique`(`user_id`);
CREATE TABLE `accounts_project`(
    `id` INT NOT NULL,
    `code` CHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `api_key` VARCHAR(255) NOT NULL,
    `api_key_readonly` VARCHAR(255) NOT NULL,
    `owner_id` INT NOT NULL,
    `badge_key` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `accounts_project` ADD UNIQUE `accounts_project_code_unique`(`code`);
ALTER TABLE
    `accounts_project` ADD INDEX `accounts_project_api_key_index`(`api_key`);
ALTER TABLE
    `accounts_project` ADD INDEX `accounts_project_api_key_readonly_index`(`api_key_readonly`);
ALTER TABLE
    `accounts_project` ADD INDEX `accounts_project_owner_id_index`(`owner_id`);
ALTER TABLE
    `accounts_project` ADD UNIQUE `accounts_project_badge_key_unique`(`badge_key`);
CREATE TABLE `accounts_member`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `project_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `accounts_member` ADD INDEX `accounts_member_user_id_index`(`user_id`);
ALTER TABLE
    `accounts_member` ADD INDEX `accounts_member_project_id_index`(`project_id`);
CREATE TABLE `api_channel`(
    `id` INT NOT NULL,
    `code` CHAR(255) NOT NULL,
    `created` DATETIME NOT NULL,
    `kind` VARCHAR(255) NOT NULL,
    `value` LONGTEXT NOT NULL,
    `email_verified` TINYINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `project_id` INT NOT NULL,
    `last_error` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_channel` ADD UNIQUE `api_channel_code_unique`(`code`);
ALTER TABLE
    `api_channel` ADD INDEX `api_channel_project_id_index`(`project_id`);
CREATE TABLE `api_channel_checks`(
    `id` INT NOT NULL,
    `channel_id` INT NOT NULL,
    `check_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_channel_checks` ADD UNIQUE `api_channel_checks_channel_id_check_id_unique`(`channel_id`, `check_id`);
ALTER TABLE
    `api_channel_checks` ADD INDEX `api_channel_checks_check_id_index`(`check_id`);
CREATE TABLE `api_check`(
    `id` INT NOT NULL,
    `code` CHAR(255) NOT NULL,
    `last_ping` DATETIME NULL,
    `alert_after` DATETIME NULL,
    `status` VARCHAR(255) NOT NULL,
    `timeout` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created` DATETIME NOT NULL,
    `grace` BIGINT NOT NULL,
    `tags` VARCHAR(255) NOT NULL,
    `n_pings` INT NOT NULL,
    `kind` VARCHAR(255) NOT NULL,
    `schedule` VARCHAR(255) NOT NULL,
    `tz` VARCHAR(255) NOT NULL,
    `has_confirmation_link` TINYINT NOT NULL,
    `last_ping_was_fail` TINYINT NULL,
    `desc` LONGTEXT NOT NULL,
    `last_start` DATETIME NULL,
    `subject` VARCHAR(255) NOT NULL,
    `project_id` INT NOT NULL,
    `last_duration` BIGINT NULL,
    `methods` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_check` ADD UNIQUE `api_check_code_unique`(`code`);
ALTER TABLE
    `api_check` ADD INDEX `api_check_alert_after_index`(`alert_after`);
ALTER TABLE
    `api_check` ADD INDEX `api_check_project_id_index`(`project_id`);
CREATE TABLE `api_flip`(
    `id` INT NOT NULL,
    `created` DATETIME NOT NULL,
    `processed` DATETIME NULL,
    `old_status` VARCHAR(255) NOT NULL,
    `new_status` VARCHAR(255) NOT NULL,
    `owner_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_flip` ADD INDEX `api_flip_processed_index`(`processed`);
ALTER TABLE
    `api_flip` ADD INDEX `api_flip_owner_id_index`(`owner_id`);
CREATE TABLE `api_notification`(
    `id` INT NOT NULL,
    `check_status` VARCHAR(255) NOT NULL,
    `created` DATETIME NOT NULL,
    `channel_id` INT NOT NULL,
    `owner_id` INT NOT NULL,
    `error` VARCHAR(255) NOT NULL,
    `code` CHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_notification` ADD INDEX `api_notification_channel_id_index`(`channel_id`);
ALTER TABLE
    `api_notification` ADD INDEX `api_notification_owner_id_index`(`owner_id`);
CREATE TABLE `api_ping`(
    `id` BIGINT NOT NULL,
    `created` DATETIME NOT NULL,
    `remote_addr` CHAR(255) NULL,
    `method` VARCHAR(255) NOT NULL,
    `ua` VARCHAR(255) NOT NULL,
    `owner_id` INT NOT NULL,
    `scheme` VARCHAR(255) NOT NULL,
    `n` INT NULL,
    `body` LONGTEXT NULL,
    `kind` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_ping` ADD INDEX `api_ping_owner_id_index`(`owner_id`);
CREATE TABLE `api_tokenbucket`(
    `id` INT NOT NULL,
    `value` VARCHAR(255) NOT NULL,
    `tokens` DOUBLE NOT NULL,
    `updated` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_tokenbucket` ADD UNIQUE `api_tokenbucket_value_unique`(`value`);
CREATE TABLE `auth_user`(
    `id` INT NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `last_login` DATETIME NULL,
    `is_superuser` TINYINT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `is_staff` TINYINT NOT NULL,
    `is_active` TINYINT NOT NULL,
    `date_joined` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_user` ADD UNIQUE `auth_user_username_unique`(`username`);
CREATE TABLE `payments_subscription`(
    `id` INT NOT NULL,
    `customer_id` VARCHAR(255) NOT NULL,
    `payment_method_token` VARCHAR(255) NOT NULL,
    `subscription_id` VARCHAR(255) NOT NULL,
    `user_id` INT NULL,
    `plan_id` VARCHAR(255) NOT NULL,
    `address_id` VARCHAR(255) NOT NULL,
    `send_invoices` TINYINT NOT NULL,
    `plan_name` VARCHAR(255) NOT NULL,
    `invoice_email` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `payments_subscription` ADD UNIQUE `payments_subscription_user_id_unique`(`user_id`);
ALTER TABLE
    `accounts_profile` ADD CONSTRAINT `accounts_profile_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `api_notification` ADD CONSTRAINT `api_notification_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `api_check`(`id`);
ALTER TABLE
    `accounts_member` ADD CONSTRAINT `accounts_member_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `accounts_member` ADD CONSTRAINT `accounts_member_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `accounts_project`(`id`);
ALTER TABLE
    `api_channel_checks` ADD CONSTRAINT `api_channel_checks_channel_id_foreign` FOREIGN KEY(`channel_id`) REFERENCES `api_channel`(`id`);
ALTER TABLE
    `api_channel_checks` ADD CONSTRAINT `api_channel_checks_check_id_foreign` FOREIGN KEY(`check_id`) REFERENCES `api_check`(`id`);
ALTER TABLE
    `accounts_project` ADD CONSTRAINT `accounts_project_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `api_channel` ADD CONSTRAINT `api_channel_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `accounts_project`(`id`);
ALTER TABLE
    `api_check` ADD CONSTRAINT `api_check_project_id_foreign` FOREIGN KEY(`project_id`) REFERENCES `accounts_project`(`id`);
ALTER TABLE
    `api_ping` ADD CONSTRAINT `api_ping_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `api_check`(`id`);
ALTER TABLE
    `api_notification` ADD CONSTRAINT `api_notification_channel_id_foreign` FOREIGN KEY(`channel_id`) REFERENCES `api_channel`(`id`);
ALTER TABLE
    `payments_subscription` ADD CONSTRAINT `payments_subscription_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `api_flip` ADD CONSTRAINT `api_flip_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `api_check`(`id`);