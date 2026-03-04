CREATE TABLE `access_tokens`(
    `token` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `last_activity_at` DATETIME NOT NULL,
    `lifetime_seconds` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY(`token`)
);
ALTER TABLE
    `access_tokens` ADD INDEX `access_tokens_user_id_index`(`user_id`);
CREATE TABLE `api_keys`(
    `key` VARCHAR(255) NOT NULL,
    `id` INT NOT NULL,
    `allowed_ips` VARCHAR(255) NULL,
    `scopes` VARCHAR(255) NULL,
    `user_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `last_activity_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `api_keys` ADD UNIQUE `api_keys_key_unique`(`key`);
ALTER TABLE
    `api_keys` ADD INDEX `api_keys_user_id_index`(`user_id`);
CREATE TABLE `discussion_tag`(
    `tag_id` INT NOT NULL,
    `discussion_id` INT NOT NULL,
    PRIMARY KEY(`discussion_id`, `tag_id`)
);
ALTER TABLE
    `discussion_tag` ADD INDEX `discussion_tag_tag_id_index`(`tag_id`);
CREATE TABLE `discussion_user`(
    `user_id` INT NOT NULL,
    `discussion_id` INT NOT NULL,
    `last_read_at` DATETIME NULL,
    `last_read_post_number` INT NULL,
    `subscription` ENUM('') NULL,
    PRIMARY KEY(`user_id`, `discussion_id`)
);
ALTER TABLE
    `discussion_user` ADD INDEX `discussion_user_discussion_id_index`(`discussion_id`);
CREATE TABLE `discussions`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `comment_count` INT NOT NULL,
    `participant_count` INT NOT NULL,
    `post_number_index` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `user_id` INT NULL,
    `first_post_id` INT NULL,
    `last_posted_at` DATETIME NULL,
    `last_posted_user_id` INT NULL,
    `last_post_id` INT NULL,
    `last_post_number` INT NULL,
    `hidden_at` DATETIME NULL,
    `hidden_user_id` INT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `is_private` TINYINT NOT NULL,
    `is_approved` TINYINT NOT NULL,
    `is_locked` TINYINT NOT NULL,
    `is_sticky` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `discussions` ADD INDEX `discussions_created_at_is_sticky_index`(`created_at`, `is_sticky`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_comment_count_index`(`comment_count`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_participant_count_index`(`participant_count`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_created_at_index`(`created_at`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_user_id_index`(`user_id`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_first_post_id_index`(`first_post_id`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_last_posted_at_index`(`last_posted_at`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_last_posted_user_id_index`(`last_posted_user_id`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_last_post_id_index`(`last_post_id`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_hidden_at_index`(`hidden_at`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_hidden_user_id_index`(`hidden_user_id`);
ALTER TABLE
    `discussions` ADD INDEX `discussions_is_locked_index`(`is_locked`);
CREATE TABLE `email_tokens`(
    `token` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` DATETIME NULL,
    PRIMARY KEY(`token`)
);
ALTER TABLE
    `email_tokens` ADD INDEX `email_tokens_user_id_index`(`user_id`);
CREATE TABLE `flags`(
    `id` INT NOT NULL,
    `post_id` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `user_id` INT NULL,
    `reason` VARCHAR(255) NULL,
    `reason_detail` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `flags` ADD INDEX `flags_post_id_index`(`post_id`);
ALTER TABLE
    `flags` ADD INDEX `flags_user_id_index`(`user_id`);
ALTER TABLE
    `flags` ADD INDEX `flags_created_at_index`(`created_at`);
CREATE TABLE `group_permission`(
    `group_id` INT NOT NULL,
    `permission` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`group_id`, `permission`)
);
CREATE TABLE `group_user`(
    `user_id` INT NOT NULL,
    `group_id` INT NOT NULL,
    PRIMARY KEY(`user_id`, `group_id`)
);
ALTER TABLE
    `group_user` ADD INDEX `group_user_group_id_index`(`group_id`);
CREATE TABLE `groups`(
    `id` INT NOT NULL,
    `name_singular` VARCHAR(255) NOT NULL,
    `name_plural` VARCHAR(255) NOT NULL,
    `color` VARCHAR(255) NULL,
    `icon` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `login_providers`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `provider` VARCHAR(255) NOT NULL,
    `identifier` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NULL,
    `last_login_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `login_providers` ADD UNIQUE `login_providers_provider_identifier_unique`(`provider`, `identifier`);
ALTER TABLE
    `login_providers` ADD INDEX `login_providers_user_id_index`(`user_id`);
CREATE TABLE `migrations`(
    `migration` VARCHAR(255) NOT NULL,
    `extension` VARCHAR(255) NULL
);
CREATE TABLE `notifications`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `from_user_id` INT NULL,
    `type` VARCHAR(255) NOT NULL,
    `subject_id` INT NULL,
    `data` BLOB NULL,
    `created_at` DATETIME NOT NULL,
    `is_deleted` TINYINT NOT NULL,
    `read_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notifications` ADD INDEX `notifications_user_id_index`(`user_id`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_from_user_id_index`(`from_user_id`);
CREATE TABLE `password_tokens`(
    `token` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` DATETIME NULL,
    PRIMARY KEY(`token`)
);
ALTER TABLE
    `password_tokens` ADD INDEX `password_tokens_user_id_index`(`user_id`);
CREATE TABLE `post_likes`(
    `post_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`post_id`, `user_id`)
);
ALTER TABLE
    `post_likes` ADD INDEX `post_likes_user_id_index`(`user_id`);
CREATE TABLE `post_mentions_post`(
    `post_id` INT NOT NULL,
    `mentions_post_id` INT NOT NULL,
    PRIMARY KEY(`post_id`, `mentions_post_id`)
);
ALTER TABLE
    `post_mentions_post` ADD INDEX `post_mentions_post_mentions_post_id_index`(`mentions_post_id`);
CREATE TABLE `post_mentions_user`(
    `post_id` INT NOT NULL,
    `mentions_user_id` INT NOT NULL,
    PRIMARY KEY(`post_id`, `mentions_user_id`)
);
ALTER TABLE
    `post_mentions_user` ADD INDEX `post_mentions_user_mentions_user_id_index`(`mentions_user_id`);
CREATE TABLE `post_user`(
    `post_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`post_id`, `user_id`)
);
ALTER TABLE
    `post_user` ADD INDEX `post_user_user_id_index`(`user_id`);
CREATE TABLE `posts`(
    `id` INT NOT NULL,
    `discussion_id` INT NOT NULL,
    `number` INT NULL,
    `created_at` DATETIME NOT NULL,
    `user_id` INT NULL,
    `type` VARCHAR(255) NULL,
    `content` MEDIUMTEXT NULL,
    `edited_at` DATETIME NULL,
    `edited_user_id` INT NULL,
    `hidden_at` DATETIME NULL,
    `hidden_user_id` INT NULL,
    `ip_address` VARCHAR(255) NULL,
    `is_private` TINYINT NOT NULL,
    `is_approved` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `posts` ADD UNIQUE `posts_discussion_id_number_unique`(`discussion_id`, `number`);
ALTER TABLE
    `posts` ADD INDEX `posts_discussion_id_number_index`(`discussion_id`, `number`);
ALTER TABLE
    `posts` ADD INDEX `posts_discussion_id_created_at_index`(`discussion_id`, `created_at`);
ALTER TABLE
    `posts` ADD INDEX `posts_created_at_user_id_index`(`created_at`, `user_id`);
ALTER TABLE
    `posts` ADD INDEX `posts_edited_user_id_index`(`edited_user_id`);
ALTER TABLE
    `posts` ADD INDEX `posts_hidden_user_id_index`(`hidden_user_id`);
CREATE TABLE `registration_tokens`(
    `token` VARCHAR(255) NOT NULL,
    `payload` TEXT NULL,
    `created_at` DATETIME NULL,
    `provider` VARCHAR(255) NOT NULL,
    `identifier` VARCHAR(255) NOT NULL,
    `user_attributes` TEXT NULL,
    PRIMARY KEY(`token`)
);
CREATE TABLE `settings`(
    `key` VARCHAR(255) NOT NULL,
    `value` TEXT NULL,
    PRIMARY KEY(`key`)
);
CREATE TABLE `tag_user`(
    `tag_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `marked_as_read_at` DATETIME NULL,
    `is_hidden` TINYINT NOT NULL,
    PRIMARY KEY(`user_id`, `tag_id`)
);
ALTER TABLE
    `tag_user` ADD INDEX `tag_user_tag_id_index`(`tag_id`);
CREATE TABLE `tags`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `color` VARCHAR(255) NULL,
    `background_path` VARCHAR(255) NULL,
    `background_mode` VARCHAR(255) NULL,
    `position` INT NULL,
    `parent_id` INT NULL,
    `default_sort` VARCHAR(255) NULL,
    `is_restricted` TINYINT NOT NULL,
    `is_hidden` TINYINT NOT NULL,
    `discussion_count` INT NOT NULL,
    `last_posted_at` DATETIME NULL,
    `last_posted_discussion_id` INT NULL,
    `last_posted_user_id` INT NULL,
    `icon` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tags` ADD UNIQUE `tags_slug_unique`(`slug`);
ALTER TABLE
    `tags` ADD INDEX `tags_parent_id_index`(`parent_id`);
ALTER TABLE
    `tags` ADD INDEX `tags_last_posted_discussion_id_index`(`last_posted_discussion_id`);
ALTER TABLE
    `tags` ADD INDEX `tags_last_posted_user_id_index`(`last_posted_user_id`);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `is_email_confirmed` TINYINT NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `bio` TEXT NULL,
    `avatar_url` VARCHAR(255) NULL,
    `preferences` BLOB NULL,
    `joined_at` DATETIME NULL,
    `last_seen_at` DATETIME NULL,
    `marked_all_as_read_at` DATETIME NULL,
    `read_notifications_at` DATETIME NULL,
    `discussion_count` INT NOT NULL,
    `comment_count` INT NOT NULL,
    `read_flags_at` DATETIME NULL,
    `suspended_until` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_username_unique`(`username`);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD INDEX `users_joined_at_index`(`joined_at`);
ALTER TABLE
    `users` ADD INDEX `users_last_seen_at_index`(`last_seen_at`);
ALTER TABLE
    `users` ADD INDEX `users_discussion_count_index`(`discussion_count`);
ALTER TABLE
    `users` ADD INDEX `users_comment_count_index`(`comment_count`);
ALTER TABLE
    `login_providers` ADD CONSTRAINT `login_providers_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `post_mentions_user` ADD CONSTRAINT `post_mentions_user_mentions_user_id_foreign` FOREIGN KEY(`mentions_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `posts` ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `api_keys` ADD CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `post_mentions_user` ADD CONSTRAINT `post_mentions_user_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `posts`(`id`);
ALTER TABLE
    `post_mentions_post` ADD CONSTRAINT `post_mentions_post_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `posts`(`id`);
ALTER TABLE
    `posts` ADD CONSTRAINT `posts_hidden_user_id_foreign` FOREIGN KEY(`hidden_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `tag_user` ADD CONSTRAINT `tag_user_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);
ALTER TABLE
    `discussion_user` ADD CONSTRAINT `discussion_user_discussion_id_foreign` FOREIGN KEY(`discussion_id`) REFERENCES `discussions`(`id`);
ALTER TABLE
    `post_user` ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `posts`(`id`);
ALTER TABLE
    `password_tokens` ADD CONSTRAINT `password_tokens_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `posts` ADD CONSTRAINT `posts_discussion_id_foreign` FOREIGN KEY(`discussion_id`) REFERENCES `discussions`(`id`);
ALTER TABLE
    `group_user` ADD CONSTRAINT `group_user_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `groups`(`id`);
ALTER TABLE
    `post_user` ADD CONSTRAINT `post_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `tags` ADD CONSTRAINT `tags_last_posted_discussion_id_foreign` FOREIGN KEY(`last_posted_discussion_id`) REFERENCES `discussions`(`id`);
ALTER TABLE
    `group_permission` ADD CONSTRAINT `group_permission_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `groups`(`id`);
ALTER TABLE
    `post_likes` ADD CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `posts`(`id`);
ALTER TABLE
    `discussions` ADD CONSTRAINT `discussions_first_post_id_foreign` FOREIGN KEY(`first_post_id`) REFERENCES `posts`(`id`);
ALTER TABLE
    `post_likes` ADD CONSTRAINT `post_likes_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `tag_user` ADD CONSTRAINT `tag_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `posts` ADD CONSTRAINT `posts_edited_user_id_foreign` FOREIGN KEY(`edited_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `tags` ADD CONSTRAINT `tags_parent_id_foreign` FOREIGN KEY(`parent_id`) REFERENCES `tags`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `flags` ADD CONSTRAINT `flags_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `tags` ADD CONSTRAINT `tags_last_posted_user_id_foreign` FOREIGN KEY(`last_posted_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `discussions` ADD CONSTRAINT `discussions_last_post_id_foreign` FOREIGN KEY(`last_post_id`) REFERENCES `posts`(`id`);
ALTER TABLE
    `discussion_user` ADD CONSTRAINT `discussion_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `discussions` ADD CONSTRAINT `discussions_last_posted_user_id_foreign` FOREIGN KEY(`last_posted_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `access_tokens` ADD CONSTRAINT `access_tokens_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `discussions` ADD CONSTRAINT `discussions_hidden_user_id_foreign` FOREIGN KEY(`hidden_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `email_tokens` ADD CONSTRAINT `email_tokens_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `discussion_tag` ADD CONSTRAINT `discussion_tag_discussion_id_foreign` FOREIGN KEY(`discussion_id`) REFERENCES `discussions`(`id`);
ALTER TABLE
    `discussions` ADD CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `post_mentions_post` ADD CONSTRAINT `post_mentions_post_mentions_post_id_foreign` FOREIGN KEY(`mentions_post_id`) REFERENCES `posts`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_from_user_id_foreign` FOREIGN KEY(`from_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `discussion_tag` ADD CONSTRAINT `discussion_tag_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);
ALTER TABLE
    `group_user` ADD CONSTRAINT `group_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `flags` ADD CONSTRAINT `flags_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `posts`(`id`);