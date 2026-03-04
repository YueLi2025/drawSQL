CREATE TABLE `users`(
    `id` INT NOT NULL,
    `login` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `email_md5` VARCHAR(255) NOT NULL,
    `email_public` BOOLEAN NOT NULL,
    `location` VARCHAR(255) NULL,
    `location_id` INT NULL,
    `bio` VARCHAR(255) NULL,
    `website` VARCHAR(255) NULL,
    `company` VARCHAR(255) NULL,
    `github` VARCHAR(255) NULL,
    `twitter` VARCHAR(255) NULL,
    `avatar` VARCHAR(255) NULL,
    `state` INT NOT NULL,
    `tagline` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `encrypted_password` VARCHAR(255) NOT NULL,
    `reset_password_token` VARCHAR(255) NULL,
    `reset_password_sent_at` TIMESTAMP NULL,
    `remember_created_at` TIMESTAMP NULL,
    `sign_in_count` INT NOT NULL,
    `current_sign_in_at` TIMESTAMP NULL,
    `last_sign_in_at` TIMESTAMP NULL,
    `current_sign_in_ip` VARCHAR(255) NULL,
    `last_sign_in_ip` VARCHAR(255) NULL,
    `password_salt` VARCHAR(255) NOT NULL,
    `persistence_token` VARCHAR(255) NOT NULL
);
CREATE TABLE `user_ssos`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `uid` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `name` VARCHAR(255) NULL,
    `avatar_url` VARCHAR(255) NULL,
    `last_payload` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);
CREATE TABLE `topics`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `node_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `body` TEXT NOT NULL,
    `last_reply_id` INT NULL,
    `last_reply_user_id` INT NULL,
    `last_reply_user_login` VARCHAR(255) NULL,
    `node_name` VARCHAR(255) NULL,
    `who_deleted` VARCHAR(255) NULL,
    `last_active_mark` INT NULL,
    `lock_node` BOOLEAN NOT NULL,
    `suggested_at` TIMESTAMP NULL,
    `grade` INT NULL,
    `replied_at` TIMESTAMP NULL,
    `replies_count` INT NOT NULL,
    `likes_count` INT NULL,
    `mentioned_user_ids` INT NULL,
    `deleted_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `closed_at` TIMESTAMP NULL,
    `team_id` INT NULL
);
CREATE TABLE `team_users`(
    `id` INT NOT NULL,
    `team_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `role` INT NULL,
    `status` INT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);
CREATE TABLE `settings`(
    `id` INT NOT NULL,
    `var` VARCHAR(255) NOT NULL,
    `value` TEXT NULL,
    `thing_id` INT NULL,
    `thing_type` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `sections`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `sort` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `replies`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `topic_id` INT NOT NULL,
    `body` TEXT NOT NULL,
    `state` INT NOT NULL,
    `likes_count` INT NULL,
    `mentioned_user_ids` INT NULL,
    `deleted_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `action` VARCHAR(255) NULL,
    `target_type` VARCHAR(255) NULL,
    `target_id` VARCHAR(255) NULL,
    `reply_to_id` INT NULL
);
CREATE TABLE `photos`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `image` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `pages`(
    `id` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `body` TEXT NOT NULL,
    `locked` BOOLEAN NOT NULL,
    `version` INT NOT NULL,
    `editor_ids` INT NOT NULL,
    `word_count` INT NOT NULL,
    `changes_count` INT NOT NULL,
    `comments_count` INT NOT NULL,
    `deleted_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `page_versions`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `page_id` INT NOT NULL,
    `version` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `desc` TEXT NOT NULL,
    `body` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `oauth_applications`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `uid` VARCHAR(255) NOT NULL,
    `secret` VARCHAR(255) NOT NULL,
    `redirect_uri` TEXT NOT NULL,
    `scopes` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `owner_id` INT NULL,
    `owner_type` VARCHAR(255) NULL,
    `level` INT NOT NULL,
    `confidential` BOOLEAN NOT NULL
);
CREATE TABLE `oauth_access_tokens`(
    `id` INT NOT NULL,
    `resource_owner_id` INT NULL,
    `application_id` INT NULL,
    `token` VARCHAR(255) NOT NULL,
    `refresh_token` VARCHAR(255) NULL,
    `expires_in` BIGINT NULL,
    `revoked_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NOT NULL,
    `scopes` VARCHAR(255) NULL
);
CREATE TABLE `oauth_access_grants`(
    `id` INT NOT NULL,
    `resource_owner_id` INT NOT NULL,
    `application_id` INT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `expires_in` BIGINT NULL,
    `redirect_uri` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `revoked_at` TIMESTAMP NULL,
    `scopes` VARCHAR(255) NULL
);
CREATE TABLE `notifications`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `actor_id` INT NULL,
    `notify_type` VARCHAR(255) NOT NULL,
    `target_type` VARCHAR(255) NULL,
    `target_id` INT NULL,
    `second_target_type` VARCHAR(255) NULL,
    `second_target_id` INT NULL,
    `third_target_type` VARCHAR(255) NULL,
    `third_target_id` INT NULL,
    `read_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);
CREATE TABLE `notes`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `body` TEXT NOT NULL,
    `user_id` INT NOT NULL,
    `word_count` INT NOT NULL,
    `changes_count` INT NOT NULL,
    `publish` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `nodes`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `summary` VARCHAR(255) NULL,
    `section_id` INT NOT NULL,
    `sort` INT NOT NULL,
    `topics_count` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `locations`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `users_count` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `exception_tracks`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NULL,
    `body` TEXT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);
CREATE TABLE `devices`(
    `id` INT NOT NULL,
    `platform` INT NOT NULL,
    `user_id` INT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `last_actived_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `comments`(
    `id` INT NOT NULL,
    `body` TEXT NOT NULL,
    `user_id` INT NOT NULL,
    `commentable_type` VARCHAR(255) NULL,
    `commentable_id` INT NULL,
    `deleted_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `authorizations`(
    `id` INT NOT NULL,
    `provider` VARCHAR(255) NOT NULL,
    `uid` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
CREATE TABLE `actions`(
    `id` INT NOT NULL,
    `action_type` VARCHAR(255) NOT NULL,
    `action_option` VARCHAR(255) NULL,
    `target_type` VARCHAR(255) NULL,
    `target_id` INT NULL,
    `user_type` VARCHAR(255) NULL,
    `user_id` INT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `oauth_access_tokens` ADD CONSTRAINT `oauth_access_tokens_application_id_foreign` FOREIGN KEY(`application_id`) REFERENCES `oauth_applications`(`id`);
ALTER TABLE
    `locations` ADD CONSTRAINT `locations_id_foreign` FOREIGN KEY(`id`) REFERENCES `users`(`location_id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `topics`(`user_id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `notes`(`user_id`);
ALTER TABLE
    `topics` ADD CONSTRAINT `topics_last_reply_user_id_foreign` FOREIGN KEY(`last_reply_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `oauth_applications` ADD CONSTRAINT `oauth_applications_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `devices`(`user_id`);
ALTER TABLE
    `topics` ADD CONSTRAINT `topics_node_id_foreign` FOREIGN KEY(`node_id`) REFERENCES `nodes`(`id`);
ALTER TABLE
    `sections` ADD CONSTRAINT `sections_id_foreign` FOREIGN KEY(`id`) REFERENCES `nodes`(`section_id`);
ALTER TABLE
    `oauth_access_grants` ADD CONSTRAINT `oauth_access_grants_application_id_foreign` FOREIGN KEY(`application_id`) REFERENCES `oauth_applications`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `user_ssos`(`user_id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `notifications`(`user_id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `authorizations`(`user_id`);
ALTER TABLE
    `replies` ADD CONSTRAINT `replies_reply_to_id_foreign` FOREIGN KEY(`reply_to_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `replies`(`user_id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `team_users`(`user_id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `actions`(`user_id`);
ALTER TABLE
    `oauth_access_grants` ADD CONSTRAINT `oauth_access_grants_resource_owner_id_foreign` FOREIGN KEY(`resource_owner_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `page_versions`(`user_id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `comments`(`user_id`);
ALTER TABLE
    `oauth_access_tokens` ADD CONSTRAINT `oauth_access_tokens_resource_owner_id_foreign` FOREIGN KEY(`resource_owner_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `page_versions` ADD CONSTRAINT `page_versions_page_id_foreign` FOREIGN KEY(`page_id`) REFERENCES `pages`(`id`);
ALTER TABLE
    `topics` ADD CONSTRAINT `topics_id_foreign` FOREIGN KEY(`id`) REFERENCES `replies`(`topic_id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_id_foreign` FOREIGN KEY(`id`) REFERENCES `photos`(`user_id`);