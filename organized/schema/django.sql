CREATE TABLE `auth_group`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_group` ADD UNIQUE `auth_group_name_unique`(`name`);
CREATE TABLE `auth_group_permissions`(
    `id` INT NOT NULL,
    `group_id` INT NOT NULL,
    `permission_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_group_permissions` ADD UNIQUE `auth_group_permissions_group_id_permission_id_unique`(`group_id`, `permission_id`);
ALTER TABLE
    `auth_group_permissions` ADD INDEX `auth_group_permissions_permission_id_index`(`permission_id`);
CREATE TABLE `auth_permission`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `content_type_id` INT NOT NULL,
    `codename` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_permission` ADD UNIQUE `auth_permission_content_type_id_codename_unique`(`content_type_id`, `codename`);
CREATE TABLE `auth_user`(
    `id` INT NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `last_login` DATETIME NULL,
    `is_superuser` TINYINT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `is_staff` TINYINT NOT NULL,
    `is_active` TINYINT NOT NULL,
    `date_joined` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_user` ADD UNIQUE `auth_user_username_unique`(`username`);
CREATE TABLE `auth_user_groups`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `group_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_user_groups` ADD UNIQUE `auth_user_groups_user_id_group_id_unique`(`user_id`, `group_id`);
ALTER TABLE
    `auth_user_groups` ADD INDEX `auth_user_groups_group_id_index`(`group_id`);
CREATE TABLE `auth_user_user_permissions`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `permission_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_user_user_permissions` ADD UNIQUE `auth_user_user_permissions_user_id_permission_id_unique`(`user_id`, `permission_id`);
ALTER TABLE
    `auth_user_user_permissions` ADD INDEX `auth_user_user_permissions_permission_id_index`(`permission_id`);
CREATE TABLE `django_admin_log`(
    `id` INT NOT NULL,
    `action_time` DATETIME NOT NULL,
    `object_id` LONGTEXT NULL,
    `object_repr` VARCHAR(255) NOT NULL,
    `action_flag` SMALLINT NOT NULL,
    `change_message` LONGTEXT NOT NULL,
    `user_id` INT NOT NULL,
    `content_type_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `django_admin_log` ADD INDEX `django_admin_log_user_id_index`(`user_id`);
ALTER TABLE
    `django_admin_log` ADD INDEX `django_admin_log_content_type_id_index`(`content_type_id`);
CREATE TABLE `django_content_type`(
    `id` INT NOT NULL,
    `app_label` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `django_content_type` ADD UNIQUE `django_content_type_app_label_model_unique`(`app_label`, `model`);
CREATE TABLE `django_migrations`(
    `id` INT NOT NULL,
    `app` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `applied` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `django_session`(
    `session_key` VARCHAR(255) NOT NULL,
    `session_data` LONGTEXT NOT NULL,
    `expire_date` DATETIME NOT NULL,
    PRIMARY KEY(`session_key`)
);
ALTER TABLE
    `django_session` ADD INDEX `django_session_expire_date_index`(`expire_date`);
ALTER TABLE
    `auth_group_permissions` ADD CONSTRAINT `auth_group_permissions_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`);
ALTER TABLE
    `django_admin_log` ADD CONSTRAINT `django_admin_log_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `auth_user_user_permissions` ADD CONSTRAINT `auth_user_user_permissions_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`);
ALTER TABLE
    `auth_permission` ADD CONSTRAINT `auth_permission_content_type_id_foreign` FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`);
ALTER TABLE
    `auth_user_groups` ADD CONSTRAINT `auth_user_groups_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `auth_user_groups` ADD CONSTRAINT `auth_user_groups_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`);
ALTER TABLE
    `django_admin_log` ADD CONSTRAINT `django_admin_log_content_type_id_foreign` FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`);
ALTER TABLE
    `auth_group_permissions` ADD CONSTRAINT `auth_group_permissions_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`);
ALTER TABLE
    `auth_user_user_permissions` ADD CONSTRAINT `auth_user_user_permissions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);