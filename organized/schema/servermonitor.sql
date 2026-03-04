CREATE TABLE `checks`(
    `id` INT NOT NULL,
    `host_id` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NULL,
    `enabled` BOOLEAN NOT NULL,
    `last_run_message` TEXT NULL,
    `last_run_output` JSON NULL,
    `last_ran_at` TIME NULL,
    `next_run_in_minutes` INT NULL,
    `started_throttling_failing_notifications_at` TIMESTAMP NULL,
    `custom_properties` JSON NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `hosts`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `ssh_user` VARCHAR(255) NULL,
    `port` INT NULL,
    `ip` VARCHAR(255) NULL,
    `custom_properties` JSON NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `checks` ADD CONSTRAINT `checks_host_id_foreign` FOREIGN KEY(`host_id`) REFERENCES `hosts`(`id`);