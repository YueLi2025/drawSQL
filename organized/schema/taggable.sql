CREATE TABLE `tags`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` INT NOT NULL,
    `updated_at` INT NOT NULL,
    `taggings_count` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tags` ADD UNIQUE `tags_name_unique`(`name`);
CREATE TABLE `(tagger)`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `taggings`(
    `id` INT NOT NULL,
    `taggable_id` INT NOT NULL,
    `taggable_type` INT NOT NULL,
    `tag_id` INT NOT NULL,
    `context` VARCHAR(255) NOT NULL,
    `tagger_id` INT NOT NULL,
    `tagger_type` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `taggings` ADD UNIQUE `unique_93be0be8a3289ee031bb6d26a6b3c8ce`(
        `tag_id`,
        `taggable_id`,
        `taggable_type`,
        `context`,
        `tagger_id`,
        `tagger_type`
    );
ALTER TABLE
    `taggings` ADD INDEX `taggings_taggable_id_taggable_type_context_index`(
        `taggable_id`,
        `taggable_type`,
        `context`
    );
ALTER TABLE
    `taggings` ADD INDEX `taggings_tagger_id_tagger_type_index`(`tagger_id`, `tagger_type`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_taggable_id_taggable_type_tagger_id_context_index`(
        `taggable_id`,
        `taggable_type`,
        `tagger_id`,
        `context`
    );
ALTER TABLE
    `taggings` ADD INDEX `taggings_taggable_id_index`(`taggable_id`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_taggable_type_index`(`taggable_type`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_tag_id_index`(`tag_id`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_context_index`(`context`);
ALTER TABLE
    `taggings` ADD INDEX `taggings_tagger_id_index`(`tagger_id`);
ALTER TABLE
    `taggings` ADD CONSTRAINT `taggings_tagger_id_foreign` FOREIGN KEY(`tagger_id`) REFERENCES `(tagger)`(`id`);
ALTER TABLE
    `taggings` ADD CONSTRAINT `taggings_taggable_id_foreign` FOREIGN KEY(`taggable_id`) REFERENCES `tags`(`id`);