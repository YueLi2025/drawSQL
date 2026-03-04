CREATE TABLE `announcements`(
    `id` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `body` TEXT NOT NULL,
    `action_text` VARCHAR(255) NULL,
    `action_url` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `api_tokens`(
    `id` INT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `token` INT NOT NULL,
    `metadata` TEXT NOT NULL,
    `transient` TINYINT NOT NULL,
    `last_used_at` TIMESTAMP NULL,
    `expires_at` TIMESTAMP NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_tokens` ADD INDEX `api_tokens_user_id_expires_at_index`(`user_id`, `expires_at`);
ALTER TABLE
    `api_tokens` ADD UNIQUE `api_tokens_token_unique`(`token`);
CREATE TABLE `invitations`(
    `id` VARCHAR(255) NOT NULL,
    `team_id` BIGINT NOT NULL,
    `user_id` BIGINT NULL,
    `role` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `invitations` ADD INDEX `invitations_team_id_index`(`team_id`);
ALTER TABLE
    `invitations` ADD INDEX `invitations_user_id_index`(`user_id`);
ALTER TABLE
    `invitations` ADD UNIQUE `invitations_token_unique`(`token`);
CREATE TABLE `invoices`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NULL,
    `team_id` BIGINT NULL,
    `provider_id` VARCHAR(255) NOT NULL,
    `total` DECIMAL(8, 2) NULL,
    `tax` DECIMAL(8, 2) NULL,
    `card_country` VARCHAR(255) NULL,
    `billing_state` VARCHAR(255) NULL,
    `billing_zip` VARCHAR(255) NULL,
    `billing_country` VARCHAR(255) NULL,
    `vat_id` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `invoices` ADD INDEX `invoices_user_id_index`(`user_id`);
ALTER TABLE
    `invoices` ADD INDEX `invoices_team_id_index`(`team_id`);
ALTER TABLE
    `invoices` ADD INDEX `invoices_created_at_index`(`created_at`);
CREATE TABLE `notifications`(
    `id` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `created_at` BIGINT NULL,
    `icon` VARCHAR(255) NULL,
    `body` TEXT NOT NULL,
    `action_text` VARCHAR(255) NULL,
    `action_url` TEXT NULL,
    `read` TINYINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notifications` ADD INDEX `notifications_user_id_created_at_index`(`user_id`, `created_at`);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL
);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_email_index`(`email`);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_token_index`(`token`);
CREATE TABLE `performance_indicators`(
    `id` BIGINT NOT NULL,
    `monthly_recurring_revenue` DECIMAL(8, 2) NOT NULL,
    `yearly_recurring_revenue` DECIMAL(8, 2) NOT NULL,
    `daily_colume` DECIMAL(8, 2) NOT NULL,
    `new_users` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `performance_indicators` ADD INDEX `performance_indicators_created_at_index`(`created_at`);
CREATE TABLE `subscriptions`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `stipe_id` VARCHAR(255) NOT NULL,
    `stripe_plan` VARCHAR(255) NOT NULL,
    `stripe_status` VARCHAR(255) NULL,
    `quantity` INT NOT NULL,
    `trial_ends_at` TIMESTAMP NULL,
    `ends_at` TIMESTAMP NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `team_subscriptions`(
    `id` BIGINT NOT NULL,
    `team_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `stripe_id` VARCHAR(255) NOT NULL,
    `stripe_plan` VARCHAR(255) NOT NULL,
    `stripe_status` VARCHAR(255) NULL,
    `quantity` INT NOT NULL,
    `trial_ends_at` TIMESTAMP NULL,
    `ends_at` TIMESTAMP NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `team_users`(
    `team_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `role` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `team_users` ADD UNIQUE `team_users_team_id_user_id_unique`(`team_id`, `user_id`);
CREATE TABLE `teams`(
    `id` BIGINT NOT NULL,
    `owner_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NULL,
    `photo_url` TEXT NULL,
    `stripe_id` VARCHAR(255) NULL,
    `current_billing_plan` VARCHAR(255) NULL,
    `card_brand` VARCHAR(255) NULL,
    `card_last_four` VARCHAR(255) NULL,
    `card_country` VARCHAR(255) NULL,
    `billing_address` VARCHAR(255) NULL,
    `billing_address_line_2` VARCHAR(255) NULL,
    `billing_city` VARCHAR(255) NULL,
    `billing_state` VARCHAR(255) NULL,
    `billing_zip` VARCHAR(255) NULL,
    `billing_country` VARCHAR(255) NULL,
    `vat_id` VARCHAR(255) NULL,
    `extra_billing_information` TEXT NULL,
    `trial_ends_at` TIMESTAMP NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `teams` ADD INDEX `teams_owner_id_index`(`owner_id`);
ALTER TABLE
    `teams` ADD UNIQUE `teams_slug_unique`(`slug`);
CREATE TABLE `users`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `email_verified_at` TIMESTAMP NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `photo_url` TEXT NULL,
    `uses_two_factor_auth` TINYINT NOT NULL,
    `authy_id` VARCHAR(255) NULL,
    `country_code` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NULL,
    `stripe_id` VARCHAR(255) NULL,
    `two_factor_reset_code` VARCHAR(255) NULL,
    `current_team_id` INT NULL,
    `current_billing_plan` VARCHAR(255) NULL,
    `card_brand` VARCHAR(255) NULL,
    `card_last_four` VARCHAR(255) NULL,
    `card_country` VARCHAR(255) NULL,
    `billing_address` VARCHAR(255) NULL,
    `billing_address_line_2` VARCHAR(255) NULL,
    `billing_city` VARCHAR(255) NULL,
    `billing_state` VARCHAR(255) NULL,
    `billing_zip` VARCHAR(255) NULL,
    `billing_country` VARCHAR(255) NULL,
    `vat_id` VARCHAR(255) NULL,
    `extra_billing_information` TEXT NULL,
    `trial_ends_at` TIMESTAMP NULL,
    `last_read_announcements_at` TIMESTAMP NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `invoices` ADD CONSTRAINT `invoices_team_id_foreign` FOREIGN KEY(`team_id`) REFERENCES `teams`(`id`);
ALTER TABLE
    `invitations` ADD CONSTRAINT `invitations_team_id_foreign` FOREIGN KEY(`team_id`) REFERENCES `teams`(`id`);
ALTER TABLE
    `invitations` ADD CONSTRAINT `invitations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `team_users` ADD CONSTRAINT `team_users_team_id_foreign` FOREIGN KEY(`team_id`) REFERENCES `teams`(`id`);
ALTER TABLE
    `subscriptions` ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `api_tokens` ADD CONSTRAINT `api_tokens_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `team_subscriptions` ADD CONSTRAINT `team_subscriptions_team_id_foreign` FOREIGN KEY(`team_id`) REFERENCES `teams`(`id`);
ALTER TABLE
    `teams` ADD CONSTRAINT `teams_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `team_users` ADD CONSTRAINT `team_users_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `invoices` ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `announcements` ADD CONSTRAINT `announcements_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);