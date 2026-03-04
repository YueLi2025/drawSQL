CREATE TABLE `failed_jobs`(
    `id` BIGINT NOT NULL,
    `connection` TEXT NOT NULL,
    `queue` TEXT NOT NULL,
    `payload` LONGTEXT NOT NULL,
    `exception` LONGTEXT NOT NULL,
    `failed_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `likes`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `likeable_id` INT NOT NULL,
    `likeable_type` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `migrations`(
    `id` INT NOT NULL,
    `migration` VARCHAR(255) NOT NULL,
    `batch` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `notifications`(
    `id` CHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `notifiable_type` VARCHAR(255) NOT NULL,
    `notifiable_id` BIGINT NOT NULL,
    `data` TEXT NOT NULL,
    `read_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notifications` ADD INDEX `notifications_notifiable_type_notifiable_id_index`(`notifiable_type`, `notifiable_id`);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL
);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_email_index`(`email`);
CREATE TABLE `replies`(
    `id` INT NOT NULL,
    `body` TEXT NOT NULL,
    `author_id` INT NOT NULL,
    `replyable_id` INT NOT NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    `replyable_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `replies` ADD INDEX `replies_author_id_index`(`author_id`);
ALTER TABLE
    `replies` ADD INDEX `replies_replyable_id_index`(`replyable_id`);
CREATE TABLE `subscriptions`(
    `uuid` CHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `subscriptionable_id` INT NOT NULL,
    `subscriptionable_type` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`uuid`)
);
ALTER TABLE
    `subscriptions` ADD UNIQUE `user_id_subscriptionable_id_subscriptionable_type_unique`(
        `user_id`,
        `subscriptionable_id`,
        `subscriptionable_type`
    );
ALTER TABLE
    `subscriptions` ADD INDEX `subscriptions_user_id_index`(`user_id`);
CREATE TABLE `taggables`(
    `id` INT NOT NULL,
    `taggable_id` INT NOT NULL,
    `tag_id` INT NOT NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    `taggable_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `taggables` ADD INDEX `taggables_taggable_id_index`(`taggable_id`);
ALTER TABLE
    `taggables` ADD INDEX `taggables_tag_id_index`(`tag_id`);
CREATE TABLE `tags`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tags` ADD UNIQUE `tags_name_unique`(`name`);
ALTER TABLE
    `tags` ADD UNIQUE `tags_slug_unique`(`slug`);
CREATE TABLE `threads`(
    `id` INT NOT NULL,
    `author_id` INT NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `body` TEXT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    `solution_reply_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `threads` ADD INDEX `threads_author_id_index`(`author_id`);
ALTER TABLE
    `threads` ADD UNIQUE `threads_slug_unique`(`slug`);
ALTER TABLE
    `threads` ADD INDEX `threads_solution_reply_id_index`(`solution_reply_id`);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `github_id` VARCHAR(255) NOT NULL,
    `github_username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    `remember_token` VARCHAR(255) NOT NULL,
    `confirmed` TINYINT NOT NULL,
    `confirmation_code` VARCHAR(255) NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `type` SMALLINT NOT NULL,
    `bio` VARCHAR(255) NOT NULL,
    `banned_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD UNIQUE `users_username_unique`(`username`);
ALTER TABLE
    `likes` ADD CONSTRAINT `likes_likeable_id_foreign` FOREIGN KEY(`likeable_id`) REFERENCES `replies`(`id`);
ALTER TABLE
    `taggables` ADD CONSTRAINT `taggables_taggable_id_foreign` FOREIGN KEY(`taggable_id`) REFERENCES `threads`(`id`);
ALTER TABLE
    `subscriptions` ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `likes` ADD CONSTRAINT `likes_likeable_id_foreign` FOREIGN KEY(`likeable_id`) REFERENCES `threads`(`id`);
ALTER TABLE
    `threads` ADD CONSTRAINT `threads_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_notifiable_id_foreign` FOREIGN KEY(`notifiable_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `threads` ADD CONSTRAINT `threads_solution_reply_id_foreign` FOREIGN KEY(`solution_reply_id`) REFERENCES `replies`(`id`);
ALTER TABLE
    `replies` ADD CONSTRAINT `replies_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `likes` ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `taggables` ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);