CREATE TABLE `activity_log`(
    `id` INT NOT NULL,
    `log_name` VARCHAR(255) NULL,
    `description` TEXT NOT NULL,
    `subject_id` BIGINT NULL,
    `subject_type` VARCHAR(255) NULL,
    `causer_id` BIGINT NULL,
    `causer_type` VARCHAR(255) NULL,
    `properties` JSON NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `activity_log` ADD INDEX `activity_log_log_name_index`(`log_name`);
ALTER TABLE
    `activity_log` ADD INDEX `activity_log_subject_id_subject_type_index`(`subject_id`, `subject_type`);
ALTER TABLE
    `activity_log` ADD INDEX `activity_log_causer_id_causer_type_index`(`causer_id`, `causer_type`);