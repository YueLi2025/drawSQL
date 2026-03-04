CREATE TABLE `auth_group`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_group` ADD UNIQUE `auth_group_name_unique`(`name`);
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
CREATE TABLE `django_content_type`(
    `id` INT NOT NULL,
    `app_label` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `django_content_type` ADD UNIQUE `django_content_type_app_label_model_unique`(`app_label`, `model`);
CREATE TABLE `filer_clipboard`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `filer_clipboard` ADD INDEX `filer_clipboard_user_id_index`(`user_id`);
CREATE TABLE `filer_clipboarditem`(
    `id` INT NOT NULL,
    `clipboard_id` INT NOT NULL,
    `file_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `filer_clipboarditem` ADD INDEX `filer_clipboarditem_clipboard_id_index`(`clipboard_id`);
ALTER TABLE
    `filer_clipboarditem` ADD INDEX `filer_clipboarditem_file_id_index`(`file_id`);
CREATE TABLE `filer_file`(
    `id` INT NOT NULL,
    `file` VARCHAR(255) NULL,
    `_file_size` BIGINT NULL,
    `sha1` VARCHAR(255) NOT NULL,
    `has_all_mandatory_data` TINYINT NOT NULL,
    `original_filename` VARCHAR(255) NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` LONGTEXT NULL,
    `uploaded_at` DATETIME NOT NULL,
    `modified_at` DATETIME NOT NULL,
    `is_public` TINYINT NOT NULL,
    `folder_id` INT NULL,
    `owner_id` INT NULL,
    `polymorphic_ctype_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `filer_file` ADD INDEX `filer_file_folder_id_index`(`folder_id`);
ALTER TABLE
    `filer_file` ADD INDEX `filer_file_owner_id_index`(`owner_id`);
ALTER TABLE
    `filer_file` ADD INDEX `filer_file_polymorphic_ctype_id_index`(`polymorphic_ctype_id`);
CREATE TABLE `filer_folder`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `uploaded_at` DATETIME NOT NULL,
    `created_at` DATETIME NOT NULL,
    `modified_at` DATETIME NOT NULL,
    `lft` INT NOT NULL,
    `rght` INT NOT NULL,
    `tree_id` INT NOT NULL,
    `level` INT NOT NULL,
    `owner_id` INT NULL,
    `parent_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `filer_folder` ADD UNIQUE `filer_folder_name_parent_id_unique`(`name`, `parent_id`);
ALTER TABLE
    `filer_folder` ADD INDEX `filer_folder_lft_tree_id_index`(`lft`, `tree_id`);
ALTER TABLE
    `filer_folder` ADD INDEX `filer_folder_tree_id_index`(`tree_id`);
ALTER TABLE
    `filer_folder` ADD INDEX `filer_folder_owner_id_index`(`owner_id`);
CREATE TABLE `filer_folderpermission`(
    `id` INT NOT NULL,
    `type` SMALLINT NOT NULL,
    `everybody` TINYINT NOT NULL,
    `can_edit` SMALLINT NULL,
    `can_read` SMALLINT NULL,
    `can_add_children` SMALLINT NULL,
    `folder_id` INT NULL,
    `user_id` INT NULL,
    `group_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `filer_folderpermission` ADD INDEX `filer_folderpermission_folder_id_index`(`folder_id`);
ALTER TABLE
    `filer_folderpermission` ADD INDEX `filer_folderpermission_user_id_index`(`user_id`);
ALTER TABLE
    `filer_folderpermission` ADD INDEX `filer_folderpermission_group_id_index`(`group_id`);
CREATE TABLE `filer_image`(
    `file_ptr_id` INT NOT NULL,
    `_height` INT NULL,
    `_width` INT NULL,
    `date_taken` DATETIME NULL,
    `default_alt_text` VARCHAR(255) NULL,
    `default_caption` VARCHAR(255) NULL,
    `author` VARCHAR(255) NULL,
    `must_always_publish_author_credit` TINYINT NOT NULL,
    `must_always_publish_copyright` TINYINT NOT NULL,
    `subject_location` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`file_ptr_id`)
);
CREATE TABLE `filer_thumbnailoption`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `width` INT NOT NULL,
    `height` INT NOT NULL,
    `crop` TINYINT NOT NULL,
    `upscale` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `filer_folder` ADD CONSTRAINT `filer_folder_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `filer_file` ADD CONSTRAINT `filer_file_polymorphic_ctype_id_foreign` FOREIGN KEY(`polymorphic_ctype_id`) REFERENCES `django_content_type`(`id`);
ALTER TABLE
    `filer_clipboard` ADD CONSTRAINT `filer_clipboard_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `filer_folderpermission` ADD CONSTRAINT `filer_folderpermission_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `filer_file` ADD CONSTRAINT `filer_file_folder_id_foreign` FOREIGN KEY(`folder_id`) REFERENCES `filer_folder`(`id`);
ALTER TABLE
    `filer_file` ADD CONSTRAINT `filer_file_id_foreign` FOREIGN KEY(`id`) REFERENCES `filer_image`(`file_ptr_id`);
ALTER TABLE
    `filer_folderpermission` ADD CONSTRAINT `filer_folderpermission_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`);
ALTER TABLE
    `filer_file` ADD CONSTRAINT `filer_file_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `filer_clipboarditem` ADD CONSTRAINT `filer_clipboarditem_file_id_foreign` FOREIGN KEY(`file_id`) REFERENCES `filer_file`(`id`);
ALTER TABLE
    `filer_folder` ADD CONSTRAINT `filer_folder_parent_id_foreign` FOREIGN KEY(`parent_id`) REFERENCES `filer_folder`(`id`);
ALTER TABLE
    `filer_clipboarditem` ADD CONSTRAINT `filer_clipboarditem_clipboard_id_foreign` FOREIGN KEY(`clipboard_id`) REFERENCES `filer_clipboard`(`id`);
ALTER TABLE
    `filer_folderpermission` ADD CONSTRAINT `filer_folderpermission_folder_id_foreign` FOREIGN KEY(`folder_id`) REFERENCES `filer_folder`(`id`);