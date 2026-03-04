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
CREATE TABLE `user_sessions_session`(
    `session_key` VARCHAR(255) NOT NULL,
    `session_data` LONGTEXT NOT NULL,
    `expire_date` DATETIME NOT NULL,
    `user_agent` VARCHAR(255) NULL,
    `last_activity` DATETIME NOT NULL,
    `ip` CHAR(255) NULL,
    `user_id` INT NULL,
    PRIMARY KEY(`session_key`)
);
ALTER TABLE
    `user_sessions_session` ADD INDEX `user_sessions_session_expire_date_index`(`expire_date`);
ALTER TABLE
    `user_sessions_session` ADD INDEX `user_sessions_session_user_id_index`(`user_id`);
ALTER TABLE
    `user_sessions_session` ADD CONSTRAINT `user_sessions_session_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);