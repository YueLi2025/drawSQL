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
CREATE TABLE `push_notifications_apnsdevice`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `active` TINYINT NOT NULL,
    `date_created` DATETIME NULL,
    `device_id` CHAR(255) NULL,
    `registration_id` VARCHAR(255) NOT NULL,
    `user_id` INT NULL,
    `application_id` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `push_notifications_apnsdevice` ADD INDEX `push_notifications_apnsdevice_device_id_index`(`device_id`);
ALTER TABLE
    `push_notifications_apnsdevice` ADD INDEX `push_notifications_apnsdevice_user_id_index`(`user_id`);
CREATE TABLE `push_notifications_gcmdevice`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `active` TINYINT NOT NULL,
    `date_created` DATETIME NULL,
    `device_id` BIGINT NULL,
    `registration_id` LONGTEXT NOT NULL,
    `user_id` INT NULL,
    `cloud_message_type` VARCHAR(255) NOT NULL,
    `application_id` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `push_notifications_gcmdevice` ADD INDEX `push_notifications_gcmdevice_device_id_index`(`device_id`);
ALTER TABLE
    `push_notifications_gcmdevice` ADD INDEX `push_notifications_gcmdevice_user_id_index`(`user_id`);
CREATE TABLE `push_notifications_webpushdevice`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `active` TINYINT NOT NULL,
    `date_created` DATETIME NULL,
    `application_id` VARCHAR(255) NULL,
    `registration_id` LONGTEXT NOT NULL,
    `p256dh` VARCHAR(255) NOT NULL,
    `auth` VARCHAR(255) NOT NULL,
    `browser` VARCHAR(255) NOT NULL,
    `user_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `push_notifications_webpushdevice` ADD INDEX `push_notifications_webpushdevice_user_id_index`(`user_id`);
CREATE TABLE `push_notifications_wnsdevice`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `active` TINYINT NOT NULL,
    `date_created` DATETIME NULL,
    `device_id` CHAR(255) NULL,
    `registration_id` LONGTEXT NOT NULL,
    `user_id` INT NULL,
    `application_id` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `push_notifications_wnsdevice` ADD INDEX `push_notifications_wnsdevice_device_id_index`(`device_id`);
ALTER TABLE
    `push_notifications_wnsdevice` ADD INDEX `push_notifications_wnsdevice_user_id_index`(`user_id`);
ALTER TABLE
    `push_notifications_gcmdevice` ADD CONSTRAINT `push_notifications_gcmdevice_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `push_notifications_wnsdevice` ADD CONSTRAINT `push_notifications_wnsdevice_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `push_notifications_apnsdevice` ADD CONSTRAINT `push_notifications_apnsdevice_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `push_notifications_webpushdevice` ADD CONSTRAINT `push_notifications_webpushdevice_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);