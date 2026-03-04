CREATE TABLE `backend_access_log`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `ip_address` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `backend_user_groups`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `code` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `is_new_user_default` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `backend_user_groups` ADD UNIQUE `backend_user_groups_name_unique`(`name`);
ALTER TABLE
    `backend_user_groups` ADD INDEX `backend_user_groups_code_index`(`code`);
CREATE TABLE `backend_user_preferences`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `namespace` VARCHAR(255) NOT NULL,
    `group` VARCHAR(255) NOT NULL,
    `item` VARCHAR(255) NOT NULL,
    `value` TEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `backend_user_preferences` ADD INDEX `backend_user_preferences_user_id_namespace_group_item_index`(
        `user_id`,
        `namespace`,
        `group`,
        `item`
    );
CREATE TABLE `backend_user_roles`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `code` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `permissions` TEXT NULL,
    `is_system` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `backend_user_roles` ADD UNIQUE `backend_user_roles_name_unique`(`name`);
ALTER TABLE
    `backend_user_roles` ADD INDEX `backend_user_roles_code_index`(`code`);
CREATE TABLE `backend_user_throttle`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `ip_address` VARCHAR(255) NULL,
    `attempts` INT NOT NULL,
    `last_attempt_at` TIMESTAMP NULL,
    `is_suspended` TINYINT NOT NULL,
    `suspended_at` TIMESTAMP NULL,
    `is_banned` TINYINT NOT NULL,
    `banned_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `backend_user_throttle` ADD INDEX `backend_user_throttle_user_id_index`(`user_id`);
ALTER TABLE
    `backend_user_throttle` ADD INDEX `backend_user_throttle_ip_address_index`(`ip_address`);
CREATE TABLE `backend_users`(
    `id` INT NOT NULL,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `login` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `activation_code` VARCHAR(255) NULL,
    `persist_code` VARCHAR(255) NULL,
    `reset_password_code` VARCHAR(255) NULL,
    `permissions` TEXT NULL,
    `is_activated` TINYINT NOT NULL,
    `role_id` INT NULL,
    `activated_at` TIMESTAMP NULL,
    `last_login` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `is_superuser` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `backend_users` ADD UNIQUE `backend_users_login_unique`(`login`);
ALTER TABLE
    `backend_users` ADD UNIQUE `backend_users_email_unique`(`email`);
ALTER TABLE
    `backend_users` ADD INDEX `backend_users_activation_code_index`(`activation_code`);
ALTER TABLE
    `backend_users` ADD INDEX `backend_users_reset_password_code_index`(`reset_password_code`);
ALTER TABLE
    `backend_users` ADD INDEX `backend_users_role_id_index`(`role_id`);
CREATE TABLE `backend_users_groups`(
    `user_id` INT NOT NULL,
    `user_group_id` INT NOT NULL,
    PRIMARY KEY(`user_id`, `user_group_id`)
);
CREATE TABLE `cache`(
    `key` VARCHAR(255) NOT NULL,
    `value` LONGTEXT NOT NULL,
    `expiration` INT NOT NULL
);
ALTER TABLE
    `cache` ADD UNIQUE `cache_key_unique`(`key`);
CREATE TABLE `cms_theme_data`(
    `id` INT NOT NULL,
    `theme` VARCHAR(255) NULL,
    `data` MEDIUMTEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `cms_theme_data` ADD INDEX `cms_theme_data_theme_index`(`theme`);
CREATE TABLE `cms_theme_logs`(
    `id` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `theme` VARCHAR(255) NULL,
    `template` VARCHAR(255) NULL,
    `old_template` VARCHAR(255) NULL,
    `content` LONGTEXT NULL,
    `old_content` LONGTEXT NULL,
    `user_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `cms_theme_logs` ADD INDEX `cms_theme_logs_type_index`(`type`);
ALTER TABLE
    `cms_theme_logs` ADD INDEX `cms_theme_logs_theme_index`(`theme`);
ALTER TABLE
    `cms_theme_logs` ADD INDEX `cms_theme_logs_user_id_index`(`user_id`);
CREATE TABLE `cms_theme_templates`(
    `id` INT NOT NULL,
    `source` VARCHAR(255) NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `content` LONGTEXT NOT NULL,
    `file_size` INT NOT NULL,
    `updated_at` DATETIME NULL,
    `deleted_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `cms_theme_templates` ADD INDEX `cms_theme_templates_source_index`(`source`);
ALTER TABLE
    `cms_theme_templates` ADD INDEX `cms_theme_templates_path_index`(`path`);
CREATE TABLE `deferred_bindings`(
    `id` INT NOT NULL,
    `master_type` VARCHAR(255) NOT NULL,
    `master_field` VARCHAR(255) NOT NULL,
    `slave_type` VARCHAR(255) NOT NULL,
    `slave_id` VARCHAR(255) NOT NULL,
    `session_key` VARCHAR(255) NOT NULL,
    `is_bind` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `deferred_bindings` ADD INDEX `deferred_bindings_master_type_index`(`master_type`);
ALTER TABLE
    `deferred_bindings` ADD INDEX `deferred_bindings_master_field_index`(`master_field`);
ALTER TABLE
    `deferred_bindings` ADD INDEX `deferred_bindings_slave_type_index`(`slave_type`);
ALTER TABLE
    `deferred_bindings` ADD INDEX `deferred_bindings_slave_id_index`(`slave_id`);
ALTER TABLE
    `deferred_bindings` ADD INDEX `deferred_bindings_session_key_index`(`session_key`);
CREATE TABLE `failed_jobs`(
    `id` INT NOT NULL,
    `connection` TEXT NOT NULL,
    `queue` TEXT NOT NULL,
    `payload` TEXT NOT NULL,
    `exception` LONGTEXT NULL,
    `failed_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `jobs`(
    `id` BIGINT NOT NULL,
    `queue` VARCHAR(255) NOT NULL,
    `payload` TEXT NOT NULL,
    `attempts` TINYINT NOT NULL,
    `reserved_at` INT NULL,
    `available_at` INT NOT NULL,
    `created_at` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `jobs` ADD INDEX `jobs_queue_reserved_at_index`(`queue`, `reserved_at`);
CREATE TABLE `migrations`(
    `id` INT NOT NULL,
    `migration` VARCHAR(255) NOT NULL,
    `batch` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `sessions`(
    `id` VARCHAR(255) NOT NULL,
    `payload` TEXT NULL,
    `last_activity` INT NULL,
    `user_id` INT NULL,
    `ip_address` VARCHAR(255) NULL,
    `user_agent` TEXT NULL
);
ALTER TABLE
    `sessions` ADD UNIQUE `sessions_id_unique`(`id`);
CREATE TABLE `system_event_logs`(
    `id` INT NOT NULL,
    `level` VARCHAR(255) NULL,
    `message` TEXT NULL,
    `details` MEDIUMTEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `system_event_logs` ADD INDEX `system_event_logs_level_index`(`level`);
CREATE TABLE `system_files`(
    `id` INT NOT NULL,
    `disk_name` VARCHAR(255) NOT NULL,
    `file_name` VARCHAR(255) NOT NULL,
    `file_size` INT NOT NULL,
    `content_type` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `field` VARCHAR(255) NULL,
    `attachment_id` VARCHAR(255) NULL,
    `attachment_type` VARCHAR(255) NULL,
    `is_public` TINYINT NOT NULL,
    `sort_order` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `system_files` ADD INDEX `system_files_field_index`(`field`);
ALTER TABLE
    `system_files` ADD INDEX `system_files_attachment_id_index`(`attachment_id`);
ALTER TABLE
    `system_files` ADD INDEX `system_files_attachment_type_index`(`attachment_type`);
CREATE TABLE `system_mail_layouts`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `code` VARCHAR(255) NULL,
    `content_html` TEXT NULL,
    `content_text` TEXT NULL,
    `content_css` TEXT NULL,
    `is_locked` TINYINT NOT NULL,
    `options` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `system_mail_partials`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `code` VARCHAR(255) NULL,
    `content_html` TEXT NULL,
    `content_text` TEXT NULL,
    `is_custom` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `system_mail_templates`(
    `id` INT NOT NULL,
    `code` VARCHAR(255) NULL,
    `subject` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `content_html` TEXT NULL,
    `content_text` TEXT NULL,
    `layout_id` INT NULL,
    `is_custom` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `system_mail_templates` ADD INDEX `system_mail_templates_layout_id_index`(`layout_id`);
CREATE TABLE `system_parameters`(
    `id` INT NOT NULL,
    `namespace` VARCHAR(255) NOT NULL,
    `group` VARCHAR(255) NOT NULL,
    `item` VARCHAR(255) NOT NULL,
    `value` TEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `system_parameters` ADD INDEX `system_parameters_namespace_group_item_index`(`namespace`, `group`, `item`);
CREATE TABLE `system_plugin_history`(
    `id` INT NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `version` VARCHAR(255) NOT NULL,
    `detail` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `system_plugin_history` ADD INDEX `system_plugin_history_code_index`(`code`);
ALTER TABLE
    `system_plugin_history` ADD INDEX `system_plugin_history_type_index`(`type`);
CREATE TABLE `system_plugin_versions`(
    `id` INT NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `version` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `is_disabled` TINYINT NOT NULL,
    `is_frozen` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `system_plugin_versions` ADD INDEX `system_plugin_versions_code_index`(`code`);
CREATE TABLE `system_request_logs`(
    `id` INT NOT NULL,
    `status_code` INT NULL,
    `url` VARCHAR(255) NULL,
    `referer` TEXT NULL,
    `count` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `system_revisions`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `field` VARCHAR(255) NULL,
    `cast` VARCHAR(255) NULL,
    `old_value` TEXT NULL,
    `new_value` TEXT NULL,
    `revisionable_type` VARCHAR(255) NOT NULL,
    `revisionable_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `system_revisions` ADD INDEX `system_revisions_revisionable_type_revisionable_id_index`(
        `revisionable_type`,
        `revisionable_id`
    );
ALTER TABLE
    `system_revisions` ADD INDEX `system_revisions_user_id_index`(`user_id`);
ALTER TABLE
    `system_revisions` ADD INDEX `system_revisions_field_index`(`field`);
CREATE TABLE `system_settings`(
    `id` INT NOT NULL,
    `item` VARCHAR(255) NULL,
    `value` MEDIUMTEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `system_settings` ADD INDEX `system_settings_item_index`(`item`);
ALTER TABLE
    `backend_user_throttle` ADD CONSTRAINT `backend_user_throttle_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `backend_users`(`id`);
ALTER TABLE
    `backend_users` ADD CONSTRAINT `backend_users_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `backend_user_roles`(`id`);
ALTER TABLE
    `backend_users_groups` ADD CONSTRAINT `backend_users_groups_user_group_id_foreign` FOREIGN KEY(`user_group_id`) REFERENCES `backend_user_groups`(`id`);
ALTER TABLE
    `cms_theme_logs` ADD CONSTRAINT `cms_theme_logs_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `backend_users`(`id`);
ALTER TABLE
    `backend_user_preferences` ADD CONSTRAINT `backend_user_preferences_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `backend_users`(`id`);
ALTER TABLE
    `system_revisions` ADD CONSTRAINT `system_revisions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `backend_users`(`id`);
ALTER TABLE
    `backend_users_groups` ADD CONSTRAINT `backend_users_groups_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `backend_users`(`id`);
ALTER TABLE
    `system_mail_templates` ADD CONSTRAINT `system_mail_templates_layout_id_foreign` FOREIGN KEY(`layout_id`) REFERENCES `system_mail_layouts`(`id`);
ALTER TABLE
    `backend_access_log` ADD CONSTRAINT `backend_access_log_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `backend_users`(`id`);
ALTER TABLE
    `sessions` ADD CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `backend_users`(`id`);