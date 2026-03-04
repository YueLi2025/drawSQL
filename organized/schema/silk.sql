CREATE TABLE `silk_profile`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `start_time` DATETIME NOT NULL,
    `end_time` DATETIME NULL,
    `time_taken` DOUBLE NULL,
    `file_path` VARCHAR(255) NOT NULL,
    `line_num` INT NULL,
    `end_line_num` INT NULL,
    `func_name` VARCHAR(255) NOT NULL,
    `exception_raised` TINYINT NOT NULL,
    `dynamic` TINYINT NOT NULL,
    `request_id` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `silk_profile` ADD INDEX `silk_profile_request_id_index`(`request_id`);
CREATE TABLE `silk_profile_queries`(
    `id` INT NOT NULL,
    `profile_id` INT NOT NULL,
    `sqlquery_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `silk_profile_queries` ADD UNIQUE `silk_profile_queries_profile_id_sqlquery_id_unique`(`profile_id`, `sqlquery_id`);
ALTER TABLE
    `silk_profile_queries` ADD INDEX `silk_profile_queries_sqlquery_id_index`(`sqlquery_id`);
CREATE TABLE `silk_request`(
    `id` VARCHAR(255) NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `query_params` LONGTEXT NOT NULL,
    `raw_body` LONGTEXT NOT NULL,
    `body` LONGTEXT NOT NULL,
    `method` VARCHAR(255) NOT NULL,
    `start_time` DATETIME NOT NULL,
    `view_name` VARCHAR(255) NULL,
    `end_time` DATETIME NULL,
    `time_taken` DOUBLE NULL,
    `encoded_headers` LONGTEXT NOT NULL,
    `meta_time` DOUBLE NULL,
    `meta_num_queries` INT NULL,
    `meta_time_spent_queries` DOUBLE NULL,
    `pyprofile` LONGTEXT NOT NULL,
    `num_sql_queries` INT NOT NULL,
    `prof_file` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `silk_request` ADD INDEX `silk_request_path_index`(`path`);
ALTER TABLE
    `silk_request` ADD INDEX `silk_request_start_time_index`(`start_time`);
ALTER TABLE
    `silk_request` ADD INDEX `silk_request_view_name_index`(`view_name`);
CREATE TABLE `silk_response`(
    `id` VARCHAR(255) NOT NULL,
    `status_code` INT NOT NULL,
    `raw_body` LONGTEXT NOT NULL,
    `body` LONGTEXT NOT NULL,
    `encoded_headers` LONGTEXT NOT NULL,
    `request_id` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `silk_response` ADD UNIQUE `silk_response_request_id_unique`(`request_id`);
CREATE TABLE `silk_sqlquery`(
    `id` INT NOT NULL,
    `query` LONGTEXT NOT NULL,
    `start_time` DATETIME NULL,
    `end_time` DATETIME NULL,
    `time_taken` DOUBLE NULL,
    `traceback` LONGTEXT NOT NULL,
    `request_id` VARCHAR(255) NULL,
    `identifier` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `silk_sqlquery` ADD INDEX `silk_sqlquery_request_id_index`(`request_id`);
ALTER TABLE
    `silk_response` ADD CONSTRAINT `silk_response_request_id_foreign` FOREIGN KEY(`request_id`) REFERENCES `silk_request`(`id`);
ALTER TABLE
    `silk_profile_queries` ADD CONSTRAINT `silk_profile_queries_profile_id_foreign` FOREIGN KEY(`profile_id`) REFERENCES `silk_profile`(`id`);
ALTER TABLE
    `silk_profile_queries` ADD CONSTRAINT `silk_profile_queries_sqlquery_id_foreign` FOREIGN KEY(`sqlquery_id`) REFERENCES `silk_sqlquery`(`id`);
ALTER TABLE
    `silk_profile` ADD CONSTRAINT `silk_profile_request_id_foreign` FOREIGN KEY(`request_id`) REFERENCES `silk_request`(`id`);
ALTER TABLE
    `silk_sqlquery` ADD CONSTRAINT `silk_sqlquery_request_id_foreign` FOREIGN KEY(`request_id`) REFERENCES `silk_request`(`id`);