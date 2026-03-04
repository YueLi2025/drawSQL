CREATE TABLE `account`(
    `id` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `date_created` TIMESTAMP NOT NULL,
    `stripe_customer_id` VARCHAR(255) NULL,
    `stripe_subscription_id` VARCHAR(255) NULL,
    `plan` VARCHAR(255) NULL,
    `referrer` VARCHAR(255) NULL,
    `active` TINYINT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `invite`(
    `id` INT NOT NULL,
    `invite_id` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `account_id` VARCHAR(255) NULL,
    `date_sent` TIMESTAMP NULL,
    `used` TINYINT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `user`(
    `id` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `date_created` TIMESTAMP NOT NULL,
    `last_login` TIMESTAMP NULL,
    `permission` VARCHAR(255) NULL,
    `push_token` VARCHAR(255) NULL,
    `account_id` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `user` ADD INDEX `user_account_id_index`(`account_id`);
ALTER TABLE
    `user` ADD CONSTRAINT `user_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `account`(`id`);
ALTER TABLE
    `invite` ADD CONSTRAINT `invite_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `account`(`id`);