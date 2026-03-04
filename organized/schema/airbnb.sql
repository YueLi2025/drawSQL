CREATE TABLE `users`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `email_verified_at` DATETIME NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `phone_number` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `profile_image` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
CREATE TABLE `rooms`(
    `id` INT NOT NULL,
    `home_type` VARCHAR(255) NOT NULL,
    `room_type` VARCHAR(255) NOT NULL,
    `total_occupancy` INT NOT NULL,
    `total_bedrooms` INT NOT NULL,
    `total_bathrooms` INT NOT NULL,
    `summary` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `has_tv` BOOLEAN NOT NULL,
    `has_kitchen` BOOLEAN NOT NULL,
    `has_air_con` BOOLEAN NOT NULL,
    `has_heating` BOOLEAN NOT NULL,
    `has_internet` BOOLEAN NOT NULL,
    `price` INT NOT NULL,
    `published_at` DATETIME NOT NULL,
    `owner_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `latitude` FLOAT(53) NOT NULL,
    `longitude` FLOAT(53) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `reservations`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `room_id` INT NOT NULL,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME NOT NULL,
    `price` INT NOT NULL,
    `total` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `media`(
    `id` INT NOT NULL,
    `model_id` INT NOT NULL,
    `model_type` VARCHAR(255) NOT NULL,
    `file_name` VARCHAR(255) NOT NULL,
    `mime_type` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `reviews`(
    `id` INT NOT NULL,
    `reservation_id` INT NOT NULL,
    `rating` INT NOT NULL,
    `comment` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `media` ADD CONSTRAINT `media_model_id_foreign` FOREIGN KEY(`model_id`) REFERENCES `reviews`(`id`);
ALTER TABLE
    `reservations` ADD CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `reviews` ADD CONSTRAINT `reviews_reservation_id_foreign` FOREIGN KEY(`reservation_id`) REFERENCES `reservations`(`id`);
ALTER TABLE
    `rooms` ADD CONSTRAINT `rooms_published_at_foreign` FOREIGN KEY(`published_at`) REFERENCES `users`(`id`);
ALTER TABLE
    `media` ADD CONSTRAINT `media_model_id_foreign` FOREIGN KEY(`model_id`) REFERENCES `rooms`(`id`);
ALTER TABLE
    `reservations` ADD CONSTRAINT `reservations_room_id_foreign` FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`);