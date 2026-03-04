CREATE TABLE `auth_user`(
    `id` INT NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `last_login` DATETIME NULL,
    `is_superuser` TINYINT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `is_staff` TINYINT NOT NULL,
    `is_active` TINYINT NOT NULL,
    `date_joined` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_user` ADD UNIQUE `auth_user_username_unique`(`username`);
CREATE TABLE `oauth2_provider_accesstoken`(
    `id` BIGINT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `expires` DATETIME NOT NULL,
    `scope` LONGTEXT NOT NULL,
    `application_id` BIGINT NULL,
    `user_id` INT NULL,
    `created` DATETIME NOT NULL,
    `updated` DATETIME NOT NULL,
    `source_refresh_token_id` BIGINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth2_provider_accesstoken` ADD UNIQUE `oauth2_provider_accesstoken_token_unique`(`token`);
ALTER TABLE
    `oauth2_provider_accesstoken` ADD INDEX `oauth2_provider_accesstoken_application_id_index`(`application_id`);
ALTER TABLE
    `oauth2_provider_accesstoken` ADD INDEX `oauth2_provider_accesstoken_user_id_index`(`user_id`);
ALTER TABLE
    `oauth2_provider_accesstoken` ADD UNIQUE `oauth2_provider_accesstoken_source_refresh_token_id_unique`(`source_refresh_token_id`);
CREATE TABLE `oauth2_provider_application`(
    `id` BIGINT NOT NULL,
    `client_id` VARCHAR(255) NOT NULL,
    `redirect_uris` LONGTEXT NOT NULL,
    `client_type` VARCHAR(255) NOT NULL,
    `authorization_grant_type` VARCHAR(255) NOT NULL,
    `client_secret` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `user_id` INT NULL,
    `skip_authorization` TINYINT NOT NULL,
    `created` DATETIME NOT NULL,
    `updated` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth2_provider_application` ADD UNIQUE `oauth2_provider_application_client_id_unique`(`client_id`);
ALTER TABLE
    `oauth2_provider_application` ADD INDEX `oauth2_provider_application_client_secret_index`(`client_secret`);
ALTER TABLE
    `oauth2_provider_application` ADD INDEX `oauth2_provider_application_user_id_index`(`user_id`);
CREATE TABLE `oauth2_provider_grant`(
    `id` BIGINT NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `expires` DATETIME NOT NULL,
    `redirect_uri` VARCHAR(255) NOT NULL,
    `scope` LONGTEXT NOT NULL,
    `application_id` BIGINT NOT NULL,
    `user_id` INT NOT NULL,
    `created` DATETIME NOT NULL,
    `updated` DATETIME NOT NULL,
    `code_challenge` VARCHAR(255) NOT NULL,
    `code_challenge_method` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth2_provider_grant` ADD UNIQUE `oauth2_provider_grant_code_unique`(`code`);
ALTER TABLE
    `oauth2_provider_grant` ADD INDEX `oauth2_provider_grant_application_id_index`(`application_id`);
ALTER TABLE
    `oauth2_provider_grant` ADD INDEX `oauth2_provider_grant_user_id_index`(`user_id`);
CREATE TABLE `oauth2_provider_refreshtoken`(
    `id` BIGINT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `access_token_id` BIGINT NULL,
    `application_id` BIGINT NOT NULL,
    `user_id` INT NOT NULL,
    `created` DATETIME NOT NULL,
    `updated` DATETIME NOT NULL,
    `revoked` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth2_provider_refreshtoken` ADD UNIQUE `oauth2_provider_refreshtoken_token_revoked_unique`(`token`, `revoked`);
ALTER TABLE
    `oauth2_provider_refreshtoken` ADD UNIQUE `oauth2_provider_refreshtoken_access_token_id_unique`(`access_token_id`);
ALTER TABLE
    `oauth2_provider_refreshtoken` ADD INDEX `oauth2_provider_refreshtoken_application_id_index`(`application_id`);
ALTER TABLE
    `oauth2_provider_refreshtoken` ADD INDEX `oauth2_provider_refreshtoken_user_id_index`(`user_id`);
ALTER TABLE
    `oauth2_provider_refreshtoken` ADD CONSTRAINT `oauth2_provider_refreshtoken_application_id_foreign` FOREIGN KEY(`application_id`) REFERENCES `oauth2_provider_application`(`id`);
ALTER TABLE
    `oauth2_provider_grant` ADD CONSTRAINT `oauth2_provider_grant_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `oauth2_provider_application` ADD CONSTRAINT `oauth2_provider_application_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `oauth2_provider_accesstoken` ADD CONSTRAINT `oauth2_provider_accesstoken_application_id_foreign` FOREIGN KEY(`application_id`) REFERENCES `oauth2_provider_application`(`id`);
ALTER TABLE
    `oauth2_provider_accesstoken` ADD CONSTRAINT `oauth2_provider_accesstoken_source_refresh_token_id_foreign` FOREIGN KEY(`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken`(`id`);
ALTER TABLE
    `oauth2_provider_accesstoken` ADD CONSTRAINT `oauth2_provider_accesstoken_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `oauth2_provider_grant` ADD CONSTRAINT `oauth2_provider_grant_application_id_foreign` FOREIGN KEY(`application_id`) REFERENCES `oauth2_provider_application`(`id`);
ALTER TABLE
    `oauth2_provider_refreshtoken` ADD CONSTRAINT `oauth2_provider_refreshtoken_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `oauth2_provider_refreshtoken` ADD CONSTRAINT `oauth2_provider_refreshtoken_access_token_id_foreign` FOREIGN KEY(`access_token_id`) REFERENCES `oauth2_provider_accesstoken`(`id`);