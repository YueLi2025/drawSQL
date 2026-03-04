CREATE TABLE `users`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `is_admin` BOOLEAN NOT NULL,
    `preferences` TEXT NULL,
    `remember_token` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL
);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_email_index`(`email`);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_token_index`(`token`);
CREATE TABLE `artists`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `albums`(
    `id` INT NOT NULL,
    `artist_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `cover` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `albums` ADD INDEX `albums_name_index`(`name`);
CREATE TABLE `songs`(
    `id` VARCHAR(36) NOT NULL COMMENT 'UUID column',
    `album_id` INT NOT NULL,
    `artist_id` INT NULL,
    `title` VARCHAR(255) NOT NULL,
    `length` FLOAT(53) NOT NULL,
    `track` INT NULL,
    `disc` INT NOT NULL,
    `lyrics` TEXT NOT NULL,
    `path` TEXT NOT NULL,
    `mtime` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `songs` ADD INDEX `songs_track_disc_index`(`track`, `disc`);
ALTER TABLE
    `songs` ADD INDEX `songs_title_index`(`title`);
CREATE TABLE `playlists`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `rules` TEXT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `folder_id` VARCHAR(36) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `interactions`(
    `id` BIGINT NOT NULL,
    `user_id` INT NOT NULL,
    `song_id` VARCHAR(36) NOT NULL,
    `liked` BOOLEAN NOT NULL,
    `play_count` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `playlist_song`(
    `id` INT NOT NULL,
    `playlist_id` INT NOT NULL,
    `song_id` VARCHAR(36) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `settings`(
    `key` VARCHAR(255) NOT NULL,
    `value` TEXT NOT NULL,
    PRIMARY KEY(`key`)
);
CREATE TABLE `personal_access_tokens`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tokenable_id` BIGINT UNSIGNED NOT NULL,
    `tokenable_type` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `token` VARCHAR(64) NOT NULL,
    `abilities` TEXT NULL,
    `last_used_at` DATETIME NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `personal_access_tokens` ADD UNIQUE `personal_access_tokens_token_unique`(`token`);
CREATE TABLE `playlist_folders`(
    `id` VARCHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `songs` ADD CONSTRAINT `songs_artist_id_foreign` FOREIGN KEY(`artist_id`) REFERENCES `artists`(`id`);
ALTER TABLE
    `albums` ADD CONSTRAINT `albums_artist_id_foreign` FOREIGN KEY(`artist_id`) REFERENCES `artists`(`id`);
ALTER TABLE
    `songs` ADD CONSTRAINT `songs_album_id_foreign` FOREIGN KEY(`album_id`) REFERENCES `albums`(`id`);
ALTER TABLE
    `playlists` ADD CONSTRAINT `playlists_folder_id_foreign` FOREIGN KEY(`folder_id`) REFERENCES `playlist_folders`(`id`);
ALTER TABLE
    `playlist_song` ADD CONSTRAINT `playlist_song_playlist_id_foreign` FOREIGN KEY(`playlist_id`) REFERENCES `playlists`(`id`);
ALTER TABLE
    `interactions` ADD CONSTRAINT `interactions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `playlists` ADD CONSTRAINT `playlists_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `playlist_folders` ADD CONSTRAINT `playlist_folders_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `interactions` ADD CONSTRAINT `interactions_song_id_foreign` FOREIGN KEY(`song_id`) REFERENCES `songs`(`id`);
ALTER TABLE
    `playlist_song` ADD CONSTRAINT `playlist_song_song_id_foreign` FOREIGN KEY(`song_id`) REFERENCES `songs`(`id`);