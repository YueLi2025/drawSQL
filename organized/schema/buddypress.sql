CREATE TABLE `bp_notifications`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `item_id` BIGINT NOT NULL,
    `secondary_item_id` BIGINT NULL,
    `component_name` VARCHAR(255) NOT NULL,
    `component_action` VARCHAR(255) NOT NULL,
    `date_notified` DATETIME NOT NULL,
    `is_new` BOOLEAN NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_notifications` ADD INDEX `bp_notifications_user_id_is_new_index`(`user_id`, `is_new`);
ALTER TABLE
    `bp_notifications` ADD INDEX `bp_notifications_user_id_index`(`user_id`);
ALTER TABLE
    `bp_notifications` ADD INDEX `bp_notifications_item_id_index`(`item_id`);
ALTER TABLE
    `bp_notifications` ADD INDEX `bp_notifications_secondary_item_id_index`(`secondary_item_id`);
ALTER TABLE
    `bp_notifications` ADD INDEX `bp_notifications_component_name_index`(`component_name`);
ALTER TABLE
    `bp_notifications` ADD INDEX `bp_notifications_component_action_index`(`component_action`);
ALTER TABLE
    `bp_notifications` ADD INDEX `bp_notifications_is_new_index`(`is_new`);
CREATE TABLE `bp_notifications_meta`(
    `id` BIGINT NOT NULL,
    `notification_id` BIGINT NOT NULL,
    `meta_key` VARCHAR(255) NULL,
    `meta_value` LONGTEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_notifications_meta` ADD INDEX `bp_notifications_meta_notification_id_index`(`notification_id`);
ALTER TABLE
    `bp_notifications_meta` ADD INDEX `bp_notifications_meta_meta_key_index`(`meta_key`);
CREATE TABLE `bp_activity`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `component` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `action` TEXT NOT NULL,
    `content` LONGTEXT NOT NULL,
    `primary_link` TEXT NOT NULL,
    `item_id` BIGINT NOT NULL,
    `secondary_item_id` BIGINT NULL,
    `date_recorded` DATETIME NOT NULL,
    `hide_sitewide` BOOLEAN NULL,
    `mptt_left` INT NOT NULL,
    `mptt_right` INT NOT NULL,
    `is_spam` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_activity` ADD INDEX `bp_activity_user_id_index`(`user_id`);
ALTER TABLE
    `bp_activity` ADD INDEX `bp_activity_component_index`(`component`);
ALTER TABLE
    `bp_activity` ADD INDEX `bp_activity_type_index`(`type`);
ALTER TABLE
    `bp_activity` ADD INDEX `bp_activity_item_id_index`(`item_id`);
ALTER TABLE
    `bp_activity` ADD INDEX `bp_activity_secondary_item_id_index`(`secondary_item_id`);
ALTER TABLE
    `bp_activity` ADD INDEX `bp_activity_date_recorded_index`(`date_recorded`);
ALTER TABLE
    `bp_activity` ADD INDEX `bp_activity_hide_sitewide_index`(`hide_sitewide`);
ALTER TABLE
    `bp_activity` ADD INDEX `bp_activity_mptt_left_index`(`mptt_left`);
ALTER TABLE
    `bp_activity` ADD INDEX `bp_activity_mptt_right_index`(`mptt_right`);
ALTER TABLE
    `bp_activity` ADD INDEX `bp_activity_is_spam_index`(`is_spam`);
CREATE TABLE `bp_activity_meta`(
    `id` BIGINT NOT NULL,
    `activity_id` BIGINT NOT NULL,
    `meta_key` VARCHAR(255) NULL,
    `meta_value` LONGTEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_activity_meta` ADD INDEX `bp_activity_meta_activity_id_index`(`activity_id`);
ALTER TABLE
    `bp_activity_meta` ADD INDEX `bp_activity_meta_meta_key_index`(`meta_key`);
CREATE TABLE `bp_friends`(
    `id` BIGINT NOT NULL,
    `initiator_user_id` BIGINT NOT NULL,
    `friend_user_id` BIGINT NOT NULL,
    `is_confirmed` BOOLEAN NULL,
    `is_limited` BOOLEAN NULL,
    `date_created` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_friends` ADD INDEX `bp_friends_initiator_user_id_index`(`initiator_user_id`);
ALTER TABLE
    `bp_friends` ADD INDEX `bp_friends_friend_user_id_index`(`friend_user_id`);
CREATE TABLE `bp_groups`(
    `id` BIGINT NOT NULL,
    `creator_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `description` LONGTEXT NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `parent_id` BIGINT NOT NULL,
    `enable_forum` TINYINT NOT NULL,
    `date_created` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_groups` ADD INDEX `bp_groups_creator_id_index`(`creator_id`);
ALTER TABLE
    `bp_groups` ADD INDEX `bp_groups_status_index`(`status`);
ALTER TABLE
    `bp_groups` ADD INDEX `bp_groups_parent_id_index`(`parent_id`);
CREATE TABLE `bp_groups_members`(
    `id` BIGINT NOT NULL,
    `group_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `inviter_id` BIGINT NOT NULL,
    `is_admin` TINYINT NOT NULL,
    `is_mod` TINYINT NOT NULL,
    `user_title` VARCHAR(255) NOT NULL,
    `date_modified` DATETIME NOT NULL,
    `comments` LONGTEXT NOT NULL,
    `is_confirmed` TINYINT NOT NULL,
    `is_banned` TINYINT NOT NULL,
    `invite_sent` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_groups_members` ADD INDEX `bp_groups_members_group_id_index`(`group_id`);
ALTER TABLE
    `bp_groups_members` ADD INDEX `bp_groups_members_user_id_index`(`user_id`);
ALTER TABLE
    `bp_groups_members` ADD INDEX `bp_groups_members_inviter_id_index`(`inviter_id`);
ALTER TABLE
    `bp_groups_members` ADD INDEX `bp_groups_members_is_admin_index`(`is_admin`);
ALTER TABLE
    `bp_groups_members` ADD INDEX `bp_groups_members_is_mod_index`(`is_mod`);
ALTER TABLE
    `bp_groups_members` ADD INDEX `bp_groups_members_is_confirmed_index`(`is_confirmed`);
CREATE TABLE `bp_groups_groupmeta`(
    `id` BIGINT NOT NULL,
    `group_id` BIGINT NOT NULL,
    `meta_key` VARCHAR(255) NULL,
    `meta_value` LONGTEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_groups_groupmeta` ADD INDEX `bp_groups_groupmeta_group_id_index`(`group_id`);
ALTER TABLE
    `bp_groups_groupmeta` ADD INDEX `bp_groups_groupmeta_meta_key_index`(`meta_key`);
CREATE TABLE `bp_messages_messages`(
    `id` BIGINT NOT NULL,
    `thread_id` BIGINT NOT NULL,
    `sender_id` BIGINT NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `message` LONGTEXT NOT NULL,
    `date_sent` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_messages_messages` ADD INDEX `bp_messages_messages_thread_id_index`(`thread_id`);
ALTER TABLE
    `bp_messages_messages` ADD INDEX `bp_messages_messages_sender_id_index`(`sender_id`);
CREATE TABLE `bp_messages_recipients`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `thread_id` BIGINT NOT NULL,
    `unread_count` INT NOT NULL,
    `sender_only` TINYINT NOT NULL,
    `is_deleted` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_messages_recipients` ADD INDEX `bp_messages_recipients_user_id_index`(`user_id`);
ALTER TABLE
    `bp_messages_recipients` ADD INDEX `bp_messages_recipients_thread_id_index`(`thread_id`);
ALTER TABLE
    `bp_messages_recipients` ADD INDEX `bp_messages_recipients_unread_count_index`(`unread_count`);
ALTER TABLE
    `bp_messages_recipients` ADD INDEX `bp_messages_recipients_sender_only_index`(`sender_only`);
ALTER TABLE
    `bp_messages_recipients` ADD INDEX `bp_messages_recipients_is_deleted_index`(`is_deleted`);
CREATE TABLE `bp_messages_notices`(
    `id` BIGINT NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `message` LONGTEXT NOT NULL,
    `date_sent` DATETIME NOT NULL,
    `is_active` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_messages_notices` ADD INDEX `bp_messages_notices_is_active_index`(`is_active`);
CREATE TABLE `bp_messages_meta`(
    `id` BIGINT NOT NULL,
    `message_id` BIGINT NOT NULL,
    `meta_key` VARCHAR(255) NULL,
    `meta_value` LONGTEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_messages_meta` ADD INDEX `bp_messages_meta_message_id_index`(`message_id`);
ALTER TABLE
    `bp_messages_meta` ADD INDEX `bp_messages_meta_meta_key_index`(`meta_key`);
CREATE TABLE `bp_xprofile_groups`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` MEDIUMTEXT NOT NULL,
    `group_order` BIGINT NOT NULL,
    `can_delete` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_xprofile_groups` ADD INDEX `bp_xprofile_groups_can_delete_index`(`can_delete`);
CREATE TABLE `bp_xprofile_fields`(
    `id` BIGINT NOT NULL,
    `group_id` BIGINT NOT NULL,
    `parent_id` BIGINT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` LONGTEXT NOT NULL,
    `is_required` TINYINT NOT NULL,
    `is_default_option` TINYINT NOT NULL,
    `field_order` BIGINT NOT NULL,
    `option_order` BIGINT NOT NULL,
    `order_by` VARCHAR(255) NOT NULL,
    `can_delete` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_xprofile_fields` ADD INDEX `bp_xprofile_fields_group_id_index`(`group_id`);
ALTER TABLE
    `bp_xprofile_fields` ADD INDEX `bp_xprofile_fields_parent_id_index`(`parent_id`);
ALTER TABLE
    `bp_xprofile_fields` ADD INDEX `bp_xprofile_fields_is_required_index`(`is_required`);
ALTER TABLE
    `bp_xprofile_fields` ADD INDEX `bp_xprofile_fields_field_order_index`(`field_order`);
ALTER TABLE
    `bp_xprofile_fields` ADD INDEX `bp_xprofile_fields_can_delete_index`(`can_delete`);
CREATE TABLE `bp_xprofile_data`(
    `id` BIGINT NOT NULL,
    `field_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `value` LONGTEXT NOT NULL,
    `last_updated` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_xprofile_data` ADD INDEX `bp_xprofile_data_field_id_index`(`field_id`);
ALTER TABLE
    `bp_xprofile_data` ADD INDEX `bp_xprofile_data_user_id_index`(`user_id`);
CREATE TABLE `bp_xprofile_meta`(
    `id` BIGINT NOT NULL,
    `object_id` BIGINT NOT NULL,
    `object_type` VARCHAR(255) NOT NULL,
    `meta_key` VARCHAR(255) NULL,
    `meta_value` LONGTEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_xprofile_meta` ADD INDEX `bp_xprofile_meta_object_id_index`(`object_id`);
ALTER TABLE
    `bp_xprofile_meta` ADD INDEX `bp_xprofile_meta_meta_key_index`(`meta_key`);
CREATE TABLE `bp_user_blogs`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `blog_id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_user_blogs` ADD INDEX `bp_user_blogs_user_id_index`(`user_id`);
ALTER TABLE
    `bp_user_blogs` ADD INDEX `bp_user_blogs_blog_id_index`(`blog_id`);
CREATE TABLE `bp_user_blogs_blogmeta`(
    `id` BIGINT NOT NULL,
    `blog_id` BIGINT NOT NULL,
    `meta_key` VARCHAR(255) NULL,
    `meta_value` LONGTEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_user_blogs_blogmeta` ADD INDEX `bp_user_blogs_blogmeta_blog_id_index`(`blog_id`);
ALTER TABLE
    `bp_user_blogs_blogmeta` ADD INDEX `bp_user_blogs_blogmeta_meta_key_index`(`meta_key`);
CREATE TABLE `bp_invitations`(
    `id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `inviter_id` BIGINT NOT NULL,
    `invitee_email` VARCHAR(255) NULL,
    `class` VARCHAR(255) NOT NULL,
    `item_id` BIGINT NOT NULL,
    `secondary_item_id` BIGINT NULL,
    `type` VARCHAR(255) NOT NULL,
    `content` LONGTEXT NULL,
    `date_modified` DATETIME NOT NULL,
    `invite_sent` TINYINT NOT NULL,
    `accepted` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_invitations` ADD INDEX `bp_invitations_user_id_index`(`user_id`);
ALTER TABLE
    `bp_invitations` ADD INDEX `bp_invitations_inviter_id_index`(`inviter_id`);
ALTER TABLE
    `bp_invitations` ADD INDEX `bp_invitations_invitee_email_index`(`invitee_email`);
ALTER TABLE
    `bp_invitations` ADD INDEX `bp_invitations_class_index`(`class`);
ALTER TABLE
    `bp_invitations` ADD INDEX `bp_invitations_item_id_index`(`item_id`);
ALTER TABLE
    `bp_invitations` ADD INDEX `bp_invitations_secondary_item_id_index`(`secondary_item_id`);
ALTER TABLE
    `bp_invitations` ADD INDEX `bp_invitations_type_index`(`type`);
ALTER TABLE
    `bp_invitations` ADD INDEX `bp_invitations_invite_sent_index`(`invite_sent`);
ALTER TABLE
    `bp_invitations` ADD INDEX `bp_invitations_accepted_index`(`accepted`);
CREATE TABLE `wp_users`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `bp_friends` ADD CONSTRAINT `bp_friends_initiator_user_id_foreign` FOREIGN KEY(`initiator_user_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_xprofile_meta` ADD CONSTRAINT `bp_xprofile_meta_object_id_foreign` FOREIGN KEY(`object_id`) REFERENCES `bp_xprofile_data`(`id`);
ALTER TABLE
    `bp_groups_groupmeta` ADD CONSTRAINT `bp_groups_groupmeta_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `bp_groups`(`id`);
ALTER TABLE
    `bp_messages_meta` ADD CONSTRAINT `bp_messages_meta_message_id_foreign` FOREIGN KEY(`message_id`) REFERENCES `bp_messages_messages`(`id`);
ALTER TABLE
    `bp_user_blogs` ADD CONSTRAINT `bp_user_blogs_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_notifications` ADD CONSTRAINT `bp_notifications_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_invitations` ADD CONSTRAINT `bp_invitations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_groups` ADD CONSTRAINT `bp_groups_creator_id_foreign` FOREIGN KEY(`creator_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_messages_recipients` ADD CONSTRAINT `bp_messages_recipients_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_activity` ADD CONSTRAINT `bp_activity_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_groups_members` ADD CONSTRAINT `bp_groups_members_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `bp_groups`(`id`);
ALTER TABLE
    `bp_activity_meta` ADD CONSTRAINT `bp_activity_meta_activity_id_foreign` FOREIGN KEY(`activity_id`) REFERENCES `bp_activity`(`id`);
ALTER TABLE
    `bp_xprofile_data` ADD CONSTRAINT `bp_xprofile_data_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_notifications_meta` ADD CONSTRAINT `bp_notifications_meta_notification_id_foreign` FOREIGN KEY(`notification_id`) REFERENCES `bp_notifications`(`id`);
ALTER TABLE
    `bp_xprofile_fields` ADD CONSTRAINT `bp_xprofile_fields_parent_id_foreign` FOREIGN KEY(`parent_id`) REFERENCES `bp_xprofile_fields`(`id`);
ALTER TABLE
    `bp_groups_members` ADD CONSTRAINT `bp_groups_members_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_friends` ADD CONSTRAINT `bp_friends_friend_user_id_foreign` FOREIGN KEY(`friend_user_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_groups_members` ADD CONSTRAINT `bp_groups_members_inviter_id_foreign` FOREIGN KEY(`inviter_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_groups` ADD CONSTRAINT `bp_groups_parent_id_foreign` FOREIGN KEY(`parent_id`) REFERENCES `bp_groups`(`id`);
ALTER TABLE
    `bp_xprofile_fields` ADD CONSTRAINT `bp_xprofile_fields_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `bp_groups`(`id`);
ALTER TABLE
    `bp_xprofile_meta` ADD CONSTRAINT `bp_xprofile_meta_object_id_foreign` FOREIGN KEY(`object_id`) REFERENCES `bp_xprofile_fields`(`id`);
ALTER TABLE
    `bp_invitations` ADD CONSTRAINT `bp_invitations_inviter_id_foreign` FOREIGN KEY(`inviter_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_messages_messages` ADD CONSTRAINT `bp_messages_messages_sender_id_foreign` FOREIGN KEY(`sender_id`) REFERENCES `wp_users`(`id`);
ALTER TABLE
    `bp_xprofile_data` ADD CONSTRAINT `bp_xprofile_data_field_id_foreign` FOREIGN KEY(`field_id`) REFERENCES `bp_xprofile_fields`(`id`);