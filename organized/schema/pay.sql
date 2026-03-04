CREATE TABLE `pay_charges`(
    `id` INT NOT NULL,
    `owner_type` VARCHAR(255) NULL,
    `owner_id` INT NULL,
    `processor` VARCHAR(255) NOT NULL,
    `processor_id` VARCHAR(255) NOT NULL,
    `amount` INT NOT NULL,
    `amount_refunded` INT NULL,
    `card_type` VARCHAR(255) NULL,
    `card_last4` VARCHAR(255) NULL,
    `card_exp_month` VARCHAR(255) NULL,
    `card_exp_year` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `pay_subscriptions`(
    `id` INT NOT NULL,
    `owner_id` INT NULL,
    `name` VARCHAR(255) NOT NULL,
    `processor` VARCHAR(255) NOT NULL,
    `processor_id` VARCHAR(255) NOT NULL,
    `processor_plan` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL,
    `trial_ends_at` DATETIME NULL,
    `ends_at` DATETIME NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    `status` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `(billable)`(
    `id` INT NOT NULL,
    `processor` VARCHAR(255) NULL,
    `processor_id` VARCHAR(255) NULL,
    `trial_ends_at` DATETIME NULL,
    `card_type` VARCHAR(255) NULL,
    `card_last4` VARCHAR(255) NULL,
    `card_exp_month` VARCHAR(255) NULL,
    `card_exp_year` VARCHAR(255) NULL,
    `extra_billing_info` TEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `pay_charges` ADD CONSTRAINT `pay_charges_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `(billable)`(`id`);
ALTER TABLE
    `pay_subscriptions` ADD CONSTRAINT `pay_subscriptions_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `(billable)`(`id`);