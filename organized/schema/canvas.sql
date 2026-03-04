CREATE TABLE `canvas_posts`(
    `id` CHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `summary` TEXT NULL,
    `body` TEXT NULL,
    `published_at` DATETIME NULL,
    `featured_image` VARCHAR(255) NULL,
    `featured_image_caption` VARCHAR(255) NULL,
    `user_id` BIGINT NOT NULL,
    `meta` JSON NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `canvas_posts` ADD UNIQUE `canvas_posts_slug_user_id_unique`(`slug`, `user_id`);
ALTER TABLE
    `canvas_posts` ADD INDEX `canvas_posts_user_id_index`(`user_id`);
CREATE TABLE `canvas_posts_tags`(
    `tag_id` CHAR(255) NOT NULL,
    `post_id` CHAR(255) NOT NULL
);
ALTER TABLE
    `canvas_posts_tags` ADD UNIQUE `canvas_posts_tags_post_id_tag_id_unique`(`post_id`, `tag_id`);
CREATE TABLE `canvas_posts_topics`(
    `post_id` CHAR(255) NOT NULL,
    `topic_id` CHAR(255) NOT NULL
);
ALTER TABLE
    `canvas_posts_topics` ADD UNIQUE `canvas_posts_topics_post_id_topic_id_unique`(`post_id`, `topic_id`);
CREATE TABLE `canvas_tags`(
    `id` CHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `canvas_tags` ADD UNIQUE `canvas_tags_slug_user_id_unique`(`slug`, `user_id`);
ALTER TABLE
    `canvas_tags` ADD INDEX `canvas_tags_user_id_index`(`user_id`);
ALTER TABLE
    `canvas_tags` ADD INDEX `canvas_tags_created_at_index`(`created_at`);
CREATE TABLE `canvas_topics`(
    `id` CHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `canvas_topics` ADD UNIQUE `canvas_topics_slug_user_id_unique`(`slug`, `user_id`);
ALTER TABLE
    `canvas_topics` ADD INDEX `canvas_topics_user_id_index`(`user_id`);
ALTER TABLE
    `canvas_topics` ADD INDEX `canvas_topics_created_at_index`(`created_at`);
CREATE TABLE `canvas_user_meta`(
    `id` INT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `username` VARCHAR(255) NULL,
    `summary` TEXT NULL,
    `avatar` VARCHAR(255) NULL,
    `dark_mode` TINYINT NULL,
    `digest` TINYINT NULL,
    `locale` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `canvas_user_meta` ADD UNIQUE `canvas_user_meta_user_id_unique`(`user_id`);
ALTER TABLE
    `canvas_user_meta` ADD UNIQUE `canvas_user_meta_username_unique`(`username`);
CREATE TABLE `canvas_views`(
    `id` INT NOT NULL,
    `post_id` CHAR(255) NOT NULL,
    `ip` VARCHAR(255) NULL,
    `agent` VARCHAR(255) NULL,
    `referer` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `canvas_views` ADD INDEX `canvas_views_post_id_index`(`post_id`);
ALTER TABLE
    `canvas_views` ADD INDEX `canvas_views_created_at_index`(`created_at`);
CREATE TABLE `canvas_visits`(
    `id` INT NOT NULL,
    `post_id` CHAR(255) NOT NULL,
    `ip` VARCHAR(255) NULL,
    `agent` VARCHAR(255) NULL,
    `referer` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `email_verified_at` TIMESTAMP NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `canvas_views` ADD CONSTRAINT `canvas_views_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `canvas_posts`(`id`);
ALTER TABLE
    `canvas_visits` ADD CONSTRAINT `canvas_visits_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `canvas_posts`(`id`);
ALTER TABLE
    `canvas_posts_tags` ADD CONSTRAINT `canvas_posts_tags_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `canvas_posts`(`id`);
ALTER TABLE
    `canvas_posts` ADD CONSTRAINT `canvas_posts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `canvas_posts_tags` ADD CONSTRAINT `canvas_posts_tags_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `canvas_tags`(`id`);
ALTER TABLE
    `canvas_user_meta` ADD CONSTRAINT `canvas_user_meta_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `canvas_posts_topics` ADD CONSTRAINT `canvas_posts_topics_topic_id_foreign` FOREIGN KEY(`topic_id`) REFERENCES `canvas_topics`(`id`);
ALTER TABLE
    `canvas_tags` ADD CONSTRAINT `canvas_tags_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `canvas_topics` ADD CONSTRAINT `canvas_topics_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `canvas_posts_topics` ADD CONSTRAINT `canvas_posts_topics_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `canvas_posts`(`id`);