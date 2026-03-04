CREATE TABLE `appointments`(
    `id` INT NOT NULL,
    `issuer_id` INT NULL,
    `contact_id` INT NOT NULL,
    `business_id` INT NOT NULL,
    `hash` VARCHAR(255) NOT NULL,
    `status` ENUM('') NOT NULL,
    `start_at` TIMESTAMP NULL,
    `finish_at` TIMESTAMP NULL,
    `duration` INT NULL,
    `service_id` INT NULL,
    `comments` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `vacancy_id` INT NULL,
    `humanresource_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `appointments` ADD INDEX `appointments_issuer_id_index`(`issuer_id`);
ALTER TABLE
    `appointments` ADD INDEX `appointments_contact_id_index`(`contact_id`);
ALTER TABLE
    `appointments` ADD INDEX `appointments_business_id_index`(`business_id`);
ALTER TABLE
    `appointments` ADD UNIQUE `appointments_hash_unique`(`hash`);
ALTER TABLE
    `appointments` ADD INDEX `appointments_start_at_index`(`start_at`);
ALTER TABLE
    `appointments` ADD INDEX `appointments_finish_at_index`(`finish_at`);
ALTER TABLE
    `appointments` ADD INDEX `appointments_service_id_index`(`service_id`);
ALTER TABLE
    `appointments` ADD INDEX `appointments_vacancy_id_index`(`vacancy_id`);
ALTER TABLE
    `appointments` ADD INDEX `appointments_humanresource_id_index`(`humanresource_id`);
CREATE TABLE `business_contact`(
    `business_id` INT NOT NULL,
    `contact_id` INT NOT NULL,
    `notes` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
ALTER TABLE
    `business_contact` ADD UNIQUE `business_contact_business_id_contact_id_unique`(`business_id`, `contact_id`);
ALTER TABLE
    `business_contact` ADD INDEX `business_contact_business_id_index`(`business_id`);
ALTER TABLE
    `business_contact` ADD INDEX `business_contact_contact_id_index`(`contact_id`);
CREATE TABLE `business_user`(
    `business_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL
);
ALTER TABLE
    `business_user` ADD INDEX `business_user_business_id_index`(`business_id`);
ALTER TABLE
    `business_user` ADD INDEX `business_user_user_id_index`(`user_id`);
CREATE TABLE `businesses`(
    `id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `domain_id` INT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `postal_address` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NULL,
    `social_facebook` VARCHAR(255) NULL,
    `timezone` VARCHAR(255) NOT NULL,
    `strategy` VARCHAR(255) NOT NULL,
    `plan` VARCHAR(255) NOT NULL,
    `deleted_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `country_code` VARCHAR(255) NULL,
    `locale` VARCHAR(255) NULL,
    `listed` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `businesses` ADD INDEX `businesses_category_id_index`(`category_id`);
ALTER TABLE
    `businesses` ADD INDEX `businesses_domain_id_index`(`domain_id`);
ALTER TABLE
    `businesses` ADD UNIQUE `businesses_slug_unique`(`slug`);
ALTER TABLE
    `businesses` ADD INDEX `businesses_country_code_index`(`country_code`);
CREATE TABLE `categories`(
    `id` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `strategy` VARCHAR(255) NOT NULL,
    `deleted_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `categories` ADD UNIQUE `categories_slug_unique`(`slug`);
CREATE TABLE `contacts`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `nin` VARCHAR(255) NULL,
    `gender` ENUM('') NOT NULL,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `occupation` VARCHAR(255) NULL,
    `martial_status` VARCHAR(255) NULL,
    `postal_address` VARCHAR(255) NULL,
    `birthdate` DATE NULL,
    `mobile` CHAR(255) NULL,
    `mobile_country` CHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `contacts` ADD INDEX `contacts_user_id_index`(`user_id`);
ALTER TABLE
    `contacts` ADD INDEX `contacts_nin_index`(`nin`);
CREATE TABLE `countries`(
    `id` INT NOT NULL,
    `capital` VARCHAR(255) NULL,
    `citizenship` VARCHAR(255) NULL,
    `country_code` CHAR(255) NOT NULL,
    `currency` VARCHAR(255) NULL,
    `currency_code` VARCHAR(255) NULL,
    `currency_sub_unit` VARCHAR(255) NULL,
    `currency_symbol` VARCHAR(255) NULL,
    `full_name` VARCHAR(255) NULL,
    `iso_3166_2` CHAR(255) NOT NULL,
    `iso_3166_3` CHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `region_code` CHAR(255) NOT NULL,
    `sub_region_code` CHAR(255) NOT NULL,
    `eea` TINYINT NOT NULL,
    `calling_code` VARCHAR(255) NULL,
    `flag` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `domains`(
    `id` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `owner_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `domains` ADD UNIQUE `domains_slug_unique`(`slug`);
ALTER TABLE
    `domains` ADD INDEX `domains_owner_id_index`(`owner_id`);
CREATE TABLE `humanresources`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `capacity` INT NOT NULL,
    `business_id` INT NOT NULL,
    `contact_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `calendar_link` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `humanresources` ADD INDEX `humanresources_slug_index`(`slug`);
ALTER TABLE
    `humanresources` ADD INDEX `humanresources_business_id_index`(`business_id`);
ALTER TABLE
    `humanresources` ADD INDEX `humanresources_contact_id_index`(`contact_id`);
CREATE TABLE `migrations`(
    `id` INT NOT NULL,
    `migration` VARCHAR(255) NOT NULL,
    `batch` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `notification_categories`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `text` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notification_categories` ADD UNIQUE `notification_categories_name_unique`(`name`);
CREATE TABLE `notification_groups`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notification_groups` ADD UNIQUE `notification_groups_name_unique`(`name`);
CREATE TABLE `notifications`(
    `id` INT NOT NULL,
    `from_id` BIGINT NOT NULL,
    `from_type` VARCHAR(255) NULL,
    `to_id` BIGINT NOT NULL,
    `to_type` VARCHAR(255) NULL,
    `category_id` INT NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `extra` VARCHAR(255) NULL,
    `read` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `expire_time` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notifications` ADD INDEX `notifications_from_id_index`(`from_id`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_from_type_index`(`from_type`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_to_id_index`(`to_id`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_to_type_index`(`to_type`);
ALTER TABLE
    `notifications` ADD INDEX `notifications_category_id_index`(`category_id`);
CREATE TABLE `notifications_categories_in_groups`(
    `id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `group_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `notifications_categories_in_groups` ADD INDEX `notifications_categories_in_groups_category_id_index`(`category_id`);
ALTER TABLE
    `notifications_categories_in_groups` ADD INDEX `notifications_categories_in_groups_group_id_index`(`group_id`);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_email_index`(`email`);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_token_index`(`token`);
CREATE TABLE `permission_role`(
    `permission_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`permission_id`, `role_id`)
);
ALTER TABLE
    `permission_role` ADD INDEX `permission_role_role_id_index`(`role_id`);
CREATE TABLE `permission_user`(
    `permission_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`permission_id`, `user_id`)
);
ALTER TABLE
    `permission_user` ADD INDEX `permission_user_user_id_index`(`user_id`);
CREATE TABLE `permissions`(
    `id` INT NOT NULL,
    `inherit_id` INT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `permissions` ADD INDEX `permissions_inherit_id_index`(`inherit_id`);
ALTER TABLE
    `permissions` ADD INDEX `permissions_name_index`(`name`);
ALTER TABLE
    `permissions` ADD INDEX `permissions_slug_index`(`slug`);
CREATE TABLE `preferences`(
    `id` INT NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NOT NULL,
    `type` ENUM('') NOT NULL,
    `preferenceable_type` VARCHAR(255) NOT NULL,
    `preferenceable_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `preferences` ADD UNIQUE `preferences_key_preferenceable_type_preferenceable_id_unique`(
        `key`,
        `preferenceable_type`,
        `preferenceable_id`
    );
CREATE TABLE `role_user`(
    `role_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`role_id`, `user_id`)
);
ALTER TABLE
    `role_user` ADD INDEX `role_user_user_id_index`(`user_id`);
CREATE TABLE `roles`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `roles` ADD UNIQUE `roles_name_unique`(`name`);
ALTER TABLE
    `roles` ADD UNIQUE `roles_slug_unique`(`slug`);
CREATE TABLE `service_types`(
    `id` INT NOT NULL,
    `business_id` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `service_types` ADD INDEX `service_types_business_id_index`(`business_id`);
ALTER TABLE
    `service_types` ADD INDEX `service_types_slug_index`(`slug`);
CREATE TABLE `services`(
    `id` INT NOT NULL,
    `type_id` INT NULL,
    `business_id` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `duration` INT NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `prerequisites` VARCHAR(255) NULL,
    `color` VARCHAR(255) NULL,
    `deleted_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `services` ADD UNIQUE `services_business_id_slug_unique`(`business_id`, `slug`);
ALTER TABLE
    `services` ADD INDEX `services_type_id_index`(`type_id`);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `last_login_at` TIMESTAMP NULL,
    `last_ip` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_username_unique`(`username`);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
CREATE TABLE `vacancies`(
    `id` INT NOT NULL,
    `date` DATE NOT NULL,
    `start_at` TIMESTAMP NULL,
    `finish_at` TIMESTAMP NULL,
    `business_id` INT NOT NULL,
    `service_id` INT NOT NULL,
    `capacity` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `humanresource_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `vacancies` ADD INDEX `vacancies_start_at_index`(`start_at`);
ALTER TABLE
    `vacancies` ADD INDEX `vacancies_finish_at_index`(`finish_at`);
ALTER TABLE
    `vacancies` ADD INDEX `vacancies_business_id_index`(`business_id`);
ALTER TABLE
    `vacancies` ADD INDEX `vacancies_service_id_index`(`service_id`);
ALTER TABLE
    `vacancies` ADD INDEX `vacancies_humanresource_id_index`(`humanresource_id`);
ALTER TABLE
    `business_contact` ADD CONSTRAINT `business_contact_contact_id_foreign` FOREIGN KEY(`contact_id`) REFERENCES `contacts`(`id`);
ALTER TABLE
    `appointments` ADD CONSTRAINT `appointments_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `services`(`id`);
ALTER TABLE
    `humanresources` ADD CONSTRAINT `humanresources_business_id_foreign` FOREIGN KEY(`business_id`) REFERENCES `businesses`(`id`);
ALTER TABLE
    `humanresources` ADD CONSTRAINT `humanresources_contact_id_foreign` FOREIGN KEY(`contact_id`) REFERENCES `contacts`(`id`);
ALTER TABLE
    `business_contact` ADD CONSTRAINT `business_contact_business_id_foreign` FOREIGN KEY(`business_id`) REFERENCES `businesses`(`id`);
ALTER TABLE
    `role_user` ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `businesses` ADD CONSTRAINT `businesses_domain_id_foreign` FOREIGN KEY(`domain_id`) REFERENCES `domains`(`id`);
ALTER TABLE
    `businesses` ADD CONSTRAINT `businesses_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`);
ALTER TABLE
    `services` ADD CONSTRAINT `services_business_id_foreign` FOREIGN KEY(`business_id`) REFERENCES `businesses`(`id`);
ALTER TABLE
    `business_user` ADD CONSTRAINT `business_user_business_id_foreign` FOREIGN KEY(`business_id`) REFERENCES `businesses`(`id`);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `contacts` ADD CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `domains` ADD CONSTRAINT `domains_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `service_types` ADD CONSTRAINT `service_types_business_id_foreign` FOREIGN KEY(`business_id`) REFERENCES `businesses`(`id`);
ALTER TABLE
    `notifications_categories_in_groups` ADD CONSTRAINT `notifications_categories_in_groups_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `notification_groups`(`id`);
ALTER TABLE
    `vacancies` ADD CONSTRAINT `vacancies_business_id_foreign` FOREIGN KEY(`business_id`) REFERENCES `businesses`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `notification_categories`(`id`);
ALTER TABLE
    `appointments` ADD CONSTRAINT `appointments_humanresource_id_foreign` FOREIGN KEY(`humanresource_id`) REFERENCES `humanresources`(`id`);
ALTER TABLE
    `permission_user` ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `vacancies` ADD CONSTRAINT `vacancies_humanresource_id_foreign` FOREIGN KEY(`humanresource_id`) REFERENCES `humanresources`(`id`);
ALTER TABLE
    `appointments` ADD CONSTRAINT `appointments_vacancy_id_foreign` FOREIGN KEY(`vacancy_id`) REFERENCES `vacancies`(`id`);
ALTER TABLE
    `notifications_categories_in_groups` ADD CONSTRAINT `notifications_categories_in_groups_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `notification_categories`(`id`);
ALTER TABLE
    `vacancies` ADD CONSTRAINT `vacancies_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `services`(`id`);
ALTER TABLE
    `appointments` ADD CONSTRAINT `appointments_issuer_id_foreign` FOREIGN KEY(`issuer_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `services` ADD CONSTRAINT `services_type_id_foreign` FOREIGN KEY(`type_id`) REFERENCES `service_types`(`id`);
ALTER TABLE
    `permissions` ADD CONSTRAINT `permissions_inherit_id_foreign` FOREIGN KEY(`inherit_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `role_user` ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `appointments` ADD CONSTRAINT `appointments_contact_id_foreign` FOREIGN KEY(`contact_id`) REFERENCES `contacts`(`id`);
ALTER TABLE
    `appointments` ADD CONSTRAINT `appointments_business_id_foreign` FOREIGN KEY(`business_id`) REFERENCES `businesses`(`id`);
ALTER TABLE
    `permission_user` ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`);
ALTER TABLE
    `business_user` ADD CONSTRAINT `business_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);