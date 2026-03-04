CREATE TABLE `taggit_tag`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `taggit_tag` ADD UNIQUE `taggit_tag_name_unique`(`name`);
ALTER TABLE
    `taggit_tag` ADD UNIQUE `taggit_tag_slug_unique`(`slug`);
CREATE TABLE `taggit_taggeditem`(
    `id` INT NOT NULL,
    `object_id` INT NOT NULL,
    `content_type_id` INT NOT NULL,
    `tag_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `taggit_taggeditem` ADD INDEX `taggit_taggeditem_object_id_index`(`object_id`);
ALTER TABLE
    `taggit_taggeditem` ADD INDEX `taggit_taggeditem_tag_id_index`(`tag_id`);
ALTER TABLE
    `taggit_taggeditem` ADD CONSTRAINT `taggit_taggeditem_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `taggit_tag`(`id`);