CREATE TABLE `ar_internal_metadata`(
    `key` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`key`)
);
CREATE TABLE `comments`(
    `id` BIGINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NULL,
    `short_id` VARCHAR(255) NOT NULL,
    `story_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `parent_comment_id` BIGINT NULL,
    `thread_id` BIGINT NULL,
    `comment` MEDIUMTEXT NOT NULL,
    `upvotes` INT NOT NULL,
    `downvotes` INT NOT NULL,
    `confidence` DECIMAL(8, 2) NOT NULL,
    `markeddown_comment` MEDIUMTEXT NULL,
    `is_deleted` TINYINT NULL,
    `is_moderated` TINYINT NULL,
    `is_from_email` TINYINT NULL,
    `hat_id` BIGINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `comments` ADD INDEX `comments_short_id_story_id_index`(`short_id`, `story_id`);
ALTER TABLE
    `comments` ADD INDEX `comments_created_at_story_id_user_id_downvotes_index`(
        `created_at`,
        `story_id`,
        `user_id`,
        `downvotes`
    );
ALTER TABLE
    `comments` ADD UNIQUE `comments_short_id_unique`(`short_id`);
ALTER TABLE
    `comments` ADD INDEX `comments_user_id_index`(`user_id`);
ALTER TABLE
    `comments` ADD INDEX `comments_parent_comment_id_index`(`parent_comment_id`);
ALTER TABLE
    `comments` ADD INDEX `comments_thread_id_index`(`thread_id`);
ALTER TABLE
    `comments` ADD INDEX `comments_confidence_index`(`confidence`);
ALTER TABLE
    `comments` ADD INDEX `comments_hat_id_index`(`hat_id`);
CREATE TABLE `domains`(
    `id` BIGINT NOT NULL,
    `domain` VARCHAR(255) NULL,
    `is_tracker` TINYINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `banned_at` DATETIME NULL,
    `banned_by_user_id` INT NULL,
    `banned_reason` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `hat_requests`(
    `id` BIGINT NOT NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    `user_id` BIGINT NOT NULL,
    `hat` VARCHAR(255) NOT NULL,
    `link` VARCHAR(255) NOT NULL,
    `comment` TEXT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `hat_requests` ADD INDEX `hat_requests_user_id_index`(`user_id`);
CREATE TABLE `hats`(
    `id` BIGINT NOT NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    `user_id` BIGINT NOT NULL,
    `granted_by_user_id` BIGINT NOT NULL,
    `hat` VARCHAR(255) NOT NULL,
    `link` VARCHAR(255) NULL,
    `modlog_use` TINYINT NULL,
    `doffed_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `hats` ADD INDEX `hats_user_id_index`(`user_id`);
ALTER TABLE
    `hats` ADD INDEX `hats_granted_by_user_id_index`(`granted_by_user_id`);
CREATE TABLE `hidden_stories`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `story_id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `hidden_stories` ADD UNIQUE `hidden_stories_user_id_story_id_unique`(`user_id`, `story_id`);
ALTER TABLE
    `hidden_stories` ADD INDEX `hidden_stories_story_id_index`(`story_id`);
CREATE TABLE `invitation_requests`(
    `id` BIGINT NOT NULL,
    `code` VARCHAR(255) NULL,
    `is_verified` TINYINT NULL,
    `email` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `memo` TEXT NULL,
    `ip_address` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `invitations`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `email` VARCHAR(255) NULL,
    `code` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `memo` MEDIUMTEXT NULL,
    `used_at` DATETIME NULL,
    `new_user_id` BIGINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `invitations` ADD INDEX `invitations_user_id_index`(`user_id`);
ALTER TABLE
    `invitations` ADD INDEX `invitations_new_user_id_index`(`new_user_id`);
CREATE TABLE `keystores`(
    `key` VARCHAR(255) NOT NULL,
    `value` BIGINT NULL
);
ALTER TABLE
    `keystores` ADD UNIQUE `keystores_key_unique`(`key`);
CREATE TABLE `messages`(
    `id` BIGINT NOT NULL,
    `created_at` DATETIME NULL,
    `author_user_id` BIGINT NOT NULL,
    `recipient_user_id` BIGINT NOT NULL,
    `has_been_read` TINYINT NULL,
    `subject` VARCHAR(255) NULL,
    `body` MEDIUMTEXT NULL,
    `short_id` VARCHAR(255) NULL,
    `deleted_by_author` TINYINT NULL,
    `deleted_by_recipient` TINYINT NULL,
    `hat_id` BIGINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `messages` ADD INDEX `messages_author_user_id_index`(`author_user_id`);
ALTER TABLE
    `messages` ADD INDEX `messages_recipient_user_id_index`(`recipient_user_id`);
ALTER TABLE
    `messages` ADD UNIQUE `messages_short_id_unique`(`short_id`);
ALTER TABLE
    `messages` ADD INDEX `messages_hat_id_index`(`hat_id`);
CREATE TABLE `mod_notes`(
    `id` BIGINT NOT NULL,
    `moderator_user_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `note` TEXT NOT NULL,
    `markeddown_note` TEXT NOT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `mod_notes` ADD INDEX `mod_notes_id_user_id_index`(`id`, `user_id`);
ALTER TABLE
    `mod_notes` ADD INDEX `mod_notes_moderator_user_id_index`(`moderator_user_id`);
ALTER TABLE
    `mod_notes` ADD INDEX `mod_notes_user_id_index`(`user_id`);
CREATE TABLE `moderations`(
    `id` BIGINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `moderator_user_id` BIGINT NULL,
    `story_id` BIGINT NULL,
    `comment_id` BIGINT NULL,
    `user_id` BIGINT NULL,
    `action` MEDIUMTEXT NULL,
    `reason` MEDIUMTEXT NULL,
    `is_from_suggestions` TINYINT NULL,
    `tag_id` BIGINT NULL,
    `domain_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `moderations` ADD INDEX `moderations_created_at_index`(`created_at`);
ALTER TABLE
    `moderations` ADD INDEX `moderations_moderator_user_id_index`(`moderator_user_id`);
ALTER TABLE
    `moderations` ADD INDEX `moderations_story_id_index`(`story_id`);
ALTER TABLE
    `moderations` ADD INDEX `moderations_comment_id_index`(`comment_id`);
ALTER TABLE
    `moderations` ADD INDEX `moderations_user_id_index`(`user_id`);
ALTER TABLE
    `moderations` ADD INDEX `moderations_tag_id_index`(`tag_id`);
ALTER TABLE
    `moderations` ADD INDEX `moderations_domain_id_index`(`domain_id`);
CREATE TABLE `read_ribbons`(
    `id` BIGINT NOT NULL,
    `is_following` TINYINT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `user_id` BIGINT NOT NULL,
    `story_id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `read_ribbons` ADD INDEX `read_ribbons_user_id_index`(`user_id`);
ALTER TABLE
    `read_ribbons` ADD INDEX `read_ribbons_story_id_index`(`story_id`);
CREATE TABLE `saved_stories`(
    `id` BIGINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `user_id` BIGINT NOT NULL,
    `story_id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `saved_stories` ADD UNIQUE `saved_stories_user_id_story_id_unique`(`user_id`, `story_id`);
ALTER TABLE
    `saved_stories` ADD INDEX `saved_stories_story_id_index`(`story_id`);
CREATE TABLE `schema_migrations`(
    `version` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`version`)
);
CREATE TABLE `stories`(
    `id` BIGINT NOT NULL,
    `created_at` DATETIME NULL,
    `user_id` BIGINT NOT NULL,
    `url` VARCHAR(255) NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` MEDIUMTEXT NULL,
    `short_id` VARCHAR(255) NOT NULL,
    `is_expired` TINYINT NOT NULL,
    `upvotes` INT NOT NULL,
    `downvotes` INT NOT NULL,
    `is_moderated` TINYINT NOT NULL,
    `hotness` DECIMAL(8, 2) NOT NULL,
    `markeddown_description` MEDIUMTEXT NULL,
    `story_cache` MEDIUMTEXT NULL,
    `comments_count` INT NOT NULL,
    `merged_story_id` BIGINT NULL,
    `unavailable_at` DATETIME NULL,
    `twitter_id` VARCHAR(255) NULL,
    `user_is_author` TINYINT NULL,
    `user_is_following` TINYINT NOT NULL,
    `domain_id` BIGINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `stories` ADD INDEX `stories_is_expired_is_moderated_index`(`is_expired`, `is_moderated`);
ALTER TABLE
    `stories` ADD INDEX `stories_created_at_index`(`created_at`);
ALTER TABLE
    `stories` ADD INDEX `stories_user_id_index`(`user_id`);
ALTER TABLE
    `stories` ADD INDEX `stories_url_index`(`url`);
ALTER TABLE
    `stories` ADD UNIQUE `stories_short_id_unique`(`short_id`);
ALTER TABLE
    `stories` ADD INDEX `stories_is_expired_index`(`is_expired`);
ALTER TABLE
    `stories` ADD INDEX `stories_is_moderated_index`(`is_moderated`);
ALTER TABLE
    `stories` ADD INDEX `stories_hotness_index`(`hotness`);
ALTER TABLE
    `stories` ADD INDEX `stories_merged_story_id_index`(`merged_story_id`);
ALTER TABLE
    `stories` ADD INDEX `stories_twitter_id_index`(`twitter_id`);
ALTER TABLE
    `stories` ADD INDEX `stories_domain_id_index`(`domain_id`);
CREATE TABLE `suggested_taggings`(
    `id` BIGINT NOT NULL,
    `story_id` BIGINT NOT NULL,
    `tag_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `suggested_taggings` ADD INDEX `suggested_taggings_story_id_index`(`story_id`);
ALTER TABLE
    `suggested_taggings` ADD INDEX `suggested_taggings_tag_id_index`(`tag_id`);
ALTER TABLE
    `suggested_taggings` ADD INDEX `suggested_taggings_user_id_index`(`user_id`);
CREATE TABLE `suggested_titles`(
    `id` BIGINT NOT NULL,
    `story_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `suggested_titles` ADD INDEX `suggested_titles_story_id_index`(`story_id`);
ALTER TABLE
    `suggested_titles` ADD INDEX `suggested_titles_user_id_index`(`user_id`);
CREATE TABLE `tag_filters`(
    `id` BIGINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `user_id` BIGINT NOT NULL,
    `tag_id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tag_filters` ADD INDEX `tag_filters_user_id_tag_id_index`(`user_id`, `tag_id`);
ALTER TABLE
    `tag_filters` ADD INDEX `tag_filters_tag_id_index`(`tag_id`);
CREATE TABLE `taggings`(
    `id` BIGINT NOT NULL,
    `story_id` BIGINT NOT NULL,
    `tag_id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `taggings` ADD UNIQUE `taggings_story_id_tag_id_unique`(`story_id`, `tag_id`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_tag_id_index`(`tag_id`);
CREATE TABLE `tags`(
    `id` BIGINT NOT NULL,
    `tag` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL,
    `privileged` TINYINT NULL,
    `is_media` TINYINT NULL,
    `inactive` TINYINT NULL,
    `hotness_mod` FLOAT(53) NULL,
    `permit_by_new_users` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tags` ADD UNIQUE `tags_tag_unique`(`tag`);
CREATE TABLE `users`(
    `id` BIGINT NOT NULL,
    `username` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `password_digest` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `is_admin` TINYINT NULL,
    `password_reset_token` VARCHAR(255) NULL,
    `session_token` VARCHAR(255) NOT NULL,
    `about` MEDIUMTEXT NULL,
    `invited_by_user_id` BIGINT NULL,
    `is_moderator` TINYINT NULL,
    `pushover_mentions` TINYINT NULL,
    `rss_token` VARCHAR(255) NULL,
    `mailing_list_token` VARCHAR(255) NULL,
    `mailing_list_mode` INT NULL,
    `karma` INT NOT NULL,
    `banned_at` DATETIME NULL,
    `banned_by_user_id` BIGINT NULL,
    `banned_reason` VARCHAR(255) NULL,
    `deleted_at` DATETIME NULL,
    `disabled_invite_at` DATETIME NULL,
    `disabled_invite_by_user_id` BIGINT NULL,
    `disabled_invite_reason` VARCHAR(255) NULL,
    `settings` TEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_username_unique`(`username`);
ALTER TABLE
    `users` ADD UNIQUE `users_password_reset_token_unique`(`password_reset_token`);
ALTER TABLE
    `users` ADD UNIQUE `users_session_token_unique`(`session_token`);
ALTER TABLE
    `users` ADD INDEX `users_invited_by_user_id_index`(`invited_by_user_id`);
ALTER TABLE
    `users` ADD UNIQUE `users_rss_token_unique`(`rss_token`);
ALTER TABLE
    `users` ADD UNIQUE `users_mailing_list_token_unique`(`mailing_list_token`);
ALTER TABLE
    `users` ADD INDEX `users_mailing_list_mode_index`(`mailing_list_mode`);
ALTER TABLE
    `users` ADD INDEX `users_banned_by_user_id_index`(`banned_by_user_id`);
ALTER TABLE
    `users` ADD INDEX `users_disabled_invite_by_user_id_index`(`disabled_invite_by_user_id`);
CREATE TABLE `votes`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `story_id` BIGINT NOT NULL,
    `comment_id` BIGINT NULL,
    `vote` TINYINT NOT NULL,
    `reason` VARCHAR(255) NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `votes` ADD INDEX `votes_user_id_comment_id_index`(`user_id`, `comment_id`);
ALTER TABLE
    `votes` ADD INDEX `votes_user_id_story_id_index`(`user_id`, `story_id`);
ALTER TABLE
    `votes` ADD INDEX `votes_story_id_index`(`story_id`);
ALTER TABLE
    `votes` ADD INDEX `votes_comment_id_index`(`comment_id`);
CREATE TABLE `replying_comments`(
    `user_id` BIGINT NULL,
    `comment_id` BIGINT NULL,
    `story_id` BIGINT NULL,
    `parent_comment_id` BIGINT NULL,
    `comment_created_at` DATETIME NULL,
    `parent_comment_author_id` BIGINT NULL,
    `comment_author_id` BIGINT NULL,
    `story_author_id` BIGINT NULL,
    `is_unread` INT NULL,
    `current_vote_vote` INT NULL,
    `current_vote_reason` VARCHAR(255) NULL
);
ALTER TABLE
    `replying_comments` ADD CONSTRAINT `replying_comments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `replying_comments`(`parent_comment_id`);
ALTER TABLE
    `replying_comments` ADD CONSTRAINT `replying_comments_comment_id_foreign` FOREIGN KEY(`comment_id`) REFERENCES `comments`(`id`);
ALTER TABLE
    `replying_comments` ADD CONSTRAINT `replying_comments_story_id_foreign` FOREIGN KEY(`story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `stories` ADD CONSTRAINT `stories_domain_id_foreign` FOREIGN KEY(`domain_id`) REFERENCES `domains`(`id`);
ALTER TABLE
    `stories` ADD CONSTRAINT `stories_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `read_ribbons` ADD CONSTRAINT `read_ribbons_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `suggested_taggings` ADD CONSTRAINT `suggested_taggings_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);
ALTER TABLE
    `invitations` ADD CONSTRAINT `invitations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `replying_comments` ADD CONSTRAINT `replying_comments_story_author_id_foreign` FOREIGN KEY(`story_author_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `read_ribbons` ADD CONSTRAINT `read_ribbons_story_id_foreign` FOREIGN KEY(`story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_invited_by_user_id_foreign` FOREIGN KEY(`invited_by_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_hat_id_foreign` FOREIGN KEY(`hat_id`) REFERENCES `hats`(`id`);
ALTER TABLE
    `tag_filters` ADD CONSTRAINT `tag_filters_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `suggested_titles` ADD CONSTRAINT `suggested_titles_story_id_foreign` FOREIGN KEY(`story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `hidden_stories` ADD CONSTRAINT `hidden_stories_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `suggested_titles` ADD CONSTRAINT `suggested_titles_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `saved_stories` ADD CONSTRAINT `saved_stories_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_hat_id_foreign` FOREIGN KEY(`hat_id`) REFERENCES `hats`(`id`);
ALTER TABLE
    `suggested_taggings` ADD CONSTRAINT `suggested_taggings_story_id_foreign` FOREIGN KEY(`story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `taggings` ADD CONSTRAINT `taggings_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_parent_comment_id_foreign` FOREIGN KEY(`parent_comment_id`) REFERENCES `comments`(`id`);
ALTER TABLE
    `replying_comments` ADD CONSTRAINT `replying_comments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `mod_notes` ADD CONSTRAINT `mod_notes_moderator_user_id_foreign` FOREIGN KEY(`moderator_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `suggested_taggings` ADD CONSTRAINT `suggested_taggings_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `saved_stories` ADD CONSTRAINT `saved_stories_story_id_foreign` FOREIGN KEY(`story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `replying_comments` ADD CONSTRAINT `replying_comments_comment_author_id_foreign` FOREIGN KEY(`comment_author_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `replying_comments` ADD CONSTRAINT `replying_comments_parent_comment_author_id_foreign` FOREIGN KEY(`parent_comment_author_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_author_user_id_foreign` FOREIGN KEY(`author_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `taggings` ADD CONSTRAINT `taggings_story_id_foreign` FOREIGN KEY(`story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `moderations` ADD CONSTRAINT `moderations_moderator_user_id_foreign` FOREIGN KEY(`moderator_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_disabled_invite_by_user_id_foreign` FOREIGN KEY(`disabled_invite_by_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_story_id_foreign` FOREIGN KEY(`story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_banned_by_user_id_foreign` FOREIGN KEY(`banned_by_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `tag_filters` ADD CONSTRAINT `tag_filters_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);
ALTER TABLE
    `moderations` ADD CONSTRAINT `moderations_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);
ALTER TABLE
    `hats` ADD CONSTRAINT `hats_granted_by_user_id_foreign` FOREIGN KEY(`granted_by_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_recipient_user_id_foreign` FOREIGN KEY(`recipient_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `moderations` ADD CONSTRAINT `moderations_comment_id_foreign` FOREIGN KEY(`comment_id`) REFERENCES `comments`(`id`);
ALTER TABLE
    `moderations` ADD CONSTRAINT `moderations_story_id_foreign` FOREIGN KEY(`story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `votes` ADD CONSTRAINT `votes_comment_id_foreign` FOREIGN KEY(`comment_id`) REFERENCES `comments`(`id`);
ALTER TABLE
    `stories` ADD CONSTRAINT `stories_merged_story_id_foreign` FOREIGN KEY(`merged_story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `hats` ADD CONSTRAINT `hats_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `mod_notes` ADD CONSTRAINT `mod_notes_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `votes` ADD CONSTRAINT `votes_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `hidden_stories` ADD CONSTRAINT `hidden_stories_story_id_foreign` FOREIGN KEY(`story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `votes` ADD CONSTRAINT `votes_story_id_foreign` FOREIGN KEY(`story_id`) REFERENCES `stories`(`id`);
ALTER TABLE
    `invitations` ADD CONSTRAINT `invitations_new_user_id_foreign` FOREIGN KEY(`new_user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `hat_requests` ADD CONSTRAINT `hat_requests_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);