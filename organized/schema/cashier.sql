CREATE TABLE `customers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `billable_id` BIGINT UNSIGNED NOT NULL,
    `billable_type` BIGINT NOT NULL,
    `trial_ends_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `customers` ADD INDEX `customers_billable_id_billable_type_index`(`billable_id`, `billable_type`);
CREATE TABLE `subscriptions`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `billable_id` BIGINT UNSIGNED NOT NULL,
    `billable_type` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `paddle_id` INT NOT NULL,
    `paddle_status` VARCHAR(255) NOT NULL,
    `paddle_plan` INT NOT NULL,
    `quantity` INT NOT NULL,
    `trial_ends_at` DATETIME NULL,
    `paused_from` DATETIME NULL,
    `ends_at` DATETIME NULL,
    `updated_at` DATETIME NOT NULL,
    `created_at` DATETIME NOT NULL
);
ALTER TABLE
    `subscriptions` ADD INDEX `subscriptions_billable_id_billable_type_index`(`billable_id`, `billable_type`);
ALTER TABLE
    `subscriptions` ADD UNIQUE `subscriptions_paddle_id_unique`(`paddle_id`);
CREATE TABLE `receipts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `billable_id` BIGINT UNSIGNED NOT NULL,
    `billable_type` VARCHAR(255) NOT NULL,
    `paddle_subscription_id` BIGINT UNSIGNED NULL,
    `checkout_id` VARCHAR(255) NOT NULL,
    `order_id` VARCHAR(255) NOT NULL,
    `amount` VARCHAR(255) NOT NULL,
    `tax` VARCHAR(255) NOT NULL,
    `currency` VARCHAR(3) NOT NULL,
    `quantity` INT NOT NULL,
    `receipt_url` VARCHAR(255) NOT NULL,
    `paid_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `receipts` ADD INDEX `receipts_billable_id_billable_type_index`(`billable_id`, `billable_type`);
ALTER TABLE
    `receipts` ADD INDEX `receipts_paddle_subscription_id_index`(`paddle_subscription_id`);
ALTER TABLE
    `receipts` ADD UNIQUE `receipts_receipt_url_unique`(`receipt_url`);
CREATE TABLE `users/teams`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE
    `subscriptions` ADD CONSTRAINT `subscriptions_billable_id_foreign` FOREIGN KEY(`billable_id`) REFERENCES `users/teams`(`id`);
ALTER TABLE
    `customers` ADD CONSTRAINT `customers_billable_id_foreign` FOREIGN KEY(`billable_id`) REFERENCES `users/teams`(`id`);
ALTER TABLE
    `receipts` ADD CONSTRAINT `receipts_billable_id_foreign` FOREIGN KEY(`billable_id`) REFERENCES `users/teams`(`id`);