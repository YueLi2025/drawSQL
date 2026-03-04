CREATE TABLE `account_deletions`(
    `id` INT NOT NULL,
    `person_id` INT NULL,
    `completed_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `account_deletions` ADD UNIQUE `account_deletions_person_id_unique`(`person_id`);
CREATE TABLE `account_migrations`(
    `id` BIGINT NOT NULL,
    `old_person_id` INT NOT NULL,
    `new_person_id` INT NOT NULL,
    `completed_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `account_migrations` ADD UNIQUE `account_migrations_old_person_id_new_person_id_unique`(`old_person_id`, `new_person_id`);
ALTER TABLE
    `account_migrations` ADD UNIQUE `account_migrations_old_person_id_unique`(`old_person_id`);
ALTER TABLE
    `account_migrations` ADD INDEX `account_migrations_new_person_id_index`(`new_person_id`);
CREATE TABLE `aspect_memberships`(
    `id` INT NOT NULL,
    `aspect_id` INT NOT NULL,
    `contact_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `aspect_memberships` ADD UNIQUE `aspect_memberships_aspect_id_contact_id_unique`(`aspect_id`, `contact_id`);
ALTER TABLE
    `aspect_memberships` ADD INDEX `aspect_memberships_aspect_id_index`(`aspect_id`);
ALTER TABLE
    `aspect_memberships` ADD INDEX `aspect_memberships_contact_id_index`(`contact_id`);
CREATE TABLE `aspect_visibilities`(
    `id` INT NOT NULL,
    `shareable_id` INT NOT NULL,
    `aspect_id` INT NOT NULL,
    `shareable_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `aspect_visibilities` ADD UNIQUE `shareable_id_aspect_id_shareable_type_unique`(
        `shareable_id`,
        `aspect_id`,
        `shareable_type`
    );
ALTER TABLE
    `aspect_visibilities` ADD INDEX `aspect_visibilities_shareable_id_shareable_type_index`(`shareable_id`, `shareable_type`);
ALTER TABLE
    `aspect_visibilities` ADD INDEX `aspect_visibilities_aspect_id_index`(`aspect_id`);
CREATE TABLE `aspects`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `order_id` INT NULL,
    `post_default` TINYINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `aspects` ADD UNIQUE `aspects_name_user_id_unique`(`name`, `user_id`);
ALTER TABLE
    `aspects` ADD INDEX `aspects_user_id_index`(`user_id`);
CREATE TABLE `authorizations`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `o_auth_application_id` INT NULL,
    `refresh_token` VARCHAR(255) NULL,
    `code` VARCHAR(255) NULL,
    `redirect_uri` VARCHAR(255) NULL,
    `nonce` VARCHAR(255) NULL,
    `scopes` TEXT NULL,
    `code_used` TINYINT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `authorizations` ADD INDEX `authorizations_user_id_index`(`user_id`);
ALTER TABLE
    `authorizations` ADD INDEX `authorizations_o_auth_application_id_index`(`o_auth_application_id`);
CREATE TABLE `blocks`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `person_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `blocks` ADD UNIQUE `blocks_user_id_person_id_unique`(`user_id`, `person_id`);
CREATE TABLE `comment_signatures`(
    `comment_id` INT NOT NULL,
    `author_signature` TEXT NOT NULL,
    `signature_order_id` INT NOT NULL,
    `additional_data` TEXT NULL
);
ALTER TABLE
    `comment_signatures` ADD UNIQUE `comment_signatures_comment_id_unique`(`comment_id`);
ALTER TABLE
    `comment_signatures` ADD INDEX `comment_signatures_signature_order_id_index`(`signature_order_id`);
CREATE TABLE `comments`(
    `id` INT NOT NULL,
    `text` TEXT NOT NULL,
    `commentable_id` INT NOT NULL,
    `author_id` INT NOT NULL,
    `guid` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `likes_count` INT NOT NULL,
    `commentable_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `comments` ADD INDEX `comments_commentable_id_commentable_type_index`(
        `commentable_id`,
        `commentable_type`
    );
ALTER TABLE
    `comments` ADD INDEX `comments_author_id_index`(`author_id`);
ALTER TABLE
    `comments` ADD UNIQUE `comments_guid_unique`(`guid`);
CREATE TABLE `contacts`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `person_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `sharing` TINYINT NOT NULL,
    `receiving` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `contacts` ADD UNIQUE `contacts_user_id_person_id_unique`(`user_id`, `person_id`);
ALTER TABLE
    `contacts` ADD INDEX `contacts_person_id_index`(`person_id`);
CREATE TABLE `conversation_visibilities`(
    `id` INT NOT NULL,
    `conversation_id` INT NOT NULL,
    `person_id` INT NOT NULL,
    `unread` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `conversation_visibilities` ADD UNIQUE `conversation_visibilities_conversation_id_person_id_unique`(`conversation_id`, `person_id`);
ALTER TABLE
    `conversation_visibilities` ADD INDEX `conversation_visibilities_conversation_id_index`(`conversation_id`);
ALTER TABLE
    `conversation_visibilities` ADD INDEX `conversation_visibilities_person_id_index`(`person_id`);
CREATE TABLE `conversations`(
    `id` INT NOT NULL,
    `subject` VARCHAR(255) NULL,
    `guid` VARCHAR(255) NOT NULL,
    `author_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `conversations` ADD UNIQUE `conversations_guid_unique`(`guid`);
ALTER TABLE
    `conversations` ADD INDEX `conversations_author_id_index`(`author_id`);
CREATE TABLE `invitation_codes`(
    `id` INT NOT NULL,
    `token` VARCHAR(255) NULL,
    `user_id` INT NULL,
    `count` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `like_signatures`(
    `like_id` INT NOT NULL,
    `author_signature` TEXT NOT NULL,
    `signature_order_id` INT NOT NULL,
    `additional_data` TEXT NULL
);
ALTER TABLE
    `like_signatures` ADD UNIQUE `like_signatures_like_id_unique`(`like_id`);
ALTER TABLE
    `like_signatures` ADD INDEX `like_signatures_signature_order_id_index`(`signature_order_id`);
CREATE TABLE `likes`(
    `id` INT NOT NULL,
    `positive` TINYINT NULL,
    `target_id` INT NULL,
    `author_id` INT NULL,
    `guid` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `target_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `likes` ADD UNIQUE `likes_target_id_author_id_target_type_unique`(
        `target_id`,
        `author_id`,
        `target_type`
    );
ALTER TABLE
    `likes` ADD INDEX `likes_target_id_index`(`target_id`);
ALTER TABLE
    `likes` ADD INDEX `likes_author_id_index`(`author_id`);
ALTER TABLE
    `likes` ADD UNIQUE `likes_guid_unique`(`guid`);
CREATE TABLE `locations`(
    `id` INT NOT NULL,
    `address` VARCHAR(255) NULL,
    `lat` VARCHAR(255) NULL,
    `lng` VARCHAR(255) NULL,
    `status_message_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `locations` ADD INDEX `locations_status_message_id_index`(`status_message_id`);
CREATE TABLE `mentions`(
    `id` INT NOT NULL,
    `mentions_container_id` INT NOT NULL,
    `person_id` INT NOT NULL,
    `mentions_container_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `mentions` ADD UNIQUE `mentions_container_id_person_id_mentions_container_type_unique`(
        `mentions_container_id`,
        `person_id`,
        `mentions_container_type`
    );
ALTER TABLE
    `mentions` ADD INDEX `mentions_mentions_container_id_mentions_container_type_index`(
        `mentions_container_id`,
        `mentions_container_type`
    );
ALTER TABLE
    `mentions` ADD INDEX `mentions_person_id_index`(`person_id`);
CREATE TABLE `messages`(
    `id` INT NOT NULL,
    `conversation_id` INT NOT NULL,
    `author_id` INT NOT NULL,
    `guid` VARCHAR(255) NOT NULL,
    `text` TEXT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `messages` ADD INDEX `messages_conversation_id_index`(`conversation_id`);
ALTER TABLE
    `messages` ADD INDEX `messages_author_id_index`(`author_id`);
ALTER TABLE
    `messages` ADD UNIQUE `messages_guid_unique`(`guid`);
CREATE TABLE `notification_actors`(
    `id` INT NOT NULL,
    `notification_id` INT NULL,
    `person_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notification_actors` ADD UNIQUE `notification_actors_notification_id_person_id_unique`(`notification_id`, `person_id`);
ALTER TABLE
    `notification_actors` ADD INDEX `notification_actors_notification_id_index`(`notification_id`);
ALTER TABLE
    `notification_actors` ADD INDEX `notification_actors_person_id_index`(`person_id`);
CREATE TABLE `notifications`(
    `id` INT NOT NULL,
    `target_type` VARCHAR(255) NULL,
    `target_id` INT NULL,
    `recipient_id` INT NOT NULL,
    `unread` TINYINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `type` VARCHAR(255) NULL,
    `guid` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notifications` ADD INDEX `notifications_target_type_target_id_index`(`target_type`, `target_id`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_target_id_index`(`target_id`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_recipient_id_index`(`recipient_id`);
ALTER TABLE
    `notifications` ADD UNIQUE `notifications_guid_unique`(`guid`);
CREATE TABLE `o_auth_access_tokens`(
    `id` INT NOT NULL,
    `authorization_id` INT NULL,
    `token` VARCHAR(255) NULL,
    `expires_at` DATETIME NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `o_auth_access_tokens` ADD INDEX `o_auth_access_tokens_authorization_id_index`(`authorization_id`);
ALTER TABLE
    `o_auth_access_tokens` ADD UNIQUE `o_auth_access_tokens_token_unique`(`token`);
CREATE TABLE `o_auth_applications`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `client_id` VARCHAR(255) NULL,
    `client_secret` VARCHAR(255) NULL,
    `client_name` VARCHAR(255) NULL,
    `redirect_uris` TEXT NULL,
    `response_types` VARCHAR(255) NULL,
    `grant_types` VARCHAR(255) NULL,
    `application_type` VARCHAR(255) NULL,
    `contacts` VARCHAR(255) NULL,
    `logo_uri` VARCHAR(255) NULL,
    `client_uri` VARCHAR(255) NULL,
    `policy_uri` VARCHAR(255) NULL,
    `tos_uri` VARCHAR(255) NULL,
    `sector_identifier_uri` VARCHAR(255) NULL,
    `token_endpoint_auth_method` VARCHAR(255) NULL,
    `jwks` TEXT NULL,
    `jwks_uri` VARCHAR(255) NULL,
    `ppid` TINYINT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `o_auth_applications` ADD INDEX `o_auth_applications_user_id_index`(`user_id`);
ALTER TABLE
    `o_auth_applications` ADD UNIQUE `o_auth_applications_client_id_unique`(`client_id`);
CREATE TABLE `o_embed_caches`(
    `id` INT NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `data` TEXT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `o_embed_caches` ADD INDEX `o_embed_caches_url_index`(`url`);
CREATE TABLE `open_graph_caches`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NULL,
    `ob_type` VARCHAR(255) NULL,
    `image` TEXT NULL,
    `url` TEXT NULL,
    `description` TEXT NULL,
    `video_url` TEXT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `participations`(
    `id` INT NOT NULL,
    `guid` VARCHAR(255) NULL,
    `target_id` INT NULL,
    `target_type` VARCHAR(255) NOT NULL,
    `author_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `count` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `participations` ADD UNIQUE `participations_target_id_target_type_author_id_unique`(
        `target_id`,
        `target_type`,
        `author_id`
    );
ALTER TABLE
    `participations` ADD INDEX `participations_guid_index`(`guid`);
ALTER TABLE
    `participations` ADD INDEX `participations_author_id_index`(`author_id`);
CREATE TABLE `people`(
    `id` INT NOT NULL,
    `guid` VARCHAR(255) NOT NULL,
    `diaspora_handle` VARCHAR(255) NOT NULL,
    `serialized_public_key` TEXT NOT NULL,
    `owner_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `closed_account` TINYINT NULL,
    `fetch_status` INT NULL,
    `pod_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `people` ADD UNIQUE `people_guid_unique`(`guid`);
ALTER TABLE
    `people` ADD UNIQUE `people_diaspora_handle_unique`(`diaspora_handle`);
ALTER TABLE
    `people` ADD UNIQUE `people_owner_id_unique`(`owner_id`);
ALTER TABLE
    `people` ADD INDEX `people_pod_id_index`(`pod_id`);
CREATE TABLE `photos`(
    `id` INT NOT NULL,
    `author_id` INT NOT NULL,
    `public` TINYINT NOT NULL,
    `guid` VARCHAR(255) NOT NULL,
    `pending` TINYINT NOT NULL,
    `text` TEXT NULL,
    `remote_photo_path` TEXT NULL,
    `remote_photo_name` VARCHAR(255) NULL,
    `random_string` VARCHAR(255) NULL,
    `processed_image` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    `unprocessed_image` VARCHAR(255) NULL,
    `status_message_guid` VARCHAR(255) NULL,
    `height` INT NULL,
    `width` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `photos` ADD INDEX `photos_author_id_index`(`author_id`);
ALTER TABLE
    `photos` ADD UNIQUE `photos_guid_unique`(`guid`);
ALTER TABLE
    `photos` ADD INDEX `photos_status_message_guid_index`(`status_message_guid`);
CREATE TABLE `pods`(
    `id` INT NOT NULL,
    `host` VARCHAR(255) NOT NULL,
    `ssl` TINYINT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `status` INT NULL,
    `checked_at` DATETIME NULL,
    `offline_since` DATETIME NULL,
    `response_time` INT NULL,
    `software` VARCHAR(255) NULL,
    `error` VARCHAR(255) NULL,
    `port` INT NULL,
    `blocked` TINYINT NULL,
    `scheduled_check` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `pods` ADD UNIQUE `pods_host_port_unique`(`host`, `port`);
ALTER TABLE
    `pods` ADD INDEX `pods_status_index`(`status`);
ALTER TABLE
    `pods` ADD INDEX `pods_checked_at_index`(`checked_at`);
ALTER TABLE
    `pods` ADD INDEX `pods_offline_since_index`(`offline_since`);
CREATE TABLE `poll_answers`(
    `id` INT NOT NULL,
    `answer` VARCHAR(255) NOT NULL,
    `poll_id` INT NOT NULL,
    `guid` VARCHAR(255) NULL,
    `vote_count` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `poll_answers` ADD INDEX `poll_answers_poll_id_index`(`poll_id`);
ALTER TABLE
    `poll_answers` ADD UNIQUE `poll_answers_guid_unique`(`guid`);
CREATE TABLE `poll_participation_signatures`(
    `poll_participation_id` INT NOT NULL,
    `author_signature` TEXT NOT NULL,
    `signature_order_id` INT NOT NULL,
    `additional_data` TEXT NULL
);
ALTER TABLE
    `poll_participation_signatures` ADD UNIQUE `poll_participation_signatures_poll_participation_id_unique`(`poll_participation_id`);
ALTER TABLE
    `poll_participation_signatures` ADD INDEX `poll_participation_signatures_signature_order_id_index`(`signature_order_id`);
CREATE TABLE `poll_participations`(
    `id` INT NOT NULL,
    `poll_answer_id` INT NOT NULL,
    `author_id` INT NOT NULL,
    `poll_id` INT NOT NULL,
    `guid` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `poll_participations` ADD UNIQUE `poll_participations_author_id_poll_id_unique`(`author_id`, `poll_id`);
ALTER TABLE
    `poll_participations` ADD UNIQUE `poll_participations_guid_unique`(`guid`);
CREATE TABLE `polls`(
    `id` INT NOT NULL,
    `question` VARCHAR(255) NOT NULL,
    `status_message_id` INT NOT NULL,
    `status` TINYINT NULL,
    `guid` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `polls` ADD INDEX `polls_status_message_id_index`(`status_message_id`);
ALTER TABLE
    `polls` ADD UNIQUE `polls_guid_unique`(`guid`);
CREATE TABLE `posts`(
    `id` INT NOT NULL,
    `author_id` INT NOT NULL,
    `public` TINYINT NOT NULL,
    `guid` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `text` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `provider_display_name` VARCHAR(255) NULL,
    `root_guid` VARCHAR(255) NULL,
    `likes_count` INT NULL,
    `comments_count` INT NULL,
    `o_embed_cache_id` INT NULL,
    `reshares_count` INT NULL,
    `interacted_at` DATETIME NULL,
    `tweet_id` VARCHAR(255) NULL,
    `open_graph_cache_id` INT NULL,
    `tumblr_ids` TEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `posts` ADD UNIQUE `posts_author_id_root_guid_unique`(`author_id`, `root_guid`);
ALTER TABLE
    `posts` ADD INDEX `posts_id_type_index`(`id`, `type`);
ALTER TABLE
    `posts` ADD INDEX `posts_id_created_at_index`(`id`, `created_at`);
ALTER TABLE
    `posts` ADD INDEX `posts_author_id_index`(`author_id`);
ALTER TABLE
    `posts` ADD UNIQUE `posts_guid_unique`(`guid`);
ALTER TABLE
    `posts` ADD INDEX `posts_root_guid_index`(`root_guid`);
CREATE TABLE `ppid`(
    `id` INT NOT NULL,
    `o_auth_application_id` INT NULL,
    `user_id` INT NULL,
    `guid` VARCHAR(255) NULL,
    `identifier` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `ppid` ADD INDEX `ppid_o_auth_application_id_index`(`o_auth_application_id`);
ALTER TABLE
    `ppid` ADD INDEX `ppid_user_id_index`(`user_id`);
CREATE TABLE `profiles`(
    `id` INT NOT NULL,
    `diaspora_handle` VARCHAR(255) NULL,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `image_url` VARCHAR(255) NULL,
    `image_url_small` VARCHAR(255) NULL,
    `image_url_medium` VARCHAR(255) NULL,
    `birthday` DATE NULL,
    `gender` VARCHAR(255) NULL,
    `bio` TEXT NULL,
    `searchable` TINYINT NOT NULL,
    `person_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `location` VARCHAR(255) NULL,
    `full_name` VARCHAR(255) NULL,
    `nsfw` TINYINT NULL,
    `public_details` TINYINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `profiles` ADD INDEX `profiles_searchable_full_name_index`(`searchable`, `full_name`);
ALTER TABLE
    `profiles` ADD INDEX `profiles_person_id_index`(`person_id`);
ALTER TABLE
    `profiles` ADD INDEX `profiles_full_name_index`(`full_name`);
CREATE TABLE `references`(
    `id` BIGINT NOT NULL,
    `source_id` INT NOT NULL,
    `source_type` VARCHAR(255) NOT NULL,
    `target_id` INT NOT NULL,
    `target_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `references` ADD UNIQUE `references_source_id_source_type_target_id_target_type_unique`(
        `source_id`,
        `source_type`,
        `target_id`,
        `target_type`
    );
ALTER TABLE
    `references` ADD INDEX `references_source_id_source_type_index`(`source_id`, `source_type`);
CREATE TABLE `reports`(
    `id` INT NOT NULL,
    `item_id` INT NOT NULL,
    `item_type` VARCHAR(255) NOT NULL,
    `reviewed` TINYINT NULL,
    `text` TEXT NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `reports` ADD INDEX `reports_item_id_index`(`item_id`);
CREATE TABLE `roles`(
    `id` INT NOT NULL,
    `person_id` INT NULL,
    `name` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `roles` ADD UNIQUE `roles_person_id_name_unique`(`person_id`, `name`);
CREATE TABLE `services`(
    `id` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `uid` VARCHAR(255) NULL,
    `access_token` VARCHAR(255) NULL,
    `access_secret` VARCHAR(255) NULL,
    `nickname` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `services` ADD INDEX `services_type_uid_index`(`type`, `uid`);
ALTER TABLE
    `services` ADD INDEX `services_user_id_index`(`user_id`);
CREATE TABLE `share_visibilities`(
    `id` INT NOT NULL,
    `shareable_id` INT NOT NULL,
    `hidden` TINYINT NOT NULL,
    `shareable_type` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `share_visibilities` ADD UNIQUE `share_visibilities_shareable_id_shareable_type_user_id_unique`(
        `shareable_id`,
        `shareable_type`,
        `user_id`
    );
ALTER TABLE
    `share_visibilities` ADD INDEX `shareable_id_hidden_shareable_type_user_id_index`(
        `shareable_id`,
        `hidden`,
        `shareable_type`,
        `user_id`
    );
ALTER TABLE
    `share_visibilities` ADD INDEX `share_visibilities_shareable_id_index`(`shareable_id`);
ALTER TABLE
    `share_visibilities` ADD INDEX `share_visibilities_user_id_index`(`user_id`);
CREATE TABLE `signature_orders`(
    `id` INT NOT NULL,
    `order` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `signature_orders` ADD UNIQUE `signature_orders_order_unique`(`order`);
CREATE TABLE `simple_captcha_data`(
    `id` INT NOT NULL,
    `key` VARCHAR(255) NULL,
    `value` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    `updated_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `simple_captcha_data` ADD INDEX `simple_captcha_data_key_index`(`key`);
CREATE TABLE `tag_followings`(
    `id` INT NOT NULL,
    `tag_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tag_followings` ADD UNIQUE `tag_followings_tag_id_user_id_unique`(`tag_id`, `user_id`);
ALTER TABLE
    `tag_followings` ADD INDEX `tag_followings_tag_id_index`(`tag_id`);
ALTER TABLE
    `tag_followings` ADD INDEX `tag_followings_user_id_index`(`user_id`);
CREATE TABLE `taggings`(
    `id` INT NOT NULL,
    `tag_id` INT NULL,
    `taggable_id` INT NULL,
    `taggable_type` VARCHAR(255) NULL,
    `tagger_id` INT NULL,
    `tagger_type` VARCHAR(255) NULL,
    `context` VARCHAR(255) NULL,
    `created_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `taggings` ADD UNIQUE `taggings_tag_id_taggable_id_taggable_type_unique`(
        `tag_id`,
        `taggable_id`,
        `taggable_type`
    );
ALTER TABLE
    `taggings` ADD INDEX `taggings_taggable_id_taggable_type_context_index`(
        `taggable_id`,
        `taggable_type`,
        `context`
    );
ALTER TABLE
    `taggings` ADD INDEX `taggings_tag_id_index`(`tag_id`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_created_at_index`(`created_at`);
CREATE TABLE `tags`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `taggings_count` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tags` ADD UNIQUE `tags_name_unique`(`name`);
CREATE TABLE `user_preferences`(
    `id` INT NOT NULL,
    `email_type` VARCHAR(255) NULL,
    `user_id` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `user_preferences` ADD INDEX `user_preferences_email_type_user_id_index`(`email_type`, `user_id`);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `serialized_private_key` TEXT NULL,
    `getting_started` TINYINT NOT NULL,
    `disable_mail` TINYINT NOT NULL,
    `language` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `encrypted_password` VARCHAR(255) NOT NULL,
    `reset_password_token` VARCHAR(255) NULL,
    `remember_created_at` DATETIME NULL,
    `sign_in_count` INT NULL,
    `current_sign_in_at` DATETIME NULL,
    `last_sign_in_at` DATETIME NULL,
    `current_sign_in_ip` VARCHAR(255) NULL,
    `last_sign_in_ip` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `invited_by_id` INT NULL,
    `authentication_token` VARCHAR(255) NULL,
    `unconfirmed_email` VARCHAR(255) NULL,
    `confirm_email_token` VARCHAR(255) NULL,
    `locked_at` DATETIME NULL,
    `show_community_spotlight_in_stream` TINYINT NOT NULL,
    `auto_follow_back` TINYINT NULL,
    `auto_follow_back_aspect_id` INT NULL,
    `hidden_shareables` TEXT NULL,
    `reset_password_sent_at` DATETIME NULL,
    `last_seen` DATETIME NULL,
    `remove_after` DATETIME NULL,
    `export` VARCHAR(255) NULL,
    `exported_at` DATETIME NULL,
    `exporting` TINYINT NULL,
    `strip_exif` TINYINT NULL,
    `exported_photos_file` VARCHAR(255) NULL,
    `exported_photos_at` DATETIME NULL,
    `exporting_photos` TINYINT NULL,
    `color_theme` VARCHAR(255) NULL,
    `post_default_public` TINYINT NULL,
    `consumed_timestep` INT NULL,
    `otp_required_for_login` TINYINT NULL,
    `otp_backup_codes` TEXT NULL,
    `plain_otp_secret` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_username_unique`(`username`);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD UNIQUE `users_authentication_token_unique`(`authentication_token`);
ALTER TABLE
    `aspect_memberships` ADD CONSTRAINT `aspect_memberships_contact_id_foreign` FOREIGN KEY(`contact_id`) REFERENCES `contacts`(`id`);
ALTER TABLE
    `poll_participation_signatures` ADD CONSTRAINT `poll_participation_signatures_poll_participation_id_foreign` FOREIGN KEY(`poll_participation_id`) REFERENCES `poll_participations`(`id`);
ALTER TABLE
    `roles` ADD CONSTRAINT `roles_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `account_deletions` ADD CONSTRAINT `account_deletions_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `ppid` ADD CONSTRAINT `ppid_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `user_preferences` ADD CONSTRAINT `user_preferences_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `comment_signatures` ADD CONSTRAINT `comment_signatures_comment_id_foreign` FOREIGN KEY(`comment_id`) REFERENCES `comments`(`id`);
ALTER TABLE
    `poll_participation_signatures` ADD CONSTRAINT `poll_participation_signatures_signature_order_id_foreign` FOREIGN KEY(`signature_order_id`) REFERENCES `signature_orders`(`id`);
ALTER TABLE
    `aspect_visibilities` ADD CONSTRAINT `aspect_visibilities_aspect_id_foreign` FOREIGN KEY(`aspect_id`) REFERENCES `aspects`(`id`);
ALTER TABLE
    `mentions` ADD CONSTRAINT `mentions_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `tag_followings` ADD CONSTRAINT `tag_followings_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `account_migrations` ADD CONSTRAINT `account_migrations_old_person_id_foreign` FOREIGN KEY(`old_person_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `like_signatures` ADD CONSTRAINT `like_signatures_like_id_foreign` FOREIGN KEY(`like_id`) REFERENCES `likes`(`id`);
ALTER TABLE
    `blocks` ADD CONSTRAINT `blocks_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `comment_signatures` ADD CONSTRAINT `comment_signatures_signature_order_id_foreign` FOREIGN KEY(`signature_order_id`) REFERENCES `signature_orders`(`id`);
ALTER TABLE
    `share_visibilities` ADD CONSTRAINT `share_visibilities_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `blocks` ADD CONSTRAINT `blocks_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `authorizations` ADD CONSTRAINT `authorizations_o_auth_application_id_foreign` FOREIGN KEY(`o_auth_application_id`) REFERENCES `o_auth_applications`(`id`);
ALTER TABLE
    `like_signatures` ADD CONSTRAINT `like_signatures_signature_order_id_foreign` FOREIGN KEY(`signature_order_id`) REFERENCES `signature_orders`(`id`);
ALTER TABLE
    `account_migrations` ADD CONSTRAINT `account_migrations_new_person_id_foreign` FOREIGN KEY(`new_person_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `posts` ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY(`conversation_id`) REFERENCES `conversations`(`id`);
ALTER TABLE
    `o_auth_access_tokens` ADD CONSTRAINT `o_auth_access_tokens_authorization_id_foreign` FOREIGN KEY(`authorization_id`) REFERENCES `authorizations`(`id`);
ALTER TABLE
    `authorizations` ADD CONSTRAINT `authorizations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `poll_answers` ADD CONSTRAINT `poll_answers_poll_id_foreign` FOREIGN KEY(`poll_id`) REFERENCES `polls`(`id`);
ALTER TABLE
    `conversation_visibilities` ADD CONSTRAINT `conversation_visibilities_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `o_auth_applications` ADD CONSTRAINT `o_auth_applications_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `aspect_memberships` ADD CONSTRAINT `aspect_memberships_aspect_id_foreign` FOREIGN KEY(`aspect_id`) REFERENCES `aspects`(`id`);
ALTER TABLE
    `ppid` ADD CONSTRAINT `ppid_o_auth_application_id_foreign` FOREIGN KEY(`o_auth_application_id`) REFERENCES `o_auth_applications`(`id`);
ALTER TABLE
    `taggings` ADD CONSTRAINT `taggings_tagger_id_foreign` FOREIGN KEY(`tagger_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `likes` ADD CONSTRAINT `likes_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `conversation_visibilities` ADD CONSTRAINT `conversation_visibilities_conversation_id_foreign` FOREIGN KEY(`conversation_id`) REFERENCES `conversations`(`id`);
ALTER TABLE
    `notification_actors` ADD CONSTRAINT `notification_actors_notification_id_foreign` FOREIGN KEY(`notification_id`) REFERENCES `notifications`(`id`);
ALTER TABLE
    `profiles` ADD CONSTRAINT `profiles_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `photos` ADD CONSTRAINT `photos_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `services` ADD CONSTRAINT `services_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `people` ADD CONSTRAINT `people_pod_id_foreign` FOREIGN KEY(`pod_id`) REFERENCES `pods`(`id`);
ALTER TABLE
    `contacts` ADD CONSTRAINT `contacts_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `tag_followings` ADD CONSTRAINT `tag_followings_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);
ALTER TABLE
    `conversations` ADD CONSTRAINT `conversations_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `people`(`id`);
ALTER TABLE
    `taggings` ADD CONSTRAINT `taggings_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);