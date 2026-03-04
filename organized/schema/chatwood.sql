CREATE TABLE `access_tokens`(
    `id` BIGINT NOT NULL,
    `owner_type` VARCHAR(255) NULL,
    `owner_id` BIGINT NULL,
    `token` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `access_tokens` ADD INDEX `access_tokens_owner_type_owner_id_index`(`owner_type`, `owner_id`);
ALTER TABLE
    `access_tokens` ADD UNIQUE `access_tokens_token_unique`(`token`);
CREATE TABLE `account_users`(
    `id` BIGINT NOT NULL,
    `account_id` INT NULL,
    `user_id` INT NULL,
    `role` INT NULL,
    `inviter_id` BIGINT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `account_users` ADD UNIQUE `account_users_account_id_user_id_unique`(`account_id`, `user_id`);
ALTER TABLE
    `account_users` ADD INDEX `account_users_account_id_index`(`account_id`);
ALTER TABLE
    `account_users` ADD INDEX `account_users_user_id_index`(`user_id`);
CREATE TABLE `accounts`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `locale` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `active_storage_attachments`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `record_type` VARCHAR(255) NOT NULL,
    `record_id` BIGINT NOT NULL,
    `blob_id` BIGINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `active_storage_attachments` ADD UNIQUE `name_record_type_record_id_blob_id_unique`(
        `name`,
        `record_type`,
        `record_id`,
        `blob_id`
    );
ALTER TABLE
    `active_storage_attachments` ADD INDEX `active_storage_attachments_blob_id_index`(`blob_id`);
CREATE TABLE `active_storage_blobs`(
    `id` BIGINT NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `filename` VARCHAR(255) NOT NULL,
    `content_type` VARCHAR(255) NULL,
    `metadata` TEXT NULL,
    `byte_size` BIGINT NOT NULL,
    `checksum` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `active_storage_blobs` ADD UNIQUE `active_storage_blobs_key_unique`(`key`);
CREATE TABLE `agent_bot_inboxes`(
    `id` BIGINT NOT NULL,
    `inbox_id` INT NULL,
    `agent_bot_id` INT NULL,
    `status` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `account_id` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `agent_bots`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `outgoing_url` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `attachments`(
    `id` INT NOT NULL,
    `file_type` INT NULL,
    `external_url` VARCHAR(255) NULL,
    `coordinates_lat` FLOAT(53) NULL,
    `coordinates_long` FLOAT(53) NULL,
    `message_id` INT NOT NULL,
    `account_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `fallback_title` VARCHAR(255) NULL,
    `extension` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `canned_responses`(
    `id` INT NOT NULL,
    `account_id` INT NOT NULL,
    `short_code` VARCHAR(255) NULL,
    `content` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `channel_facebook_pages`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `page_id` VARCHAR(255) NOT NULL,
    `user_access_token` VARCHAR(255) NOT NULL,
    `page_access_token` VARCHAR(255) NOT NULL,
    `account_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `channel_facebook_pages` ADD UNIQUE `channel_facebook_pages_page_id_account_id_unique`(`page_id`, `account_id`);
ALTER TABLE
    `channel_facebook_pages` ADD INDEX `channel_facebook_pages_page_id_index`(`page_id`);
CREATE TABLE `channel_twilio_sms`(
    `id` BIGINT NOT NULL,
    `phone_number` VARCHAR(255) NOT NULL,
    `auth_token` VARCHAR(255) NOT NULL,
    `account_sid` VARCHAR(255) NOT NULL,
    `account_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `channel_twilio_sms` ADD UNIQUE `channel_twilio_sms_phone_number_account_id_unique`(`phone_number`, `account_id`);
CREATE TABLE `channel_twitter_profiles`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NULL,
    `profile_id` VARCHAR(255) NOT NULL,
    `twitter_access_token` VARCHAR(255) NOT NULL,
    `twitter_access_token_secret` VARCHAR(255) NOT NULL,
    `account_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `channel_twitter_profiles` ADD UNIQUE `channel_twitter_profiles_profile_id_account_id_unique`(`profile_id`, `account_id`);
CREATE TABLE `channel_web_widgets`(
    `id` INT NOT NULL,
    `website_name` VARCHAR(255) NULL,
    `website_url` VARCHAR(255) NULL,
    `account_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `website_token` VARCHAR(255) NULL,
    `widget_color` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `channel_web_widgets` ADD UNIQUE `channel_web_widgets_website_token_unique`(`website_token`);
CREATE TABLE `contact_inboxes`(
    `id` INT NOT NULL,
    `contact_id` INT NULL,
    `inbox_id` INT NULL,
    `source_id` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL
);
ALTER TABLE
    `contact_inboxes` ADD UNIQUE `contact_inboxes_inbox_id_source_id_unique`(`inbox_id`, `source_id`);
ALTER TABLE
    `contact_inboxes` ADD INDEX `contact_inboxes_source_id_index`(`source_id`);
CREATE TABLE `contacts`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `phone_number` VARCHAR(255) NULL,
    `account_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `pubsub_token` VARCHAR(255) NULL,
    `additional_attributes` YEAR NULL,
    `source_id` BIGINT NULL,
    `identifier` VARCHAR(255) NULL,
    `additional_attributes` JSON NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `contacts` ADD UNIQUE `contacts_account_id_identifier_unique`(`account_id`, `identifier`);
ALTER TABLE
    `contacts` ADD UNIQUE `contacts_email_account_id_unique`(`email`, `account_id`);
ALTER TABLE
    `contacts` ADD INDEX `contacts_account_id_index`(`account_id`);
ALTER TABLE
    `contacts` ADD UNIQUE `contacts_pubsub_token_unique`(`pubsub_token`);
CREATE TABLE `conversations`(
    `id` INT NOT NULL,
    `account_id` INT NOT NULL,
    `inbox_id` INT NOT NULL,
    `status` INT NOT NULL,
    `assignee_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `contact_id` BIGINT NULL,
    `display_id` INT NOT NULL,
    `user_last_seen_at` DATETIME NULL,
    `agent_last_seen_at` DATETIME NULL,
    `locked` TINYINT NULL,
    `contact_inbox_id` INT NULL,
    `additional_attributes` JSON NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `conversations` ADD UNIQUE `conversations_account_id_display_id_unique`(`account_id`, `display_id`);
ALTER TABLE
    `conversations` ADD INDEX `conversations_account_id_index`(`account_id`);
ALTER TABLE
    `conversations` ADD INDEX `conversations_contact_inbox_id_index`(`contact_inbox_id`);
CREATE TABLE `events`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NULL,
    `value` FLOAT(53) NULL,
    `account_id` INT NULL,
    `inbox_id` INT NULL,
    `user_id` INT NULL,
    `conversation_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `events` ADD INDEX `events_name_index`(`name`);
ALTER TABLE
    `events` ADD INDEX `events_account_id_index`(`account_id`);
ALTER TABLE
    `events` ADD INDEX `events_inbox_id_index`(`inbox_id`);
ALTER TABLE
    `events` ADD INDEX `events_user_id_index`(`user_id`);
ALTER TABLE
    `events` ADD INDEX `events_created_at_index`(`created_at`);
CREATE TABLE `inbox_members`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `inbox_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `inbox_members` ADD INDEX `inbox_members_inbox_id_index`(`inbox_id`);
CREATE TABLE `inboxes`(
    `id` INT NOT NULL,
    `channel_id` INT NOT NULL,
    `account_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `channel_type` VARCHAR(255) NULL,
    `enable_auto_assignment` TINYINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `inboxes` ADD INDEX `inboxes_account_id_index`(`account_id`);
CREATE TABLE `messages`(
    `id` INT NOT NULL,
    `content` TEXT NULL,
    `account_id` INT NOT NULL,
    `inbox_id` INT NOT NULL,
    `conversation_id` INT NOT NULL,
    `message_type` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `private` TINYINT NULL,
    `user_id` INT NULL,
    `status` INT NULL,
    `source_id` VARCHAR(255) NULL,
    `content_type` INT NULL,
    `content_attributes` JSON NULL,
    `contact_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `messages` ADD INDEX `messages_account_id_index`(`account_id`);
ALTER TABLE
    `messages` ADD INDEX `messages_inbox_id_index`(`inbox_id`);
ALTER TABLE
    `messages` ADD INDEX `messages_conversation_id_index`(`conversation_id`);
ALTER TABLE
    `messages` ADD INDEX `messages_user_id_index`(`user_id`);
ALTER TABLE
    `messages` ADD INDEX `messages_source_id_index`(`source_id`);
ALTER TABLE
    `messages` ADD INDEX `messages_contact_id_index`(`contact_id`);
CREATE TABLE `notification_settings`(
    `id` BIGINT NOT NULL,
    `account_id` INT NULL,
    `user_id` INT NULL,
    `email_flags` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notification_settings` ADD UNIQUE `notification_settings_account_id_user_id_unique`(`account_id`, `user_id`);
CREATE TABLE `subscriptions`(
    `id` INT NOT NULL,
    `pricing_version` VARCHAR(255) NULL,
    `account_id` INT NULL,
    `expiry` DATETIME NULL,
    `billing_plan` VARCHAR(255) NULL,
    `stripe_customer_id` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `state` INT NULL,
    `payment_source_added` TINYINT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `taggings`(
    `id` INT NOT NULL,
    `tag_id` INT NULL,
    `taggable_type` VARCHAR(255) NULL,
    `taggable_id` INT NULL,
    `tagger_type` VARCHAR(255) NULL,
    `tagger_id` INT NULL,
    `context` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `taggings` ADD UNIQUE `unique_0316392f6f7ec07b87dd180d5fce5337`(
        `tag_id`,
        `taggable_type`,
        `taggable_id`,
        `tagger_type`,
        `tagger_id`,
        `context`
    );
ALTER TABLE
    `taggings` ADD INDEX `taggings_taggable_type_taggable_id_index`(`taggable_type`, `taggable_id`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_tagger_type_tagger_id_index`(`tagger_type`, `tagger_id`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_taggable_type_taggable_id_context_index`(
        `taggable_type`,
        `taggable_id`,
        `context`
    );
ALTER TABLE
    `taggings` ADD INDEX `taggings_tagger_type_tagger_id_index`(`tagger_type`, `tagger_id`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_taggable_type_taggable_id_tagger_id_context_index`(
        `taggable_type`,
        `taggable_id`,
        `tagger_id`,
        `context`
    );
ALTER TABLE
    `taggings` ADD INDEX `taggings_tag_id_index`(`tag_id`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_taggable_type_index`(`taggable_type`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_taggable_id_index`(`taggable_id`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_tagger_id_index`(`tagger_id`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_context_index`(`context`);
CREATE TABLE `tags`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `taggings_count` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tags` ADD UNIQUE `tags_name_unique`(`name`);
CREATE TABLE `telegram_bots`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `auth_key` VARCHAR(255) NULL,
    `account_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `provider` VARCHAR(255) NOT NULL,
    `uid` VARCHAR(255) NOT NULL,
    `inviter` INT NOT NULL,
    `encrypted_password` VARCHAR(255) NOT NULL,
    `reset_password_token` VARCHAR(255) NULL,
    `reset_password_sent_at` DATETIME NULL,
    `remember_created_at` DATETIME NULL,
    `sign_in_count` INT NOT NULL,
    `current_sign_in_at` DATETIME NULL,
    `last_sign_in_at` DATETIME NULL,
    `current_sign_in_ip` VARCHAR(255) NULL,
    `last_sign_in_ip` VARCHAR(255) NULL,
    `confirmation_token` VARCHAR(255) NULL,
    `confirmed_at` DATETIME NULL,
    `confirmation_sent_at` DATETIME NULL,
    `unconfirmed_email` VARCHAR(255) NULL,
    `name` VARCHAR(255) NOT NULL,
    `nickname` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `tokens` JSON NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `pubsub_token` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_provider_uid_unique`(`provider`, `uid`);
ALTER TABLE
    `users` ADD UNIQUE `users_reset_password_token_unique`(`reset_password_token`);
ALTER TABLE
    `users` ADD INDEX `users_email_index`(`email`);
ALTER TABLE
    `users` ADD UNIQUE `users_pubsub_token_unique`(`pubsub_token`);
CREATE TABLE `webhooks`(
    `id` BIGINT NOT NULL,
    `account_id` INT NULL,
    `inbox_id` INT NULL,
    `url` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `webhook_type` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `webhooks` ADD UNIQUE `webhooks_account_id_url_unique`(`account_id`, `url`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_conversation_id_foreign` FOREIGN KEY(`conversation_id`) REFERENCES `conversations`(`id`);
ALTER TABLE
    `channel_web_widgets` ADD CONSTRAINT `channel_web_widgets_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `telegram_bots` ADD CONSTRAINT `telegram_bots_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `account_users` ADD CONSTRAINT `account_users_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `subscriptions` ADD CONSTRAINT `subscriptions_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `channel_twitter_profiles` ADD CONSTRAINT `channel_twitter_profiles_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_contact_id_foreign` FOREIGN KEY(`contact_id`) REFERENCES `contacts`(`id`);
ALTER TABLE
    `agent_bot_inboxes` ADD CONSTRAINT `agent_bot_inboxes_agent_bot_id_foreign` FOREIGN KEY(`agent_bot_id`) REFERENCES `agent_bots`(`id`);
ALTER TABLE
    `inbox_members` ADD CONSTRAINT `inbox_members_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_inbox_id_foreign` FOREIGN KEY(`inbox_id`) REFERENCES `inboxes`(`id`);
ALTER TABLE
    `attachments` ADD CONSTRAINT `attachments_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `webhooks` ADD CONSTRAINT `webhooks_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `contact_inboxes` ADD CONSTRAINT `contact_inboxes_inbox_id_foreign` FOREIGN KEY(`inbox_id`) REFERENCES `inboxes`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY(`conversation_id`) REFERENCES `conversations`(`id`);
ALTER TABLE
    `inbox_members` ADD CONSTRAINT `inbox_members_inbox_id_foreign` FOREIGN KEY(`inbox_id`) REFERENCES `inboxes`(`id`);
ALTER TABLE
    `inboxes` ADD CONSTRAINT `inboxes_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `attachments` ADD CONSTRAINT `attachments_message_id_foreign` FOREIGN KEY(`message_id`) REFERENCES `messages`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_contact_inbox_id_foreign` FOREIGN KEY(`contact_inbox_id`) REFERENCES `contact_inboxes`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_inbox_id_foreign` FOREIGN KEY(`inbox_id`) REFERENCES `inboxes`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_inbox_id_foreign` FOREIGN KEY(`inbox_id`) REFERENCES `inboxes`(`id`);
ALTER TABLE
    `agent_bot_inboxes` ADD CONSTRAINT `agent_bot_inboxes_inbox_id_foreign` FOREIGN KEY(`inbox_id`) REFERENCES `inboxes`(`id`);
ALTER TABLE
    `agent_bot_inboxes` ADD CONSTRAINT `agent_bot_inboxes_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `notification_settings` ADD CONSTRAINT `notification_settings_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `channel_facebook_pages` ADD CONSTRAINT `channel_facebook_pages_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `webhooks` ADD CONSTRAINT `webhooks_inbox_id_foreign` FOREIGN KEY(`inbox_id`) REFERENCES `inboxes`(`id`);
ALTER TABLE
    `contact_inboxes` ADD CONSTRAINT `contact_inboxes_contact_id_foreign` FOREIGN KEY(`contact_id`) REFERENCES `contacts`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_inviter_foreign` FOREIGN KEY(`inviter`) REFERENCES `users`(`id`);
ALTER TABLE
    `account_users` ADD CONSTRAINT `account_users_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_contact_id_foreign` FOREIGN KEY(`contact_id`) REFERENCES `contacts`(`id`);
ALTER TABLE
    `notification_settings` ADD CONSTRAINT `notification_settings_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `contacts` ADD CONSTRAINT `contacts_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `active_storage_attachments` ADD CONSTRAINT `active_storage_attachments_blob_id_foreign` FOREIGN KEY(`blob_id`) REFERENCES `active_storage_blobs`(`id`);
ALTER TABLE
    `canned_responses` ADD CONSTRAINT `canned_responses_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `channel_twilio_sms` ADD CONSTRAINT `channel_twilio_sms_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `taggings` ADD CONSTRAINT `taggings_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);