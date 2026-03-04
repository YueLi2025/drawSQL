CREATE TABLE `users`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `email_verified_at` DATETIME NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
CREATE TABLE `failed_jobs`(
    `id` INT NOT NULL,
    `connection` TEXT NOT NULL,
    `queue` TEXT NOT NULL,
    `payload` LONGTEXT NOT NULL,
    `exception` LONGTEXT NOT NULL,
    `failed_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `migrations`(
    `id` INT NOT NULL,
    `migration` VARCHAR(255) NOT NULL,
    `batch` INT NOT NULL,
    PRIMARY KEY(`id`)
);