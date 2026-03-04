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
CREATE TABLE `two_factor_phonedevice`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `confirmed` TINYINT NOT NULL,
    `number` VARCHAR(255) NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `method` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `two_factor_phonedevice` ADD INDEX `two_factor_phonedevice_user_id_index`(`user_id`);
ALTER TABLE
    `two_factor_phonedevice` ADD CONSTRAINT `two_factor_phonedevice_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);