CREATE TABLE `love_reactant_reaction_counters`(
    `id` BIGINT NOT NULL,
    `reactant_id` BIGINT NOT NULL,
    `reaction_type_id` BIGINT NOT NULL,
    `count` BIGINT NOT NULL,
    `weight` DECIMAL(8, 2) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `love_reactant_reaction_counters` ADD INDEX `reactant_id_reaction_type_id_index`(`reactant_id`, `reaction_type_id`);
ALTER TABLE
    `love_reactant_reaction_counters` ADD INDEX `love_reactant_reaction_counters_reaction_type_id_index`(`reaction_type_id`);
CREATE TABLE `love_reactant_reaction_totals`(
    `id` BIGINT NOT NULL,
    `reactant_id` BIGINT NOT NULL,
    `count` BIGINT NOT NULL,
    `weight` DECIMAL(8, 2) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `love_reactant_reaction_totals` ADD INDEX `love_reactant_reaction_totals_reactant_id_index`(`reactant_id`);
CREATE TABLE `love_reactants`(
    `id` BIGINT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `love_reactants` ADD INDEX `love_reactants_type_index`(`type`);
CREATE TABLE `love_reacters`(
    `id` BIGINT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `love_reacters` ADD INDEX `love_reacters_type_index`(`type`);
CREATE TABLE `love_reaction_types`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `mass` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `love_reaction_types` ADD INDEX `love_reaction_types_name_index`(`name`);
CREATE TABLE `love_reactions`(
    `id` BIGINT NOT NULL,
    `reactant_id` BIGINT NOT NULL,
    `reacter_id` BIGINT NOT NULL,
    `reaction_type_id` BIGINT NOT NULL,
    `rate` DECIMAL(8, 2) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `love_reactions` ADD INDEX `love_reactions_reactant_id_reaction_type_id_index`(`reactant_id`, `reaction_type_id`);
ALTER TABLE
    `love_reactions` ADD INDEX `love_reactions_reactant_id_reacter_id_reaction_type_id_index`(
        `reactant_id`,
        `reacter_id`,
        `reaction_type_id`
    );
ALTER TABLE
    `love_reactions` ADD INDEX `love_reactions_reactant_id_reacter_id_index`(`reactant_id`, `reacter_id`);
ALTER TABLE
    `love_reactions` ADD INDEX `love_reactions_reacter_id_reaction_type_id_index`(`reacter_id`, `reaction_type_id`);
ALTER TABLE
    `love_reactions` ADD INDEX `love_reactions_reaction_type_id_index`(`reaction_type_id`);
ALTER TABLE
    `love_reactant_reaction_counters` ADD CONSTRAINT `love_reactant_reaction_counters_reaction_type_id_foreign` FOREIGN KEY(`reaction_type_id`) REFERENCES `love_reaction_types`(`id`);
ALTER TABLE
    `love_reactant_reaction_counters` ADD CONSTRAINT `love_reactant_reaction_counters_reactant_id_foreign` FOREIGN KEY(`reactant_id`) REFERENCES `love_reactants`(`id`);
ALTER TABLE
    `love_reactions` ADD CONSTRAINT `love_reactions_reactant_id_foreign` FOREIGN KEY(`reactant_id`) REFERENCES `love_reactants`(`id`);
ALTER TABLE
    `love_reactions` ADD CONSTRAINT `love_reactions_reacter_id_foreign` FOREIGN KEY(`reacter_id`) REFERENCES `love_reacters`(`id`);
ALTER TABLE
    `love_reactions` ADD CONSTRAINT `love_reactions_reaction_type_id_foreign` FOREIGN KEY(`reaction_type_id`) REFERENCES `love_reaction_types`(`id`);
ALTER TABLE
    `love_reactant_reaction_totals` ADD CONSTRAINT `love_reactant_reaction_totals_reactant_id_foreign` FOREIGN KEY(`reactant_id`) REFERENCES `love_reactants`(`id`);