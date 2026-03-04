CREATE TABLE `users`(
    `id` BIGINT NOT NULL,
    `email` VARCHAR(255) NOT NULL,
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
    `failed_attempts` INT NOT NULL,
    `unlock_token` VARCHAR(255) NULL,
    `locked_at` DATETIME NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD UNIQUE `users_reset_password_token_unique`(`reset_password_token`);
ALTER TABLE
    `users` ADD UNIQUE `users_confirmation_token_unique`(`confirmation_token`);
ALTER TABLE
    `users` ADD UNIQUE `users_unlock_token_unique`(`unlock_token`);