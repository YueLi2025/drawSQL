CREATE TABLE `threads`(
    `id` INT NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `deleted_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `messages`(
    `id` INT NOT NULL,
    `thread_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `body` TEXT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `deleted_at` DATETIME NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `participants`(
    `id` INT NOT NULL,
    `thread_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `last_read` TIMESTAMP NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `deleted_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_thread_id_foreign` FOREIGN KEY(`thread_id`) REFERENCES `threads`(`id`);
ALTER TABLE
    `participants` ADD CONSTRAINT `participants_thread_id_foreign` FOREIGN KEY(`thread_id`) REFERENCES `threads`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `participants` ADD CONSTRAINT `participants_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);