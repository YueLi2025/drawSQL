CREATE TABLE `users`(
    `(id)` INT NOT NULL,
    `stripe_id` VARCHAR(255) NULL,
    `pm_type` VARCHAR(255) NULL,
    `pm_last_four` VARCHAR(4) NULL,
    `trial_ends_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`(id)`)
);
ALTER TABLE
    `users` ADD INDEX `users_stripe_id_index`(`stripe_id`);
CREATE TABLE `subscriptions`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `stripe_id` VARCHAR(255) NOT NULL,
    `stripe_status` VARCHAR(255) NOT NULL,
    `stripe_price` VARCHAR(255) NULL,
    `quantity` INT NULL,
    `trial_ends_at` TIMESTAMP NULL,
    `ends_at` TIMESTAMP NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `subscriptions` ADD INDEX `subscriptions_user_id_stripe_status_index`(`user_id`, `stripe_status`);
ALTER TABLE
    `subscriptions` ADD UNIQUE `subscriptions_stripe_id_unique`(`stripe_id`);
CREATE TABLE `subscription_items`(
    `id` BIGINT NOT NULL,
    `subscription_id` BIGINT NOT NULL,
    `stripe_id` VARCHAR(255) NOT NULL,
    `stripe_product` VARCHAR(255) NOT NULL,
    `stripe_price` VARCHAR(255) NOT NULL,
    `quantity` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `subscription_items` ADD UNIQUE `subscription_items_subscription_id_stripe_price_unique`(`subscription_id`, `stripe_price`);
ALTER TABLE
    `subscription_items` ADD UNIQUE `subscription_items_stripe_id_unique`(`stripe_id`);
ALTER TABLE
    `subscription_items` ADD CONSTRAINT `subscription_items_subscription_id_foreign` FOREIGN KEY(`subscription_id`) REFERENCES `subscriptions`(`id`);
ALTER TABLE
    `subscriptions` ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`(id)`);