CREATE TABLE `subscriptions`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `stripe_id` VARCHAR(255) NOT NULL,
    `stripe_status` VARCHAR(255) NOT NULL,
    `stripe_price` BIGINT NULL,
    `quantity` INT NULL,
    `trial_ends_at` DATETIME NULL,
    `ends_at` DATETIME NULL,
    `updated_at` DATETIME NOT NULL,
    `created_at` DATETIME NOT NULL
);
ALTER TABLE
    `subscriptions` ADD INDEX `subscriptions_user_id_stripe_status_index`(`user_id`, `stripe_status`);
ALTER TABLE
    `subscriptions` ADD UNIQUE `subscriptions_stripe_id_unique`(`stripe_id`);
CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `stripe_id` BIGINT NULL,
    `pm_type` BIGINT NULL,
    `pm_last_four` VARCHAR(4) NULL,
    `pm_expiration` VARCHAR(255) NULL,
    `extra_billing_information` TEXT NULL,
    `trial_ends_at` DATETIME NULL,
    `billing_address` VARCHAR(255) NULL,
    `billing_address_line_2` VARCHAR(255) NULL,
    `billing_city` VARCHAR(255) NULL,
    `billing_state` VARCHAR(255) NULL,
    `billing_postal_code` VARCHAR(25) NULL,
    `billing_country` VARCHAR(2) NULL,
    `vat_id` VARCHAR(50) NULL,
    `receipt_emails` TEXT NULL
);
ALTER TABLE
    `users` ADD INDEX `users_stripe_id_index`(`stripe_id`);
CREATE TABLE `subscription_items`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `subscription_id` BIGINT NOT NULL,
    `stripe_id` VARCHAR(255) NOT NULL,
    `stripe_product` VARCHAR(255) NOT NULL,
    `stripe_price` VARCHAR(255) NOT NULL,
    `quantity` INT NULL,
    `updated_at` DATETIME NOT NULL,
    `created_at` DATETIME NOT NULL
);
ALTER TABLE
    `subscription_items` ADD UNIQUE `subscription_items_subscription_id_stripe_price_unique`(`subscription_id`, `stripe_price`);
ALTER TABLE
    `subscription_items` ADD UNIQUE `subscription_items_stripe_id_unique`(`stripe_id`);
CREATE TABLE `receipts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `provider_id` BIGINT NOT NULL,
    `amount` VARCHAR(255) NOT NULL,
    `tax` VARCHAR(255) NOT NULL,
    `paid_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `receipts` ADD INDEX `receipts_user_id_index`(`user_id`);
ALTER TABLE
    `receipts` ADD INDEX `receipts_provider_id_index`(`provider_id`);
CREATE TABLE `tax_rates`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `stripe_id` VARCHAR(255) NOT NULL,
    `percentage` DOUBLE NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `created_at` DATETIME NOT NULL
);
ALTER TABLE
    `tax_rates` ADD INDEX `tax_rates_stripe_id_index`(`stripe_id`);
ALTER TABLE
    `tax_rates` ADD INDEX `tax_rates_percentage_index`(`percentage`);
ALTER TABLE
    `subscription_items` ADD CONSTRAINT `subscription_items_subscription_id_foreign` FOREIGN KEY(`subscription_id`) REFERENCES `subscriptions`(`id`);
ALTER TABLE
    `subscriptions` ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `receipts` ADD CONSTRAINT `receipts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);