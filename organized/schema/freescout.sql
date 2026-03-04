CREATE TABLE `activity_logs`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `log_name` VARCHAR(255) NULL,
    `description` TEXT NOT NULL,
    `subject_id` INT NULL,
    `subject_type` VARCHAR(255) NULL,
    `causer_id` INT UNSIGNED NULL,
    `causer_type` VARCHAR(255) NULL,
    `properties` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
ALTER TABLE
    `activity_logs` ADD INDEX `activity_logs_log_name_index`(`log_name`);
CREATE TABLE `attachments`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `thread_id` INT UNSIGNED NULL,
    `user_id` INT UNSIGNED NULL,
    `file_dir` VARCHAR(255) NULL,
    `file_name` VARCHAR(255) NOT NULL,
    `mime_type` VARCHAR(255) NOT NULL,
    `type` INT UNSIGNED NOT NULL,
    `size` INT UNSIGNED NULL,
    `embedded` TINYINT NOT NULL DEFAULT '''0''',
    `public` TINYINT NOT NULL DEFAULT '''0'''
);
ALTER TABLE
    `attachments` ADD INDEX `attachments_thread_id_embedded_index`(`thread_id`, `embedded`);
CREATE TABLE `conversation_folder`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `folder_id` INT UNSIGNED NOT NULL,
    `conversation_id` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `conversation_folder` ADD UNIQUE `conversation_folder_folder_id_conversation_id_unique`(`folder_id`, `conversation_id`);
CREATE TABLE `conversations`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `number` INT UNSIGNED NOT NULL,
    `threads_count` INT UNSIGNED NOT NULL DEFAULT '''0''',
    `type` TINYINT UNSIGNED NOT NULL,
    `folder_id` INT UNSIGNED NOT NULL,
    `status` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `state` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `subject` VARCHAR(255) NULL,
    `customer_email` VARCHAR(255) NULL,
    `cc` TEXT NULL,
    `bcc` TEXT NULL,
    `preview` VARCHAR(255) NOT NULL,
    `imported` TINYINT NOT NULL DEFAULT '''0''',
    `has_attachments` TINYINT NOT NULL DEFAULT '''0''',
    `mailbox_id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NULL,
    `customer_id` INT UNSIGNED NULL,
    `created_by_user_id` INT UNSIGNED NULL,
    `created_by_customer_id` INT UNSIGNED NULL,
    `source_via` TINYINT UNSIGNED NOT NULL,
    `source_type` TINYINT UNSIGNED NOT NULL,
    `closed_by_user_id` INT UNSIGNED NULL,
    `closed_at` TIMESTAMP NULL,
    `user_updated_at` TIMESTAMP NULL,
    `last_reply_at` TIMESTAMP NULL,
    `last_reply_from` TINYINT UNSIGNED NULL,
    `read_by_user` TINYINT NOT NULL DEFAULT '''0''',
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `channel` TINYINT UNSIGNED NULL
);
ALTER TABLE
    `conversations` ADD INDEX `conversations_folder_id_status_index`(`folder_id`, `status`);
ALTER TABLE
    `conversations` ADD INDEX `conversations_mailbox_id_customer_id_index`(`mailbox_id`, `customer_id`);
ALTER TABLE
    `conversations` ADD INDEX `conversations_status_state_mailbox_id_user_id_index`(
        `status`,
        `state`,
        `mailbox_id`,
        `user_id`
    );
ALTER TABLE
    `conversations` ADD INDEX `conversations_folder_id_state_index`(`folder_id`, `state`);
CREATE TABLE `customers`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `company` TEXT NULL,
    `job_title` TEXT NULL,
    `photo_type` TINYINT UNSIGNED NULL,
    `photo_url` VARCHAR(255) NULL,
    `phones` TEXT NULL,
    `websites` TEXT NULL,
    `social_profiles` TEXT NULL,
    `notes` TEXT NULL,
    `address` TEXT NULL,
    `city` VARCHAR(255) NULL,
    `state` VARCHAR(255) NULL,
    `zip` VARCHAR(255) NULL,
    `country` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `channel` TINYINT UNSIGNED NULL,
    `channel_id` TEXT NULL,
    `meta` TEXT NULL
);
ALTER TABLE
    `customers` ADD INDEX `customers_first_name_last_name_index`(`first_name`, `last_name`);
CREATE TABLE `emails`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_id` INT UNSIGNED NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `type` TINYINT UNSIGNED NOT NULL DEFAULT '''1'''
);
ALTER TABLE
    `emails` ADD INDEX `emails_customer_id_index`(`customer_id`);
ALTER TABLE
    `emails` ADD UNIQUE `emails_email_unique`(`email`);
CREATE TABLE `folders`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `mailbox_id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NULL,
    `type` TINYINT UNSIGNED NOT NULL,
    `total_count` INT NOT NULL DEFAULT '''0''',
    `active_count` INT NOT NULL DEFAULT '''0''',
    `meta` TEXT NULL
);
ALTER TABLE
    `folders` ADD INDEX `folders_mailbox_id_user_id_type_index`(`mailbox_id`, `user_id`, `type`);
CREATE TABLE `followers`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `conversation_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `added_by_user_id` INT NULL
);
ALTER TABLE
    `followers` ADD UNIQUE `followers_conversation_id_user_id_unique`(`conversation_id`, `user_id`);
CREATE TABLE `ltm_translations`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `status` INT NOT NULL DEFAULT '''0''',
    `locale` VARCHAR(255) NOT NULL,
    `group` VARCHAR(255) NOT NULL,
    `key` TEXT NOT NULL,
    `value` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `hash` VARCHAR(255) NULL
);
ALTER TABLE
    `ltm_translations` ADD UNIQUE `ltm_translations_hash_unique`(`hash`);
CREATE TABLE `mailbox_user`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `mailbox_id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    `after_send` TINYINT UNSIGNED NOT NULL DEFAULT '''2''',
    `hide` TINYINT NOT NULL DEFAULT '''0''',
    `mute` TINYINT NOT NULL DEFAULT '''0''',
    `access` TEXT NULL
);
ALTER TABLE
    `mailbox_user` ADD UNIQUE `mailbox_user_mailbox_id_user_id_unique`(`mailbox_id`, `user_id`);
ALTER TABLE
    `mailbox_user` ADD INDEX `mailbox_user_mailbox_id_index`(`mailbox_id`);
CREATE TABLE `mailboxes`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `aliases` VARCHAR(255) NULL,
    `from_name` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `from_name_custom` VARCHAR(255) NULL,
    `ticket_status` TINYINT UNSIGNED NOT NULL DEFAULT '''2''',
    `ticket_assignee` TINYINT UNSIGNED NOT NULL DEFAULT '''2''',
    `template` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `signature` TEXT NULL,
    `out_method` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `out_server` TEXT NULL,
    `out_username` VARCHAR(255) NULL,
    `out_password` TEXT NULL,
    `out_port` INT UNSIGNED NULL,
    `out_encryption` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `in_server` TEXT NULL,
    `in_port` INT UNSIGNED NOT NULL DEFAULT '''143''',
    `in_username` VARCHAR(255) NULL,
    `in_password` TEXT NULL,
    `in_protocol` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `in_encryption` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `auto_reply_enabled` TINYINT NOT NULL DEFAULT '''0''',
    `auto_reply_subject` VARCHAR(255) NULL,
    `auto_reply_message` TEXT NULL,
    `office_hours_enabled` TINYINT NOT NULL DEFAULT '''0''',
    `ratings` TINYINT NOT NULL DEFAULT '''0''',
    `ratings_placement` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `ratings_text` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `in_validate_cert` TINYINT NOT NULL DEFAULT '''1''',
    `in_imap_folders` TEXT NULL,
    `auto_bcc` TEXT NULL,
    `before_reply` TEXT NULL,
    `imap_sent_folder` VARCHAR(255) NULL,
    `meta` TEXT NULL
);
ALTER TABLE
    `mailboxes` ADD UNIQUE `mailboxes_email_unique`(`email`);
CREATE TABLE `modules`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `alias` VARCHAR(255) NOT NULL,
    `active` TINYINT NOT NULL DEFAULT '''0''',
    `activated` TINYINT NOT NULL DEFAULT '''0''',
    `license` VARCHAR(255) NULL
);
ALTER TABLE
    `modules` ADD UNIQUE `modules_alias_unique`(`alias`);
CREATE TABLE `notifications`(
    `id` CHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `notifiable_id` INT UNSIGNED NOT NULL,
    `notifiable_type` VARCHAR(255) NOT NULL,
    `data` TEXT NOT NULL,
    `read_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notifications` ADD INDEX `notifications_notifiable_id_notifiable_type_index`(`notifiable_id`, `notifiable_type`);
CREATE TABLE `options`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `value` LONGTEXT NOT NULL
);
ALTER TABLE
    `options` ADD UNIQUE `options_name_unique`(`name`);
CREATE TABLE `polycast_events`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `channels` TEXT NOT NULL,
    `event` TEXT NOT NULL,
    `payload` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL
);
ALTER TABLE
    `polycast_events` ADD INDEX `polycast_events_created_at_index`(`created_at`);
CREATE TABLE `send_logs`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `thread_id` INT UNSIGNED NULL,
    `customer_id` INT UNSIGNED NULL,
    `user_id` INT UNSIGNED NULL,
    `message_id` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `mail_type` TINYINT UNSIGNED NOT NULL,
    `status` TINYINT UNSIGNED NOT NULL,
    `status_message` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
ALTER TABLE
    `send_logs` ADD INDEX `send_logs_customer_id_mail_type_created_at_index`(
        `customer_id`,
        `mail_type`,
        `created_at`
    );
ALTER TABLE
    `send_logs` ADD INDEX `send_logs_thread_id_index`(`thread_id`);
ALTER TABLE
    `send_logs` ADD INDEX `send_logs_message_id_index`(`message_id`);
CREATE TABLE `subscriptions`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT UNSIGNED NOT NULL,
    `medium` TINYINT UNSIGNED NOT NULL,
    `event` TINYINT UNSIGNED NOT NULL
);
ALTER TABLE
    `subscriptions` ADD UNIQUE `subscriptions_user_id_medium_event_unique`(`user_id`, `medium`, `event`);
ALTER TABLE
    `subscriptions` ADD INDEX `subscriptions_user_id_event_index`(`user_id`, `event`);
CREATE TABLE `threads`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `conversation_id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NULL,
    `type` TINYINT UNSIGNED NOT NULL,
    `subtype` TINYINT UNSIGNED NULL,
    `status` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `state` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `action_type` TINYINT UNSIGNED NULL,
    `action_data` VARCHAR(255) NULL,
    `body` LONGTEXT NULL,
    `headers` TEXT NULL,
    `from` VARCHAR(255) NULL,
    `to` TEXT NULL,
    `cc` TEXT NULL,
    `bcc` TEXT NULL,
    `has_attachments` TINYINT NOT NULL DEFAULT '''0''',
    `message_id` VARCHAR(255) NULL,
    `source_via` TINYINT UNSIGNED NOT NULL,
    `source_type` TINYINT UNSIGNED NOT NULL,
    `customer_id` INT UNSIGNED NULL,
    `created_by_user_id` INT UNSIGNED NULL,
    `created_by_customer_id` INT UNSIGNED NULL,
    `edited_by_user_id` INT NULL,
    `edited_at` TIMESTAMP NULL,
    `body_original` LONGTEXT NULL,
    `first` TINYINT NOT NULL DEFAULT '''0''',
    `saved_reply_id` INT NULL,
    `send_status` TINYINT UNSIGNED NULL,
    `send_status_data` TEXT NULL,
    `opened_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `meta` TEXT NULL,
    `imported` TINYINT NOT NULL DEFAULT '''0'''
);
ALTER TABLE
    `threads` ADD INDEX `threads_conversation_id_type_from_customer_id_index`(
        `conversation_id`,
        `type`,
        `from`,
        `customer_id`
    );
ALTER TABLE
    `threads` ADD INDEX `threads_conversation_id_created_at_index`(`conversation_id`, `created_at`);
ALTER TABLE
    `threads` ADD UNIQUE `threads_message_id_unique`(`message_id`);
CREATE TABLE `users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `role` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `timezone` VARCHAR(255) NOT NULL DEFAULT '''UTC''',
    `photo_url` VARCHAR(255) NULL,
    `type` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `status` TINYINT UNSIGNED NOT NULL DEFAULT '''1''',
    `invite_state` TINYINT UNSIGNED NOT NULL DEFAULT '''3''',
    `invite_hash` VARCHAR(255) NULL,
    `emails` TEXT NULL,
    `job_title` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NULL,
    `time_format` TINYINT UNSIGNED NOT NULL DEFAULT '''2''',
    `enable_kb_shortcuts` TINYINT NOT NULL DEFAULT '''1''',
    `locked` TINYINT NOT NULL DEFAULT '''0''',
    `remember_token` VARCHAR(255) NULL,
    `locale` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `permissions` TEXT NULL
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD INDEX `users_role_index`(`role`);
ALTER TABLE
    `users` ADD INDEX `users_status_index`(`status`);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_folder_id_foreign` FOREIGN KEY(`folder_id`) REFERENCES `folders`(`id`);
ALTER TABLE
    `attachments` ADD CONSTRAINT `attachments_thread_id_foreign` FOREIGN KEY(`thread_id`) REFERENCES `threads`(`id`);
ALTER TABLE
    `mailbox_user` ADD CONSTRAINT `mailbox_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `send_logs` ADD CONSTRAINT `send_logs_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `customers`(`id`);
ALTER TABLE
    `followers` ADD CONSTRAINT `followers_conversation_id_foreign` FOREIGN KEY(`conversation_id`) REFERENCES `conversations`(`id`);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `customers`(`id`);
ALTER TABLE
    `threads` ADD CONSTRAINT `threads_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `customers`(`id`);
ALTER TABLE
    `send_logs` ADD CONSTRAINT `send_logs_thread_id_foreign` FOREIGN KEY(`thread_id`) REFERENCES `threads`(`id`);
ALTER TABLE
    `conversation_folder` ADD CONSTRAINT `conversation_folder_conversation_id_foreign` FOREIGN KEY(`conversation_id`) REFERENCES `conversations`(`id`);
ALTER TABLE
    `folders` ADD CONSTRAINT `folders_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `folders` ADD CONSTRAINT `folders_mailbox_id_foreign` FOREIGN KEY(`mailbox_id`) REFERENCES `mailboxes`(`id`);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `threads` ADD CONSTRAINT `threads_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `conversation_folder` ADD CONSTRAINT `conversation_folder_folder_id_foreign` FOREIGN KEY(`folder_id`) REFERENCES `folders`(`id`);
ALTER TABLE
    `attachments` ADD CONSTRAINT `attachments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `mailbox_user` ADD CONSTRAINT `mailbox_user_mailbox_id_foreign` FOREIGN KEY(`mailbox_id`) REFERENCES `mailboxes`(`id`);
ALTER TABLE
    `subscriptions` ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_mailbox_id_foreign` FOREIGN KEY(`mailbox_id`) REFERENCES `mailboxes`(`id`);
ALTER TABLE
    `emails` ADD CONSTRAINT `emails_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `customers`(`id`);
ALTER TABLE
    `followers` ADD CONSTRAINT `followers_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `threads` ADD CONSTRAINT `threads_conversation_id_foreign` FOREIGN KEY(`conversation_id`) REFERENCES `conversations`(`id`);
ALTER TABLE
    `send_logs` ADD CONSTRAINT `send_logs_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);