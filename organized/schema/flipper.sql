CREATE TABLE `flipper_features`(
    `id` BIGINT NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `flipper_features` ADD UNIQUE `flipper_features_key_unique`(`key`);
CREATE TABLE `flipper_gates`(
    `id` BIGINT NOT NULL,
    `feature_key` VARCHAR(255) NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `flipper_gates` ADD UNIQUE `flipper_gates_feature_key_key_value_unique`(`feature_key`, `key`, `value`);