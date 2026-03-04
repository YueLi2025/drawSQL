CREATE TABLE `tags`(
    `id` INT NOT NULL,
    `name` JSON NOT NULL,
    `slug` JSON NOT NULL,
    `type` VARCHAR(255) NULL,
    `order_column` INT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `taggables`(
    `tag_id` INT NOT NULL,
    `taggable_id` INT NOT NULL,
    `taggable_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`tag_id`)
);
ALTER TABLE
    `taggables` ADD UNIQUE `taggables_tag_id_taggable_id_taggable_type_unique`(
        `tag_id`,
        `taggable_id`,
        `taggable_type`
    );
ALTER TABLE
    `taggables` ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`);