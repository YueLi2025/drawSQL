CREATE TABLE `auth_user`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `organizations_organization`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `is_active` TINYINT NOT NULL,
    `created` DATETIME NOT NULL,
    `modified` DATETIME NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `organizations_organization` ADD UNIQUE `organizations_organization_slug_unique`(`slug`);
CREATE TABLE `organizations_organizationowner`(
    `id` INT NOT NULL,
    `created` DATETIME NOT NULL,
    `modified` DATETIME NOT NULL,
    `organization_id` INT NOT NULL,
    `organization_user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `organizations_organizationowner` ADD UNIQUE `organizations_organizationowner_organization_id_unique`(`organization_id`);
ALTER TABLE
    `organizations_organizationowner` ADD UNIQUE `organizations_organizationowner_organization_user_id_unique`(`organization_user_id`);
CREATE TABLE `organizations_organizationuser`(
    `id` INT NOT NULL,
    `created` DATETIME NOT NULL,
    `modified` DATETIME NOT NULL,
    `is_admin` TINYINT NOT NULL,
    `organization_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `organizations_organizationuser` ADD UNIQUE `organizations_organizationuser_organization_id_user_id_unique`(`organization_id`, `user_id`);
ALTER TABLE
    `organizations_organizationuser` ADD INDEX `organizations_organizationuser_organization_id_index`(`organization_id`);
ALTER TABLE
    `organizations_organizationuser` ADD CONSTRAINT `organizations_organizationuser_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `organizations_organizationowner` ADD CONSTRAINT `organizations_organizationowner_organization_id_foreign` FOREIGN KEY(`organization_id`) REFERENCES `organizations_organization`(`id`);
ALTER TABLE
    `organizations_organizationuser` ADD CONSTRAINT `organizations_organizationuser_organization_id_foreign` FOREIGN KEY(`organization_id`) REFERENCES `organizations_organization`(`id`);
ALTER TABLE
    `organizations_organizationowner` ADD CONSTRAINT `organizations_organizationowner_organization_user_id_foreign` FOREIGN KEY(`organization_user_id`) REFERENCES `organizations_organizationuser`(`id`);