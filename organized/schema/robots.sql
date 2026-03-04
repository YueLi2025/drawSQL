CREATE TABLE `robots_rule`(
    `id` INT NOT NULL,
    `robot` VARCHAR(255) NOT NULL,
    `crawl_delay` DECIMAL(8, 2) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `django_site`(
    `id` INT NOT NULL,
    `domain` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `django_site` ADD UNIQUE `django_site_domain_unique`(`domain`);
CREATE TABLE `robots_rule_allowed`(
    `id` INT NOT NULL,
    `rule_id` INT NOT NULL,
    `url_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `robots_rule_allowed` ADD UNIQUE `robots_rule_allowed_rule_id_url_id_unique`(`rule_id`, `url_id`);
ALTER TABLE
    `robots_rule_allowed` ADD INDEX `robots_rule_allowed_url_id_index`(`url_id`);
CREATE TABLE `robots_rule_disallowed`(
    `id` INT NOT NULL,
    `rule_id` INT NOT NULL,
    `url_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `robots_rule_disallowed` ADD UNIQUE `robots_rule_disallowed_rule_id_url_id_unique`(`rule_id`, `url_id`);
ALTER TABLE
    `robots_rule_disallowed` ADD INDEX `robots_rule_disallowed_url_id_index`(`url_id`);
CREATE TABLE `robots_rule_sites`(
    `id` INT NOT NULL,
    `rule_id` INT NOT NULL,
    `site_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `robots_rule_sites` ADD UNIQUE `robots_rule_sites_rule_id_site_id_unique`(`rule_id`, `site_id`);
ALTER TABLE
    `robots_rule_sites` ADD INDEX `robots_rule_sites_site_id_index`(`site_id`);
CREATE TABLE `robots_url`(
    `id` INT NOT NULL,
    `pattern` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `robots_rule_disallowed` ADD CONSTRAINT `robots_rule_disallowed_url_id_foreign` FOREIGN KEY(`url_id`) REFERENCES `robots_url`(`id`);
ALTER TABLE
    `robots_rule_disallowed` ADD CONSTRAINT `robots_rule_disallowed_rule_id_foreign` FOREIGN KEY(`rule_id`) REFERENCES `robots_rule`(`id`);
ALTER TABLE
    `robots_rule_sites` ADD CONSTRAINT `robots_rule_sites_rule_id_foreign` FOREIGN KEY(`rule_id`) REFERENCES `robots_rule`(`id`);
ALTER TABLE
    `robots_rule_allowed` ADD CONSTRAINT `robots_rule_allowed_url_id_foreign` FOREIGN KEY(`url_id`) REFERENCES `robots_url`(`id`);
ALTER TABLE
    `robots_rule_allowed` ADD CONSTRAINT `robots_rule_allowed_rule_id_foreign` FOREIGN KEY(`rule_id`) REFERENCES `robots_rule`(`id`);
ALTER TABLE
    `robots_rule_sites` ADD CONSTRAINT `robots_rule_sites_site_id_foreign` FOREIGN KEY(`site_id`) REFERENCES `django_site`(`id`);