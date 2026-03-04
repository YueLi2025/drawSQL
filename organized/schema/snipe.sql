CREATE TABLE `accessories`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `category_id` INT NULL,
    `user_id` INT NULL,
    `qty` INT NOT NULL,
    `requestable` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `location_id` INT NULL,
    `purchase_date` DATE NULL,
    `purchase_cost` DECIMAL(8, 2) NULL,
    `order_number` VARCHAR(255) NULL,
    `company_id` INT NULL,
    `min_amt` INT NULL,
    `manufacturer_id` INT NULL,
    `model_number` VARCHAR(255) NULL,
    `image` VARCHAR(255) NULL,
    `supplier_id` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `accessories_users`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `accessory_id` INT NULL,
    `assigned_to` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `action_logs`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `action_type` VARCHAR(255) NOT NULL,
    `target_id` INT NULL,
    `target_type` VARCHAR(255) NULL,
    `location_id` INT NULL,
    `note` TEXT NULL,
    `filename` TEXT NULL,
    `item_type` VARCHAR(255) NOT NULL,
    `item_id` INT NOT NULL,
    `expected_checkin` DATE NULL,
    `accepted_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `thread_id` INT NULL,
    `company_id` INT NULL,
    `accept_signature` VARCHAR(255) NULL,
    `log_meta` TEXT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `action_logs` ADD INDEX `action_logs_target_id_target_type_index`(`target_id`, `target_type`);
ALTER TABLE
    `action_logs` ADD INDEX `action_logs_item_type_item_id_action_type_index`(
        `item_type`,
        `item_id`,
        `action_type`
    );
ALTER TABLE
    `action_logs` ADD INDEX `action_logs_target_type_target_id_action_type_index`(
        `target_type`,
        `target_id`,
        `action_type`
    );
ALTER TABLE
    `action_logs` ADD INDEX `action_logs_created_at_index`(`created_at`);
CREATE TABLE `asset_logs`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `action_type` VARCHAR(255) NOT NULL,
    `asset_id` INT NOT NULL,
    `checkedout_to` INT NULL,
    `location_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `asset_type` VARCHAR(255) NULL,
    `note` TEXT NULL,
    `filename` TEXT NULL,
    `requested_at` DATETIME NULL,
    `accepted_at` DATETIME NULL,
    `accessory_id` INT NULL,
    `accepted_id` INT NULL,
    `consumable_id` INT NULL,
    `expected_checkin` DATE NULL,
    `component_id` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `asset_maintenances`(
    `id` INT NOT NULL,
    `asset_id` INT NOT NULL,
    `supplier_id` INT NOT NULL,
    `asset_maintenance_type` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `is_warranty` TINYINT NOT NULL,
    `start_date` DATE NOT NULL,
    `completion_date` DATE NULL,
    `asset_maintenance_time` INT NULL,
    `notes` LONGTEXT NULL,
    `cost` DECIMAL(8, 2) NULL,
    `deleted_at` DATETIME NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `user_id` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `asset_uploads`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `filename` VARCHAR(255) NOT NULL,
    `asset_id` INT NOT NULL,
    `filenotes` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `assets`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `asset_tag` VARCHAR(255) NULL,
    `model_id` INT NULL,
    `serial` VARCHAR(255) NULL,
    `purchase_date` DATE NULL,
    `purchase_cost` DECIMAL(8, 2) NULL,
    `order_number` VARCHAR(255) NULL,
    `assigned_to` INT NULL,
    `notes` TEXT NULL,
    `image` TEXT NULL,
    `user_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `physical` TINYINT NOT NULL,
    `deleted_at` TIMESTAMP NULL,
    `status_id` INT NULL,
    `archived` TINYINT NULL,
    `warranty_months` INT NULL,
    `depreciate` TINYINT NULL,
    `supplier_id` INT NULL,
    `requestable` TINYINT NOT NULL,
    `rtd_location_id` INT NULL,
    `_snipeit_mac_address_1` VARCHAR(255) NULL,
    `accepted` VARCHAR(255) NULL,
    `last_checkout` DATETIME NULL,
    `expected_checkin` DATE NULL,
    `company_id` INT NULL,
    `assigned_type` VARCHAR(255) NULL,
    `last_audit_date` DATETIME NULL,
    `next_audit_date` DATE NULL,
    `location_id` INT NULL,
    `checkin_counter` INT NOT NULL,
    `checkout_counter` INT NOT NULL,
    `requests_counter` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `assets` ADD INDEX `assets_deleted_at_status_id_index`(`deleted_at`, `status_id`);
ALTER TABLE
    `assets` ADD INDEX `assets_deleted_at_model_id_index`(`deleted_at`, `model_id`);
ALTER TABLE
    `assets` ADD INDEX `assets_deleted_at_assigned_type_assigned_to_index`(
        `deleted_at`,
        `assigned_type`,
        `assigned_to`
    );
ALTER TABLE
    `assets` ADD INDEX `assets_deleted_at_supplier_id_index`(`deleted_at`, `supplier_id`);
ALTER TABLE
    `assets` ADD INDEX `assets_deleted_at_location_id_index`(`deleted_at`, `location_id`);
ALTER TABLE
    `assets` ADD INDEX `assets_deleted_at_rtd_location_id_index`(`deleted_at`, `rtd_location_id`);
ALTER TABLE
    `assets` ADD INDEX `assets_deleted_at_asset_tag_index`(`deleted_at`, `asset_tag`);
ALTER TABLE
    `assets` ADD INDEX `assets_deleted_at_name_index`(`deleted_at`, `name`);
ALTER TABLE
    `assets` ADD INDEX `assets_assigned_type_assigned_to_index`(`assigned_type`, `assigned_to`);
ALTER TABLE
    `assets` ADD INDEX `assets_created_at_index`(`created_at`);
ALTER TABLE
    `assets` ADD INDEX `assets_rtd_location_id_index`(`rtd_location_id`);
CREATE TABLE `categories`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `user_id` INT NULL,
    `deleted_at` TIMESTAMP NULL,
    `eula_text` LONGTEXT NULL,
    `use_default_eula` TINYINT NOT NULL,
    `require_acceptance` TINYINT NOT NULL,
    `category_type` VARCHAR(255) NULL,
    `checkin_email` TINYINT NOT NULL,
    `image` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `checkout_requests`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `requestable_id` INT NOT NULL,
    `requestable_type` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `canceled_at` DATETIME NULL,
    `fulfilled_at` DATETIME NULL,
    `deleted_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `checkout_requests` ADD INDEX `checkout_requests_user_id_requestable_id_requestable_type_index`(
        `user_id`,
        `requestable_id`,
        `requestable_type`
    );
CREATE TABLE `companies`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `image` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `components`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `category_id` INT NULL,
    `location_id` INT NULL,
    `company_id` INT NULL,
    `user_id` INT NULL,
    `qty` INT NOT NULL,
    `order_number` VARCHAR(255) NULL,
    `purchase_date` DATE NULL,
    `purchase_cost` DECIMAL(8, 2) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `min_amt` INT NULL,
    `serial` VARCHAR(255) NULL,
    `image` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `components_assets`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `assigned_qty` INT NULL,
    `component_id` INT NULL,
    `asset_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `consumables`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `category_id` INT NULL,
    `location_id` INT NULL,
    `user_id` INT NULL,
    `qty` INT NOT NULL,
    `requestable` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `purchase_date` DATE NULL,
    `purchase_cost` DECIMAL(8, 2) NULL,
    `order_number` VARCHAR(255) NULL,
    `company_id` INT NULL,
    `min_amt` INT NULL,
    `model_number` VARCHAR(255) NULL,
    `manufacturer_id` INT NULL,
    `item_no` VARCHAR(255) NULL,
    `image` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `consumables_users`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `consumable_id` INT NULL,
    `assigned_to` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `custom_field_custom_fieldset`(
    `custom_field_id` INT NOT NULL,
    `custom_fieldset_id` INT NOT NULL,
    `order` INT NOT NULL,
    `required` TINYINT NOT NULL
);
CREATE TABLE `custom_fields`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `format` VARCHAR(255) NOT NULL,
    `element` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `user_id` INT NULL,
    `field_values` TEXT NULL,
    `field_encrypted` TINYINT NOT NULL,
    `db_column` VARCHAR(255) NULL,
    `help_text` TEXT NULL,
    `show_in_email` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `custom_fieldsets`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `user_id` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `departments`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `company_id` INT NULL,
    `location_id` INT NULL,
    `manager_id` INT NULL,
    `notes` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `image` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `depreciations`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `months` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `user_id` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `imports`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `file_path` VARCHAR(255) NOT NULL,
    `filesize` INT NOT NULL,
    `import_type` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `header_row` TEXT NULL,
    `first_row` TEXT NULL,
    `field_map` TEXT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `license_seats`(
    `id` INT NOT NULL,
    `license_id` INT NULL,
    `assigned_to` INT NULL,
    `notes` TEXT NULL,
    `user_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `asset_id` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `licenses`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `serial` VARCHAR(255) NULL,
    `purchase_date` DATE NULL,
    `purchase_cost` DECIMAL(8, 2) NULL,
    `order_number` VARCHAR(255) NULL,
    `seats` INT NOT NULL,
    `notes` TEXT NULL,
    `user_id` INT NULL,
    `depreciation_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `license_name` VARCHAR(255) NULL,
    `license_email` VARCHAR(255) NULL,
    `depreciate` TINYINT NULL,
    `supplier_id` INT NULL,
    `expiration_date` DATE NULL,
    `purchase_order` VARCHAR(255) NULL,
    `termination_date` DATE NULL,
    `maintained` TINYINT NULL,
    `reassignable` TINYINT NOT NULL,
    `company_id` INT NULL,
    `manufacturer_id` INT NULL,
    `category_id` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `locations`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `city` VARCHAR(255) NULL,
    `state` VARCHAR(255) NULL,
    `country` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `user_id` INT NULL,
    `address` VARCHAR(255) NULL,
    `address2` VARCHAR(255) NULL,
    `zip` VARCHAR(255) NULL,
    `deleted_at` TIMESTAMP NULL,
    `parent_id` INT NULL,
    `currency` VARCHAR(255) NULL,
    `ldap_ou` VARCHAR(255) NULL,
    `manager_id` INT NULL,
    `image` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `login_attempts`(
    `id` INT NOT NULL,
    `username` VARCHAR(255) NULL,
    `remote_ip` VARCHAR(255) NULL,
    `user_agent` VARCHAR(255) NULL,
    `successful` TINYINT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `manufacturers`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `user_id` INT NULL,
    `deleted_at` TIMESTAMP NULL,
    `url` VARCHAR(255) NULL,
    `support_url` VARCHAR(255) NULL,
    `support_phone` VARCHAR(255) NULL,
    `support_email` VARCHAR(255) NULL,
    `image` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `models`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `model_number` VARCHAR(255) NULL,
    `manufacturer_id` INT NULL,
    `category_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `depreciation_id` INT NULL,
    `user_id` INT NULL,
    `eol` INT NULL,
    `image` VARCHAR(255) NULL,
    `deprecated_mac_address` TINYINT NOT NULL,
    `deleted_at` TIMESTAMP NULL,
    `fieldset_id` INT NULL,
    `notes` TEXT NULL,
    `requestable` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `models_custom_fields`(
    `id` INT NOT NULL,
    `asset_model_id` INT NOT NULL,
    `custom_field_id` INT NOT NULL,
    `default_value` TEXT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);
CREATE TABLE `permission_groups`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `permissions` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `requested_assets`(
    `id` INT NOT NULL,
    `asset_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `accepted_at` DATETIME NULL,
    `denied_at` DATETIME NULL,
    `notes` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `requests`(
    `id` INT NOT NULL,
    `asset_id` INT NOT NULL,
    `user_id` INT NULL,
    `request_code` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `settings`(
    `id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `user_id` INT NULL,
    `per_page` INT NOT NULL,
    `site_name` VARCHAR(255) NOT NULL,
    `qr_code` INT NULL,
    `qr_text` VARCHAR(255) NULL,
    `display_asset_name` INT NULL,
    `display_checkout_date` INT NULL,
    `display_eol` INT NULL,
    `auto_increment_assets` INT NOT NULL,
    `auto_increment_prefix` VARCHAR(255) NULL,
    `load_remote` TINYINT NOT NULL,
    `logo` VARCHAR(255) NULL,
    `header_color` VARCHAR(255) NULL,
    `alert_email` VARCHAR(255) NULL,
    `alerts_enabled` TINYINT NOT NULL,
    `default_eula_text` LONGTEXT NULL,
    `barcode_type` VARCHAR(255) NULL,
    `slack_endpoint` VARCHAR(255) NULL,
    `slack_channel` VARCHAR(255) NULL,
    `slack_botname` VARCHAR(255) NULL,
    `default_currency` VARCHAR(255) NULL,
    `custom_css` TEXT NULL,
    `brand` TINYINT NOT NULL,
    `ldap_enabled` VARCHAR(255) NULL,
    `ldap_server` VARCHAR(255) NULL,
    `ldap_uname` VARCHAR(255) NULL,
    `ldap_pword` LONGTEXT NULL,
    `ldap_basedn` VARCHAR(255) NULL,
    `ldap_filter` TEXT NULL,
    `ldap_username_field` VARCHAR(255) NULL,
    `ldap_lname_field` VARCHAR(255) NULL,
    `ldap_fname_field` VARCHAR(255) NULL,
    `ldap_auth_filter_query` VARCHAR(255) NULL,
    `ldap_version` INT NULL,
    `ldap_active_flag` VARCHAR(255) NULL,
    `ldap_emp_num` VARCHAR(255) NULL,
    `ldap_email` VARCHAR(255) NULL,
    `full_multiple_companies_support` TINYINT NOT NULL,
    `ldap_server_cert_ignore` TINYINT NOT NULL,
    `locale` VARCHAR(255) NULL,
    `labels_per_page` TINYINT NOT NULL,
    `labels_width` DECIMAL(8, 2) NOT NULL,
    `labels_height` DECIMAL(8, 2) NOT NULL,
    `labels_pmargin_left` DECIMAL(8, 2) NOT NULL,
    `labels_pmargin_right` DECIMAL(8, 2) NOT NULL,
    `labels_pmargin_top` DECIMAL(8, 2) NOT NULL,
    `labels_pmargin_bottom` DECIMAL(8, 2) NOT NULL,
    `labels_display_bgutter` DECIMAL(8, 2) NOT NULL,
    `labels_display_sgutter` DECIMAL(8, 2) NOT NULL,
    `labels_fontsize` TINYINT NOT NULL,
    `labels_pagewidth` DECIMAL(8, 2) NOT NULL,
    `labels_pageheight` DECIMAL(8, 2) NOT NULL,
    `labels_display_name` TINYINT NOT NULL,
    `labels_display_serial` TINYINT NOT NULL,
    `labels_display_tag` TINYINT NOT NULL,
    `alt_barcode` VARCHAR(255) NULL,
    `alt_barcode_enabled` TINYINT NULL,
    `alert_interval` INT NULL,
    `alert_threshold` INT NULL,
    `email_domain` VARCHAR(255) NULL,
    `email_format` VARCHAR(255) NULL,
    `username_format` VARCHAR(255) NULL,
    `is_ad` TINYINT NOT NULL,
    `ad_domain` VARCHAR(255) NULL,
    `ldap_port` VARCHAR(255) NOT NULL,
    `ldap_tls` TINYINT NOT NULL,
    `zerofill_count` INT NOT NULL,
    `ldap_pw_sync` TINYINT NOT NULL,
    `two_factor_enabled` TINYINT NULL,
    `require_accept_signature` TINYINT NOT NULL,
    `date_display_format` VARCHAR(255) NOT NULL,
    `time_display_format` VARCHAR(255) NOT NULL,
    `next_auto_tag_base` BIGINT NOT NULL,
    `login_note` TEXT NULL,
    `thumbnail_max_h` INT NULL,
    `pwd_secure_uncommon` TINYINT NOT NULL,
    `pwd_secure_complexity` VARCHAR(255) NULL,
    `pwd_secure_min` INT NOT NULL,
    `audit_interval` INT NULL,
    `audit_warning_days` INT NULL,
    `show_url_in_emails` TINYINT NOT NULL,
    `custom_forgot_pass_url` VARCHAR(255) NULL,
    `show_alerts_in_menu` TINYINT NOT NULL,
    `labels_display_company_name` TINYINT NOT NULL,
    `show_archived_in_list` TINYINT NOT NULL,
    `dashboard_message` TEXT NULL,
    `support_footer` CHAR(255) NULL,
    `footer_text` TEXT NULL,
    `modellist_displays` CHAR(255) NULL,
    `login_remote_user_enabled` TINYINT NOT NULL,
    `login_common_disabled` TINYINT NOT NULL,
    `login_remote_user_custom_logout_url` VARCHAR(255) NOT NULL,
    `skin` CHAR(255) NULL,
    `show_images_in_email` TINYINT NOT NULL,
    `admin_cc_email` CHAR(255) NULL,
    `labels_display_model` TINYINT NOT NULL,
    `privacy_policy_link` CHAR(255) NULL,
    `version_footer` CHAR(255) NULL,
    `unique_serial` TINYINT NOT NULL,
    `logo_print_assets` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `status_labels`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `user_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `deployable` TINYINT NOT NULL,
    `pending` TINYINT NOT NULL,
    `archived` TINYINT NOT NULL,
    `notes` TEXT NULL,
    `color` VARCHAR(255) NULL,
    `show_in_nav` TINYINT NOT NULL,
    `default_label` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `suppliers`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NULL,
    `address2` VARCHAR(255) NULL,
    `city` VARCHAR(255) NULL,
    `state` VARCHAR(255) NULL,
    `country` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NULL,
    `fax` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `contact` VARCHAR(255) NULL,
    `notes` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `user_id` INT NULL,
    `deleted_at` TIMESTAMP NULL,
    `zip` VARCHAR(255) NULL,
    `url` VARCHAR(255) NULL,
    `image` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `throttle`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `ip_address` VARCHAR(255) NULL,
    `attempts` INT NOT NULL,
    `suspended` TINYINT NOT NULL,
    `banned` TINYINT NOT NULL,
    `last_attempt_at` TIMESTAMP NULL,
    `suspended_at` TIMESTAMP NULL,
    `banned_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `email` VARCHAR(255) NULL,
    `password` VARCHAR(255) NOT NULL,
    `permissions` TEXT NULL,
    `activated` TINYINT NOT NULL,
    `activation_code` VARCHAR(255) NULL,
    `activated_at` TIMESTAMP NULL,
    `last_login` TIMESTAMP NULL,
    `persist_code` VARCHAR(255) NULL,
    `reset_password_code` VARCHAR(255) NULL,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `website` VARCHAR(255) NULL,
    `country` VARCHAR(255) NULL,
    `gravatar` VARCHAR(255) NULL,
    `location_id` INT NULL,
    `phone` VARCHAR(255) NULL,
    `jobtitle` VARCHAR(255) NULL,
    `manager_id` INT NULL,
    `employee_num` TEXT NULL,
    `avatar` VARCHAR(255) NULL,
    `username` VARCHAR(255) NULL,
    `notes` TEXT NULL,
    `company_id` INT NULL,
    `remember_token` TEXT NULL,
    `ldap_import` TINYINT NOT NULL,
    `locale` VARCHAR(255) NULL,
    `show_in_list` TINYINT NOT NULL,
    `two_factor_secret` VARCHAR(255) NULL,
    `two_factor_enrolled` TINYINT NOT NULL,
    `two_factor_optin` TINYINT NOT NULL,
    `department_id` INT NULL,
    `address` VARCHAR(255) NULL,
    `city` VARCHAR(255) NULL,
    `state` VARCHAR(255) NULL,
    `zip` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users_groups`(
    `user_id` INT NOT NULL,
    `group_id` INT NOT NULL,
    PRIMARY KEY(`user_id`, `group_id`)
);
ALTER TABLE
    `settings` ADD CONSTRAINT `settings_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `asset_uploads` ADD CONSTRAINT `asset_uploads_asset_id_foreign` FOREIGN KEY(`asset_id`) REFERENCES `assets`(`id`);
ALTER TABLE
    `licenses` ADD CONSTRAINT `licenses_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`);
ALTER TABLE
    `custom_fieldsets` ADD CONSTRAINT `custom_fieldsets_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `consumables_users` ADD CONSTRAINT `consumables_users_consumable_id_foreign` FOREIGN KEY(`consumable_id`) REFERENCES `consumables`(`id`);
ALTER TABLE
    `accessories` ADD CONSTRAINT `accessories_location_id_foreign` FOREIGN KEY(`location_id`) REFERENCES `locations`(`id`);
ALTER TABLE
    `assets` ADD CONSTRAINT `assets_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `consumables` ADD CONSTRAINT `consumables_manufacturer_id_foreign` FOREIGN KEY(`manufacturer_id`) REFERENCES `manufacturers`(`id`);
ALTER TABLE
    `license_seats` ADD CONSTRAINT `license_seats_asset_id_foreign` FOREIGN KEY(`asset_id`) REFERENCES `assets`(`id`);
ALTER TABLE
    `locations` ADD CONSTRAINT `locations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `licenses` ADD CONSTRAINT `licenses_company_id_foreign` FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`);
ALTER TABLE
    `components_assets` ADD CONSTRAINT `components_assets_component_id_foreign` FOREIGN KEY(`component_id`) REFERENCES `components`(`id`);
ALTER TABLE
    `models_custom_fields` ADD CONSTRAINT `models_custom_fields_custom_field_id_foreign` FOREIGN KEY(`custom_field_id`) REFERENCES `custom_fields`(`id`);
ALTER TABLE
    `consumables_users` ADD CONSTRAINT `consumables_users_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `licenses` ADD CONSTRAINT `licenses_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `assets` ADD CONSTRAINT `assets_company_id_foreign` FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`);
ALTER TABLE
    `licenses` ADD CONSTRAINT `licenses_supplier_id_foreign` FOREIGN KEY(`supplier_id`) REFERENCES `suppliers`(`id`);
ALTER TABLE
    `components` ADD CONSTRAINT `components_company_id_foreign` FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`);
ALTER TABLE
    `asset_uploads` ADD CONSTRAINT `asset_uploads_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `consumables` ADD CONSTRAINT `consumables_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `models` ADD CONSTRAINT `models_manufacturer_id_foreign` FOREIGN KEY(`manufacturer_id`) REFERENCES `manufacturers`(`id`);
ALTER TABLE
    `manufacturers` ADD CONSTRAINT `manufacturers_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `accessories_users` ADD CONSTRAINT `accessories_users_accessory_id_foreign` FOREIGN KEY(`accessory_id`) REFERENCES `accessories`(`id`);
ALTER TABLE
    `licenses` ADD CONSTRAINT `licenses_depreciation_id_foreign` FOREIGN KEY(`depreciation_id`) REFERENCES `depreciations`(`id`);
ALTER TABLE
    `components` ADD CONSTRAINT `components_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`);
ALTER TABLE
    `asset_logs` ADD CONSTRAINT `asset_logs_component_id_foreign` FOREIGN KEY(`component_id`) REFERENCES `components`(`id`);
ALTER TABLE
    `users_groups` ADD CONSTRAINT `users_groups_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `permission_groups`(`id`);
ALTER TABLE
    `consumables` ADD CONSTRAINT `consumables_company_id_foreign` FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`);
ALTER TABLE
    `action_logs` ADD CONSTRAINT `action_logs_company_id_foreign` FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`);
ALTER TABLE
    `asset_logs` ADD CONSTRAINT `asset_logs_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `assets` ADD CONSTRAINT `assets_model_id_foreign` FOREIGN KEY(`model_id`) REFERENCES `models`(`id`);
ALTER TABLE
    `consumables_users` ADD CONSTRAINT `consumables_users_assigned_to_foreign` FOREIGN KEY(`assigned_to`) REFERENCES `users`(`id`);
ALTER TABLE
    `asset_maintenances` ADD CONSTRAINT `asset_maintenances_asset_id_foreign` FOREIGN KEY(`asset_id`) REFERENCES `assets`(`id`);
ALTER TABLE
    `accessories_users` ADD CONSTRAINT `accessories_users_assigned_to_foreign` FOREIGN KEY(`assigned_to`) REFERENCES `users`(`id`);
ALTER TABLE
    `departments` ADD CONSTRAINT `departments_company_id_foreign` FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_department_id_foreign` FOREIGN KEY(`department_id`) REFERENCES `departments`(`id`);
ALTER TABLE
    `departments` ADD CONSTRAINT `departments_location_id_foreign` FOREIGN KEY(`location_id`) REFERENCES `locations`(`id`);
ALTER TABLE
    `accessories_users` ADD CONSTRAINT `accessories_users_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `requested_assets` ADD CONSTRAINT `requested_assets_asset_id_foreign` FOREIGN KEY(`asset_id`) REFERENCES `assets`(`id`);
ALTER TABLE
    `requests` ADD CONSTRAINT `requests_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `throttle` ADD CONSTRAINT `throttle_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `components` ADD CONSTRAINT `components_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `accessories` ADD CONSTRAINT `accessories_company_id_foreign` FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`);
ALTER TABLE
    `asset_maintenances` ADD CONSTRAINT `asset_maintenances_supplier_id_foreign` FOREIGN KEY(`supplier_id`) REFERENCES `suppliers`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_location_id_foreign` FOREIGN KEY(`location_id`) REFERENCES `locations`(`id`);
ALTER TABLE
    `action_logs` ADD CONSTRAINT `action_logs_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `locations` ADD CONSTRAINT `locations_manager_id_foreign` FOREIGN KEY(`manager_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `assets` ADD CONSTRAINT `assets_location_id_foreign` FOREIGN KEY(`location_id`) REFERENCES `locations`(`id`);
ALTER TABLE
    `asset_logs` ADD CONSTRAINT `asset_logs_asset_id_foreign` FOREIGN KEY(`asset_id`) REFERENCES `assets`(`id`);
ALTER TABLE
    `accessories` ADD CONSTRAINT `accessories_manufacturer_id_foreign` FOREIGN KEY(`manufacturer_id`) REFERENCES `manufacturers`(`id`);
ALTER TABLE
    `custom_field_custom_fieldset` ADD CONSTRAINT `custom_field_custom_fieldset_custom_field_id_foreign` FOREIGN KEY(`custom_field_id`) REFERENCES `custom_fields`(`id`);
ALTER TABLE
    `locations` ADD CONSTRAINT `locations_parent_id_foreign` FOREIGN KEY(`parent_id`) REFERENCES `locations`(`id`);
ALTER TABLE
    `accessories` ADD CONSTRAINT `accessories_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`);
ALTER TABLE
    `components_assets` ADD CONSTRAINT `components_assets_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `license_seats` ADD CONSTRAINT `license_seats_license_id_foreign` FOREIGN KEY(`license_id`) REFERENCES `licenses`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_manager_id_foreign` FOREIGN KEY(`manager_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `accessories` ADD CONSTRAINT `accessories_supplier_id_foreign` FOREIGN KEY(`supplier_id`) REFERENCES `suppliers`(`id`);
ALTER TABLE
    `models` ADD CONSTRAINT `models_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `departments` ADD CONSTRAINT `departments_manager_id_foreign` FOREIGN KEY(`manager_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `checkout_requests` ADD CONSTRAINT `checkout_requests_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `asset_maintenances` ADD CONSTRAINT `asset_maintenances_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `suppliers` ADD CONSTRAINT `suppliers_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `requested_assets` ADD CONSTRAINT `requested_assets_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `components` ADD CONSTRAINT `components_location_id_foreign` FOREIGN KEY(`location_id`) REFERENCES `locations`(`id`);
ALTER TABLE
    `license_seats` ADD CONSTRAINT `license_seats_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `depreciations` ADD CONSTRAINT `depreciations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `asset_logs` ADD CONSTRAINT `asset_logs_accepted_at_foreign` FOREIGN KEY(`accepted_at`) REFERENCES `accessories`(`id`);
ALTER TABLE
    `assets` ADD CONSTRAINT `assets_supplier_id_foreign` FOREIGN KEY(`supplier_id`) REFERENCES `suppliers`(`id`);
ALTER TABLE
    `requests` ADD CONSTRAINT `requests_asset_id_foreign` FOREIGN KEY(`asset_id`) REFERENCES `assets`(`id`);
ALTER TABLE
    `status_labels` ADD CONSTRAINT `status_labels_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `custom_field_custom_fieldset` ADD CONSTRAINT `custom_field_custom_fieldset_custom_fieldset_id_foreign` FOREIGN KEY(`custom_fieldset_id`) REFERENCES `custom_fieldsets`(`id`);
ALTER TABLE
    `license_seats` ADD CONSTRAINT `license_seats_assigned_to_foreign` FOREIGN KEY(`assigned_to`) REFERENCES `users`(`id`);
ALTER TABLE
    `users_groups` ADD CONSTRAINT `users_groups_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `models` ADD CONSTRAINT `models_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`);
ALTER TABLE
    `asset_logs` ADD CONSTRAINT `asset_logs_location_id_foreign` FOREIGN KEY(`location_id`) REFERENCES `locations`(`id`);
ALTER TABLE
    `models` ADD CONSTRAINT `models_depreciation_id_foreign` FOREIGN KEY(`depreciation_id`) REFERENCES `depreciations`(`id`);
ALTER TABLE
    `components_assets` ADD CONSTRAINT `components_assets_asset_id_foreign` FOREIGN KEY(`asset_id`) REFERENCES `assets`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_company_id_foreign` FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`);
ALTER TABLE
    `assets` ADD CONSTRAINT `assets_assigned_to_foreign` FOREIGN KEY(`assigned_to`) REFERENCES `users`(`id`);
ALTER TABLE
    `action_logs` ADD CONSTRAINT `action_logs_location_id_foreign` FOREIGN KEY(`location_id`) REFERENCES `locations`(`id`);