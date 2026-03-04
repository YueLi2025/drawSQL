CREATE TABLE `tracker_agents`(
    `id` BIGINT NOT NULL,
    `name` MEDIUMTEXT NOT NULL,
    `browser` VARCHAR(255) NOT NULL,
    `browser_version` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `name_hash` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_agents` ADD INDEX `tracker_agents_browser_index`(`browser`);
ALTER TABLE
    `tracker_agents` ADD INDEX `tracker_agents_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_agents` ADD INDEX `tracker_agents_updated_at_index`(`updated_at`);
ALTER TABLE
    `tracker_agents` ADD UNIQUE `tracker_agents_name_hash_unique`(`name_hash`);
CREATE TABLE `tracker_connections`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_connections` ADD INDEX `tracker_connections_name_index`(`name`);
ALTER TABLE
    `tracker_connections` ADD INDEX `tracker_connections_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_connections` ADD INDEX `tracker_connections_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_cookies`(
    `id` BIGINT NOT NULL,
    `uuid` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_cookies` ADD UNIQUE `tracker_cookies_uuid_unique`(`uuid`);
ALTER TABLE
    `tracker_cookies` ADD INDEX `tracker_cookies_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_cookies` ADD INDEX `tracker_cookies_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_devices`(
    `id` BIGINT NOT NULL,
    `kind` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `platform` VARCHAR(255) NOT NULL,
    `platform_version` VARCHAR(255) NOT NULL,
    `is_mobile` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_devices` ADD UNIQUE `tracker_devices_kind_model_platform_platform_version_unique`(
        `kind`,
        `model`,
        `platform`,
        `platform_version`
    );
ALTER TABLE
    `tracker_devices` ADD INDEX `tracker_devices_kind_index`(`kind`);
ALTER TABLE
    `tracker_devices` ADD INDEX `tracker_devices_model_index`(`model`);
ALTER TABLE
    `tracker_devices` ADD INDEX `tracker_devices_platform_index`(`platform`);
ALTER TABLE
    `tracker_devices` ADD INDEX `tracker_devices_platform_version_index`(`platform_version`);
ALTER TABLE
    `tracker_devices` ADD INDEX `tracker_devices_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_devices` ADD INDEX `tracker_devices_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_domains`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_domains` ADD INDEX `tracker_domains_name_index`(`name`);
ALTER TABLE
    `tracker_domains` ADD INDEX `tracker_domains_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_domains` ADD INDEX `tracker_domains_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_errors`(
    `id` BIGINT NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `message` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_errors` ADD INDEX `tracker_errors_code_index`(`code`);
ALTER TABLE
    `tracker_errors` ADD INDEX `tracker_errors_message_index`(`message`);
ALTER TABLE
    `tracker_errors` ADD INDEX `tracker_errors_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_errors` ADD INDEX `tracker_errors_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_events`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_events` ADD INDEX `tracker_events_name_index`(`name`);
ALTER TABLE
    `tracker_events` ADD INDEX `tracker_events_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_events` ADD INDEX `tracker_events_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_events_log`(
    `id` BIGINT NOT NULL,
    `event_id` BIGINT NOT NULL,
    `class_id` BIGINT NULL,
    `log_id` BIGINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_events_log` ADD INDEX `tracker_events_log_event_id_index`(`event_id`);
ALTER TABLE
    `tracker_events_log` ADD INDEX `tracker_events_log_class_id_index`(`class_id`);
ALTER TABLE
    `tracker_events_log` ADD INDEX `tracker_events_log_log_id_index`(`log_id`);
ALTER TABLE
    `tracker_events_log` ADD INDEX `tracker_events_log_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_events_log` ADD INDEX `tracker_events_log_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_geoip`(
    `id` BIGINT NOT NULL,
    `latitude` DOUBLE NULL,
    `longitude` DOUBLE NULL,
    `country_code` VARCHAR(255) NULL,
    `country_code3` VARCHAR(255) NULL,
    `country_name` VARCHAR(255) NULL,
    `region` VARCHAR(255) NULL,
    `city` VARCHAR(255) NULL,
    `postal_code` VARCHAR(255) NULL,
    `area_code` BIGINT NULL,
    `dma_code` DOUBLE NULL,
    `metro_code` DOUBLE NULL,
    `continent_code` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_geoip` ADD INDEX `tracker_geoip_latitude_index`(`latitude`);
ALTER TABLE
    `tracker_geoip` ADD INDEX `tracker_geoip_longitude_index`(`longitude`);
ALTER TABLE
    `tracker_geoip` ADD INDEX `tracker_geoip_country_code_index`(`country_code`);
ALTER TABLE
    `tracker_geoip` ADD INDEX `tracker_geoip_country_code3_index`(`country_code3`);
ALTER TABLE
    `tracker_geoip` ADD INDEX `tracker_geoip_country_name_index`(`country_name`);
ALTER TABLE
    `tracker_geoip` ADD INDEX `tracker_geoip_city_index`(`city`);
ALTER TABLE
    `tracker_geoip` ADD INDEX `tracker_geoip_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_geoip` ADD INDEX `tracker_geoip_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_languages`(
    `id` BIGINT NOT NULL,
    `preference` VARCHAR(255) NOT NULL,
    `language-range` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_languages` ADD UNIQUE `tracker_languages_preference_language_range_unique`(`preference`, `language-range`);
ALTER TABLE
    `tracker_languages` ADD INDEX `tracker_languages_preference_index`(`preference`);
ALTER TABLE
    `tracker_languages` ADD INDEX `tracker_languages_language_range_index`(`language-range`);
ALTER TABLE
    `tracker_languages` ADD INDEX `tracker_languages_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_languages` ADD INDEX `tracker_languages_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_log`(
    `id` BIGINT NOT NULL,
    `session_id` BIGINT NOT NULL,
    `path_id` BIGINT NULL,
    `query_id` BIGINT NULL,
    `method` VARCHAR(255) NOT NULL,
    `route_path_id` BIGINT NULL,
    `is_ajax` TINYINT NOT NULL,
    `is_secure` TINYINT NOT NULL,
    `is_json` TINYINT NOT NULL,
    `wants_json` TINYINT NOT NULL,
    `error_id` BIGINT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `referer_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_log` ADD INDEX `tracker_log_session_id_index`(`session_id`);
ALTER TABLE
    `tracker_log` ADD INDEX `tracker_log_path_id_index`(`path_id`);
ALTER TABLE
    `tracker_log` ADD INDEX `tracker_log_query_id_index`(`query_id`);
ALTER TABLE
    `tracker_log` ADD INDEX `tracker_log_method_index`(`method`);
ALTER TABLE
    `tracker_log` ADD INDEX `tracker_log_route_path_id_index`(`route_path_id`);
ALTER TABLE
    `tracker_log` ADD INDEX `tracker_log_error_id_index`(`error_id`);
ALTER TABLE
    `tracker_log` ADD INDEX `tracker_log_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_log` ADD INDEX `tracker_log_updated_at_index`(`updated_at`);
ALTER TABLE
    `tracker_log` ADD INDEX `tracker_log_referer_id_index`(`referer_id`);
CREATE TABLE `tracker_paths`(
    `id` BIGINT NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_paths` ADD INDEX `tracker_paths_path_index`(`path`);
ALTER TABLE
    `tracker_paths` ADD INDEX `tracker_paths_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_paths` ADD INDEX `tracker_paths_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_queries`(
    `id` BIGINT NOT NULL,
    `query` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_queries` ADD INDEX `tracker_queries_query_index`(`query`);
ALTER TABLE
    `tracker_queries` ADD INDEX `tracker_queries_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_queries` ADD INDEX `tracker_queries_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_query_arguments`(
    `id` BIGINT NOT NULL,
    `query_id` BIGINT NOT NULL,
    `argument` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_query_arguments` ADD INDEX `tracker_query_arguments_query_id_index`(`query_id`);
ALTER TABLE
    `tracker_query_arguments` ADD INDEX `tracker_query_arguments_argument_index`(`argument`);
ALTER TABLE
    `tracker_query_arguments` ADD INDEX `tracker_query_arguments_value_index`(`value`);
ALTER TABLE
    `tracker_query_arguments` ADD INDEX `tracker_query_arguments_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_query_arguments` ADD INDEX `tracker_query_arguments_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_referers`(
    `id` BIGINT NOT NULL,
    `domain_id` BIGINT NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `host` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `medium` VARCHAR(255) NULL,
    `source` VARCHAR(255) NULL,
    `search_terms_hash` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_referers` ADD INDEX `tracker_referers_domain_id_index`(`domain_id`);
ALTER TABLE
    `tracker_referers` ADD INDEX `tracker_referers_url_index`(`url`);
ALTER TABLE
    `tracker_referers` ADD INDEX `tracker_referers_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_referers` ADD INDEX `tracker_referers_updated_at_index`(`updated_at`);
ALTER TABLE
    `tracker_referers` ADD INDEX `tracker_referers_medium_index`(`medium`);
ALTER TABLE
    `tracker_referers` ADD INDEX `tracker_referers_source_index`(`source`);
ALTER TABLE
    `tracker_referers` ADD INDEX `tracker_referers_search_terms_hash_index`(`search_terms_hash`);
CREATE TABLE `tracker_referers_search_terms`(
    `id` BIGINT NOT NULL,
    `referer_id` BIGINT NOT NULL,
    `search_term` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_referers_search_terms` ADD INDEX `tracker_referers_search_terms_referer_id_index`(`referer_id`);
ALTER TABLE
    `tracker_referers_search_terms` ADD INDEX `tracker_referers_search_terms_search_term_index`(`search_term`);
ALTER TABLE
    `tracker_referers_search_terms` ADD INDEX `tracker_referers_search_terms_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_referers_search_terms` ADD INDEX `tracker_referers_search_terms_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_route_path_parameters`(
    `id` BIGINT NOT NULL,
    `route_path_id` BIGINT NOT NULL,
    `parameter` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_route_path_parameters` ADD INDEX `tracker_route_path_parameters_route_path_id_index`(`route_path_id`);
ALTER TABLE
    `tracker_route_path_parameters` ADD INDEX `tracker_route_path_parameters_parameter_index`(`parameter`);
ALTER TABLE
    `tracker_route_path_parameters` ADD INDEX `tracker_route_path_parameters_value_index`(`value`);
ALTER TABLE
    `tracker_route_path_parameters` ADD INDEX `tracker_route_path_parameters_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_route_path_parameters` ADD INDEX `tracker_route_path_parameters_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_route_paths`(
    `id` BIGINT NOT NULL,
    `route_id` BIGINT NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_route_paths` ADD INDEX `tracker_route_paths_route_id_index`(`route_id`);
ALTER TABLE
    `tracker_route_paths` ADD INDEX `tracker_route_paths_path_index`(`path`);
ALTER TABLE
    `tracker_route_paths` ADD INDEX `tracker_route_paths_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_route_paths` ADD INDEX `tracker_route_paths_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_routes`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `action` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_routes` ADD INDEX `tracker_routes_name_index`(`name`);
ALTER TABLE
    `tracker_routes` ADD INDEX `tracker_routes_action_index`(`action`);
ALTER TABLE
    `tracker_routes` ADD INDEX `tracker_routes_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_routes` ADD INDEX `tracker_routes_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_sessions`(
    `id` BIGINT NOT NULL,
    `uuid` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NULL,
    `device_id` BIGINT NULL,
    `agent_id` BIGINT NULL,
    `client_ip` VARCHAR(255) NOT NULL,
    `referer_id` BIGINT NULL,
    `cookie_id` BIGINT NULL,
    `geoip_id` BIGINT NULL,
    `is_robot` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `language_id` BIGINT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_sessions` ADD UNIQUE `tracker_sessions_uuid_unique`(`uuid`);
ALTER TABLE
    `tracker_sessions` ADD INDEX `tracker_sessions_user_id_index`(`user_id`);
ALTER TABLE
    `tracker_sessions` ADD INDEX `tracker_sessions_device_id_index`(`device_id`);
ALTER TABLE
    `tracker_sessions` ADD INDEX `tracker_sessions_agent_id_index`(`agent_id`);
ALTER TABLE
    `tracker_sessions` ADD INDEX `tracker_sessions_client_ip_index`(`client_ip`);
ALTER TABLE
    `tracker_sessions` ADD INDEX `tracker_sessions_referer_id_index`(`referer_id`);
ALTER TABLE
    `tracker_sessions` ADD INDEX `tracker_sessions_cookie_id_index`(`cookie_id`);
ALTER TABLE
    `tracker_sessions` ADD INDEX `tracker_sessions_geoip_id_index`(`geoip_id`);
ALTER TABLE
    `tracker_sessions` ADD INDEX `tracker_sessions_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_sessions` ADD INDEX `tracker_sessions_updated_at_index`(`updated_at`);
ALTER TABLE
    `tracker_sessions` ADD INDEX `tracker_sessions_language_id_index`(`language_id`);
CREATE TABLE `tracker_sql_queries`(
    `id` BIGINT NOT NULL,
    `sha1` VARCHAR(255) NOT NULL,
    `statement` TEXT NOT NULL,
    `time` DOUBLE NOT NULL,
    `connection_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_sql_queries` ADD INDEX `tracker_sql_queries_sha1_index`(`sha1`);
ALTER TABLE
    `tracker_sql_queries` ADD INDEX `tracker_sql_queries_time_index`(`time`);
ALTER TABLE
    `tracker_sql_queries` ADD INDEX `tracker_sql_queries_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_sql_queries` ADD INDEX `tracker_sql_queries_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_sql_queries_log`(
    `id` BIGINT NOT NULL,
    `log_id` BIGINT NOT NULL,
    `sql_query_id` BIGINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_sql_queries_log` ADD INDEX `tracker_sql_queries_log_log_id_index`(`log_id`);
ALTER TABLE
    `tracker_sql_queries_log` ADD INDEX `tracker_sql_queries_log_sql_query_id_index`(`sql_query_id`);
ALTER TABLE
    `tracker_sql_queries_log` ADD INDEX `tracker_sql_queries_log_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_sql_queries_log` ADD INDEX `tracker_sql_queries_log_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_sql_query_bindings`(
    `id` BIGINT NOT NULL,
    `sha1` VARCHAR(255) NOT NULL,
    `serialized` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_sql_query_bindings` ADD INDEX `tracker_sql_query_bindings_sha1_index`(`sha1`);
ALTER TABLE
    `tracker_sql_query_bindings` ADD INDEX `tracker_sql_query_bindings_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_sql_query_bindings` ADD INDEX `tracker_sql_query_bindings_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_sql_query_bindings_parameters`(
    `id` BIGINT NOT NULL,
    `sql_query_bindings_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `value` TEXT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_sql_query_bindings_parameters` ADD INDEX `tracker_sql_query_bindings_parameters_sql_query_bindings_id_index`(`sql_query_bindings_id`);
ALTER TABLE
    `tracker_sql_query_bindings_parameters` ADD INDEX `tracker_sql_query_bindings_parameters_name_index`(`name`);
ALTER TABLE
    `tracker_sql_query_bindings_parameters` ADD INDEX `tracker_sql_query_bindings_parameters_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_sql_query_bindings_parameters` ADD INDEX `tracker_sql_query_bindings_parameters_updated_at_index`(`updated_at`);
CREATE TABLE `tracker_system_classes`(
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tracker_system_classes` ADD INDEX `tracker_system_classes_name_index`(`name`);
ALTER TABLE
    `tracker_system_classes` ADD INDEX `tracker_system_classes_created_at_index`(`created_at`);
ALTER TABLE
    `tracker_system_classes` ADD INDEX `tracker_system_classes_updated_at_index`(`updated_at`);
ALTER TABLE
    `tracker_referers_search_terms` ADD CONSTRAINT `tracker_referers_search_terms_referer_id_foreign` FOREIGN KEY(`referer_id`) REFERENCES `tracker_referers`(`id`);
ALTER TABLE
    `tracker_log` ADD CONSTRAINT `tracker_log_route_path_id_foreign` FOREIGN KEY(`route_path_id`) REFERENCES `tracker_route_paths`(`id`);
ALTER TABLE
    `tracker_sessions` ADD CONSTRAINT `tracker_sessions_agent_id_foreign` FOREIGN KEY(`agent_id`) REFERENCES `tracker_agents`(`id`);
ALTER TABLE
    `tracker_events_log` ADD CONSTRAINT `tracker_events_log_log_id_foreign` FOREIGN KEY(`log_id`) REFERENCES `tracker_log`(`id`);
ALTER TABLE
    `tracker_route_paths` ADD CONSTRAINT `tracker_route_paths_route_id_foreign` FOREIGN KEY(`route_id`) REFERENCES `tracker_routes`(`id`);
ALTER TABLE
    `tracker_log` ADD CONSTRAINT `tracker_log_query_id_foreign` FOREIGN KEY(`query_id`) REFERENCES `tracker_queries`(`id`);
ALTER TABLE
    `tracker_log` ADD CONSTRAINT `tracker_log_session_id_foreign` FOREIGN KEY(`session_id`) REFERENCES `tracker_sessions`(`id`);
ALTER TABLE
    `tracker_sessions` ADD CONSTRAINT `tracker_sessions_referer_id_foreign` FOREIGN KEY(`referer_id`) REFERENCES `tracker_referers`(`id`);
ALTER TABLE
    `tracker_events_log` ADD CONSTRAINT `tracker_events_log_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `tracker_events`(`id`);
ALTER TABLE
    `tracker_sql_query_bindings_parameters` ADD CONSTRAINT `tracker_sql_query_bindings_parameters_sql_query_bindings_id_foreign` FOREIGN KEY(`sql_query_bindings_id`) REFERENCES `tracker_sql_query_bindings`(`id`);
ALTER TABLE
    `tracker_sessions` ADD CONSTRAINT `tracker_sessions_language_id_foreign` FOREIGN KEY(`language_id`) REFERENCES `tracker_languages`(`id`);
ALTER TABLE
    `tracker_sessions` ADD CONSTRAINT `tracker_sessions_geoip_id_foreign` FOREIGN KEY(`geoip_id`) REFERENCES `tracker_geoip`(`id`);
ALTER TABLE
    `tracker_sessions` ADD CONSTRAINT `tracker_sessions_cookie_id_foreign` FOREIGN KEY(`cookie_id`) REFERENCES `tracker_cookies`(`id`);
ALTER TABLE
    `tracker_query_arguments` ADD CONSTRAINT `tracker_query_arguments_query_id_foreign` FOREIGN KEY(`query_id`) REFERENCES `tracker_queries`(`id`);
ALTER TABLE
    `tracker_referers` ADD CONSTRAINT `tracker_referers_domain_id_foreign` FOREIGN KEY(`domain_id`) REFERENCES `tracker_domains`(`id`);
ALTER TABLE
    `tracker_log` ADD CONSTRAINT `tracker_log_error_id_foreign` FOREIGN KEY(`error_id`) REFERENCES `tracker_errors`(`id`);
ALTER TABLE
    `tracker_sql_queries_log` ADD CONSTRAINT `tracker_sql_queries_log_sql_query_id_foreign` FOREIGN KEY(`sql_query_id`) REFERENCES `tracker_sql_queries`(`id`);
ALTER TABLE
    `tracker_log` ADD CONSTRAINT `tracker_log_path_id_foreign` FOREIGN KEY(`path_id`) REFERENCES `tracker_paths`(`id`);
ALTER TABLE
    `tracker_sessions` ADD CONSTRAINT `tracker_sessions_device_id_foreign` FOREIGN KEY(`device_id`) REFERENCES `tracker_devices`(`id`);
ALTER TABLE
    `tracker_route_path_parameters` ADD CONSTRAINT `tracker_route_path_parameters_route_path_id_foreign` FOREIGN KEY(`route_path_id`) REFERENCES `tracker_route_paths`(`id`);
ALTER TABLE
    `tracker_sql_queries_log` ADD CONSTRAINT `tracker_sql_queries_log_log_id_foreign` FOREIGN KEY(`log_id`) REFERENCES `tracker_log`(`id`);
ALTER TABLE
    `tracker_events_log` ADD CONSTRAINT `tracker_events_log_class_id_foreign` FOREIGN KEY(`class_id`) REFERENCES `tracker_system_classes`(`id`);