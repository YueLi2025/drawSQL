CREATE TABLE `oauth_access_grants`(
    `id` BIGINT NOT NULL,
    `resource_owner_id` BIGINT NOT NULL,
    `application_id` BIGINT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `expires_in` INT NOT NULL,
    `redirect_uri` TEXT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `revoked_at` DATETIME NULL,
    `scopes` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth_access_grants` ADD INDEX `oauth_access_grants_resource_owner_id_index`(`resource_owner_id`);
ALTER TABLE
    `oauth_access_grants` ADD INDEX `oauth_access_grants_application_id_index`(`application_id`);
ALTER TABLE
    `oauth_access_grants` ADD UNIQUE `oauth_access_grants_token_unique`(`token`);
CREATE TABLE `oauth_access_tokens`(
    `id` BIGINT NOT NULL,
    `resource_owner_id` BIGINT NULL,
    `application_id` BIGINT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `refresh_token` VARCHAR(255) NULL,
    `expires_in` INT NULL,
    `revoked_at` DATETIME NULL,
    `created_at` DATETIME NOT NULL,
    `scopes` VARCHAR(255) NULL,
    `previous_refresh_token` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth_access_tokens` ADD INDEX `oauth_access_tokens_resource_owner_id_index`(`resource_owner_id`);
ALTER TABLE
    `oauth_access_tokens` ADD INDEX `oauth_access_tokens_application_id_index`(`application_id`);
ALTER TABLE
    `oauth_access_tokens` ADD UNIQUE `oauth_access_tokens_token_unique`(`token`);
ALTER TABLE
    `oauth_access_tokens` ADD UNIQUE `oauth_access_tokens_refresh_token_unique`(`refresh_token`);
CREATE TABLE `oauth_applications`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `uid` VARCHAR(255) NOT NULL,
    `secret` VARCHAR(255) NOT NULL,
    `redirect_uri` TEXT NOT NULL,
    `scopes` VARCHAR(255) NOT NULL,
    `confidential` TINYINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth_applications` ADD UNIQUE `oauth_applications_uid_unique`(`uid`);
CREATE TABLE `users`(
    `id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth_access_grants` ADD CONSTRAINT `oauth_access_grants_resource_owner_id_foreign` FOREIGN KEY(`resource_owner_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `oauth_access_grants` ADD CONSTRAINT `oauth_access_grants_application_id_foreign` FOREIGN KEY(`application_id`) REFERENCES `oauth_applications`(`id`);
ALTER TABLE
    `oauth_access_tokens` ADD CONSTRAINT `oauth_access_tokens_resource_owner_id_foreign` FOREIGN KEY(`resource_owner_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `oauth_access_tokens` ADD CONSTRAINT `oauth_access_tokens_application_id_foreign` FOREIGN KEY(`application_id`) REFERENCES `oauth_applications`(`id`);