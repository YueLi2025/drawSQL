CREATE TABLE `auth_user`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `django_content_type`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `reversion_revision`(
    `id` INT NOT NULL,
    `date_created` DATETIME NOT NULL,
    `comment` TEXT NOT NULL,
    `user_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `reversion_revision` ADD INDEX `reversion_revision_date_created_index`(`date_created`);
CREATE TABLE `reversion_version`(
    `id` INT NOT NULL,
    `object_id` VARCHAR(255) NOT NULL,
    `format` VARCHAR(255) NOT NULL,
    `serialized_data` TEXT NOT NULL,
    `object_repr` TEXT NOT NULL,
    `content_type_id` INT NOT NULL,
    `revision_id` INT NOT NULL,
    `db` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `reversion_version` ADD UNIQUE `db_content_type_id_object_id_revision_id_unique`(
        `db`,
        `content_type_id`,
        `object_id`,
        `revision_id`
    );
ALTER TABLE
    `reversion_revision` ADD CONSTRAINT `reversion_revision_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `reversion_version` ADD CONSTRAINT `reversion_version_revision_id_foreign` FOREIGN KEY(`revision_id`) REFERENCES `reversion_revision`(`id`);
ALTER TABLE
    `reversion_version` ADD CONSTRAINT `reversion_version_content_type_id_foreign` FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`);