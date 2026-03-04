CREATE TABLE `larametrics_logs`(
    `id` INT NOT NULL,
    `level` VARCHAR(255) NOT NULL,
    `message` TEXT NOT NULL,
    `user_id` INT NULL,
    `email` VARCHAR(255) NULL,
    `trace` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `larametrics_models`(
    `id` INT NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `model_id` INT NOT NULL,
    `user_id` INT NULL,
    `method` VARCHAR(255) NOT NULL,
    `original` TEXT NULL,
    `changes` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `larametrics_notifications`(
    `id` INT NOT NULL,
    `action` VARCHAR(255) NOT NULL,
    `filter` VARCHAR(255) NULL,
    `meta` TEXT NULL,
    `notify_by` VARCHAR(255) NOT NULL,
    `last_fired_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `larametrics_requests`(
    `id` INT NOT NULL,
    `method` VARCHAR(255) NOT NULL,
    `uri` TEXT NOT NULL,
    `ip` VARCHAR(255) NULL,
    `headers` TEXT NULL,
    `start_time` DOUBLE NULL,
    `end_time` DOUBLE NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `larametrics_models` ADD CONSTRAINT `larametrics_models_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `larametrics_logs` ADD CONSTRAINT `larametrics_logs_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);