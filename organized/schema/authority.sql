CREATE TABLE `authority_permission`(
    `id` INT NOT NULL,
    `codename` VARCHAR(255) NOT NULL,
    `object_id` INT NOT NULL,
    `approved` BOOLEAN NOT NULL,
    `date_requested` DATETIME NOT NULL,
    `date_approved` DATETIME NULL,
    `content_type_id` INT NOT NULL,
    `creator_id` INT NULL,
    `group_id` INT NULL,
    `user_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `authority_permission` ADD UNIQUE `codename_object_id_content_type_id_user_id_group_id_unique`(
        `codename`,
        `object_id`,
        `content_type_id`,
        `user_id`,
        `group_id`
    );
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
CREATE TABLE `auth_group`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_group` ADD UNIQUE `auth_group_name_unique`(`name`);
CREATE TABLE `django_content_type`(
    `id` INT NOT NULL,
    `app_label` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `django_content_type` ADD INDEX `django_content_type_app_label_model_index`(`app_label`, `model`);
ALTER TABLE
    `authority_permission` ADD CONSTRAINT `authority_permission_content_type_id_foreign` FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`);
ALTER TABLE
    `authority_permission` ADD CONSTRAINT `authority_permission_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`);
ALTER TABLE
    `authority_permission` ADD CONSTRAINT `authority_permission_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `authority_permission` ADD CONSTRAINT `authority_permission_creator_id_foreign` FOREIGN KEY(`creator_id`) REFERENCES `auth_user`(`id`);