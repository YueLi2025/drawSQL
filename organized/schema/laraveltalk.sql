CREATE TABLE `messages`(
    `id` INT NOT NULL,
    `message` TEXT NOT NULL,
    `is_seen` BOOLEAN NOT NULL,
    `deleted_from_sender` BOOLEAN NOT NULL,
    `deleted_from_receiver` BOOLEAN NOT NULL,
    `user_id` INT NOT NULL,
    `conversation_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `conversations`(
    `id` INT NOT NULL,
    `user_one` INT NOT NULL,
    `user_two` INT NOT NULL,
    `status` BOOLEAN NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_user_two_foreign` FOREIGN KEY(`user_two`) REFERENCES `users`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_user_one_foreign` FOREIGN KEY(`user_one`) REFERENCES `users`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY(`conversation_id`) REFERENCES `conversations`(`id`);