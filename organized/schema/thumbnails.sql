CREATE TABLE `easy_thumbnails_source`(
    `id` INT NOT NULL,
    `storage_hash` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `modified` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `easy_thumbnails_source` ADD UNIQUE `easy_thumbnails_source_storage_hash_name_unique`(`storage_hash`, `name`);
ALTER TABLE
    `easy_thumbnails_source` ADD INDEX `easy_thumbnails_source_storage_hash_index`(`storage_hash`);
ALTER TABLE
    `easy_thumbnails_source` ADD INDEX `easy_thumbnails_source_name_index`(`name`);
CREATE TABLE `easy_thumbnails_thumbnail`(
    `id` INT NOT NULL,
    `storage_hash` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `modified` DATETIME NOT NULL,
    `source_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `easy_thumbnails_thumbnail` ADD UNIQUE `easy_thumbnails_thumbnail_storage_hash_name_source_id_unique`(`storage_hash`, `name`, `source_id`);
ALTER TABLE
    `easy_thumbnails_thumbnail` ADD INDEX `easy_thumbnails_thumbnail_storage_hash_index`(`storage_hash`);
ALTER TABLE
    `easy_thumbnails_thumbnail` ADD INDEX `easy_thumbnails_thumbnail_name_index`(`name`);
ALTER TABLE
    `easy_thumbnails_thumbnail` ADD INDEX `easy_thumbnails_thumbnail_source_id_index`(`source_id`);
CREATE TABLE `easy_thumbnails_thumbnaildimensions`(
    `id` INT NOT NULL,
    `thumbnail_id` INT NOT NULL,
    `width` INT NULL,
    `height` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `easy_thumbnails_thumbnaildimensions` ADD UNIQUE `easy_thumbnails_thumbnaildimensions_thumbnail_id_unique`(`thumbnail_id`);
ALTER TABLE
    `easy_thumbnails_thumbnail` ADD CONSTRAINT `easy_thumbnails_thumbnail_source_id_foreign` FOREIGN KEY(`source_id`) REFERENCES `easy_thumbnails_source`(`id`);
ALTER TABLE
    `easy_thumbnails_thumbnaildimensions` ADD CONSTRAINT `easy_thumbnails_thumbnaildimensions_thumbnail_id_foreign` FOREIGN KEY(`thumbnail_id`) REFERENCES `easy_thumbnails_thumbnail`(`id`);