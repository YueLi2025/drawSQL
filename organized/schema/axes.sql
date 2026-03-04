CREATE TABLE `axes_accessattempt`(
    `id` INT NOT NULL,
    `user_agent` VARCHAR(255) NOT NULL,
    `ip_address` CHAR(255) NULL,
    `username` VARCHAR(255) NULL,
    `http_accept` VARCHAR(255) NOT NULL,
    `path_info` VARCHAR(255) NOT NULL,
    `attempt_time` DATETIME NOT NULL,
    `get_data` LONGTEXT NOT NULL,
    `post_data` LONGTEXT NOT NULL,
    `failures_since_start` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `axes_accessattempt` ADD INDEX `axes_accessattempt_user_agent_index`(`user_agent`);
ALTER TABLE
    `axes_accessattempt` ADD INDEX `axes_accessattempt_ip_address_index`(`ip_address`);
ALTER TABLE
    `axes_accessattempt` ADD INDEX `axes_accessattempt_username_index`(`username`);
CREATE TABLE `axes_accesslog`(
    `id` INT NOT NULL,
    `user_agent` VARCHAR(255) NOT NULL,
    `ip_address` CHAR(255) NULL,
    `username` VARCHAR(255) NULL,
    `http_accept` VARCHAR(255) NOT NULL,
    `path_info` VARCHAR(255) NOT NULL,
    `attempt_time` DATETIME NOT NULL,
    `logout_time` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `axes_accesslog` ADD INDEX `axes_accesslog_user_agent_index`(`user_agent`);
ALTER TABLE
    `axes_accesslog` ADD INDEX `axes_accesslog_ip_address_index`(`ip_address`);
ALTER TABLE
    `axes_accesslog` ADD INDEX `axes_accesslog_username_index`(`username`);