CREATE TABLE `alert_acknowledgement`(
    `id` INT NOT NULL,
    `time` DATETIME NOT NULL,
    `cancelled_time` DATETIME NULL,
    `cancelled_user_id` INT NOT NULL,
    `service_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `alert_plugin`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `enabled` BOOLEAN NOT NULL,
    `polumorphic_ctype` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `alert_plugin` ADD UNIQUE `alert_plugin_title_unique`(`title`);
CREATE TABLE `alert_plugin_user_data`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `polymorphic_ctype` INT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `alert_plugin_user_data` ADD UNIQUE `alert_plugin_user_data_title_user_id_unique`(`title`, `user_id`);
CREATE TABLE `instance`(
    `id` INT NOT NULL,
    `name` TEXT NOT NULL,
    `alerts_enabled` BOOLEAN NOT NULL,
    `last_alert_sent` DATETIME NULL,
    `email_alert` BOOLEAN NOT NULL,
    `hipchat_alert` BOOLEAN NOT NULL,
    `sms_alert` BOOLEAN NOT NULL,
    `telephone_alert` BOOLEAN NOT NULL,
    `overall_status` TEXT NOT NULL,
    `old_overall_status` TEXT NOT NULL,
    `hackpad_id` TEXT NOT NULL,
    `runbook_link` TEXT NOT NULL,
    `address` TEXT NOT NULL,
    `alerts` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `alert_plugin_instance`(
    `id` INT NOT NULL,
    `alert_plugin_id` INT NOT NULL,
    `instance_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `instance_status_snapshot`(
    `id` INT NOT NULL,
    `time` DATETIME NOT NULL,
    `num_checks_active` INT NOT NULL,
    `num_checks_passing` INT NOT NULL,
    `num_checks_failing` INT NOT NULL,
    `overall_status` TEXT NOT NULL,
    `did_send_alert` INT NOT NULL,
    `instance_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `service`(
    `id` INT NOT NULL,
    `name` TEXT NOT NULL,
    `alerts_enabled` BOOLEAN NOT NULL,
    `last_alert_sent` DATETIME NULL,
    `email_alert` BOOLEAN NOT NULL,
    `hipchat_alert` BOOLEAN NOT NULL,
    `sms_alert` BOOLEAN NOT NULL,
    `telephone_alert` BOOLEAN NOT NULL,
    `overall_status` TEXT NOT NULL,
    `old_overall_status` TEXT NOT NULL,
    `hackpad_id` TEXT NOT NULL,
    `runbook_link` TEXT NOT NULL,
    `url` TEXT NOT NULL,
    `alerts` INT NOT NULL,
    `instances` INT NOT NULL,
    `is_public` BOOLEAN NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `alert_plugin_service`(
    `id` INT NOT NULL,
    `alert_plugin_id` INT NOT NULL,
    `service_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `instance_service`(
    `id` INT NOT NULL,
    `instance_id` INT NOT NULL,
    `service_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `service_status_snapshot`(
    `id` INT NOT NULL,
    `time` DATETIME NOT NULL,
    `num_checks_active` INT NOT NULL,
    `num_checks_passing` INT NOT NULL,
    `num_checks_failing` INT NOT NULL,
    `overall_status` TEXT NOT NULL,
    `did_send_alert` INT NOT NULL,
    `service_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `shift`(
    `id` INT NOT NULL,
    `start` DATETIME NOT NULL,
    `end` DATETIME NOT NULL,
    `uid` TEXT NOT NULL,
    `last_modified` DATETIME NOT NULL,
    `deleted` BOOLEAN NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `user`(
    `id` INT NOT NULL,
    `username` TEXT NOT NULL,
    `first_name` TEXT NULL,
    `last_name` TEXT NULL,
    `email` TEXT NULL,
    `password` TEXT NOT NULL,
    `is_staff` BOOLEAN NOT NULL,
    `is_active` BOOLEAN NOT NULL,
    `is_superuser` BOOLEAN NOT NULL,
    `last_login` DATETIME NOT NULL,
    `date_joined` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `status_check`(
    `id` INT NOT NULL,
    `name` TEXT NOT NULL,
    `active` BOOLEAN NOT NULL,
    `importance` VARCHAR(255) NOT NULL,
    `frequency` INT NOT NULL,
    `debounce` INT NULL,
    `calculated_status` VARCHAR(255) NOT NULL,
    `last_run` DATETIME NULL,
    `cached_health` TEXT NULL,
    `metric` TEXT NULL,
    `check_type` VARCHAR(255) NULL,
    `value` TEXT NULL,
    `expected_num_hosts` INT NULL,
    `allowed_num_failures` INT NULL,
    `endpoint` TEXT NULL,
    `username` TEXT NULL,
    `password` TEXT NULL,
    `text_match` TEXT NULL,
    `status_code` TEXT NULL,
    `timeout` INT NULL,
    `verify_ssl_certificate` BOOLEAN NOT NULL,
    `max_queued_build_time` INT NULL,
    `created_by` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `status_check_result`(
    `id` INT NOT NULL,
    `time` DATETIME NOT NULL,
    `time_complete` DATETIME NULL,
    `raw_data` TEXT NULL,
    `succeeded` BOOLEAN NOT NULL,
    `error` TEXT NULL,
    `job_number` INT NULL,
    `status_check_id` INT NOT NULL,
    `consecutive_failures` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `status_check_result` ADD INDEX `status_check_result_status_check_id_time_complete_index`(`status_check_id`, `time_complete`);
ALTER TABLE
    `status_check_result` ADD INDEX `status_check_result_status_check_id_id_index`(`status_check_id`, `id`);
CREATE TABLE `user_profile`(
    `id` INT NOT NULL,
    `mobile_number` VARCHAR(255) NOT NULL,
    `hipchat_alias` VARCHAR(255) NOT NULL,
    `fallback_alert_user` BOOLEAN NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `service_status_check`(
    `id` INT NOT NULL,
    `service_id` INT NOT NULL,
    `status_check_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `service_user`(
    `id` INT NOT NULL,
    `service_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `instance_status_check`(
    `id` INT NOT NULL,
    `status_check_id` INT NOT NULL,
    `instance_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `instance_users`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `instance_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `graphite_status_check`();
CREATE TABLE `http_status_check`();
CREATE TABLE `icmp_status_check`();
CREATE TABLE `jenkins_status_check`(
    `statuscheck_ptr_id` INT NOT NULL,
    `jenkins_config_id` INT NOT NULL,
    PRIMARY KEY(`statuscheck_ptr_id`)
);
CREATE TABLE `jenkins_config`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `jenkins_api` VARCHAR(255) NOT NULL,
    `jenkins_user` VARCHAR(255) NOT NULL,
    `jenkins_pass` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `instance_status_check` ADD CONSTRAINT `instance_status_check_status_check_id_foreign` FOREIGN KEY(`status_check_id`) REFERENCES `status_check`(`id`);
ALTER TABLE
    `service_status_check` ADD CONSTRAINT `service_status_check_status_check_id_foreign` FOREIGN KEY(`status_check_id`) REFERENCES `status_check`(`id`);
ALTER TABLE
    `instance_users` ADD CONSTRAINT `instance_users_instance_id_foreign` FOREIGN KEY(`instance_id`) REFERENCES `instance`(`id`);
ALTER TABLE
    `status_check_result` ADD CONSTRAINT `status_check_result_status_check_id_foreign` FOREIGN KEY(`status_check_id`) REFERENCES `status_check`(`id`);
ALTER TABLE
    `status_check` ADD CONSTRAINT `status_check_created_by_foreign` FOREIGN KEY(`created_by`) REFERENCES `user`(`id`);
ALTER TABLE
    `shift` ADD CONSTRAINT `shift_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `instance_service` ADD CONSTRAINT `instance_service_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `service`(`id`);
ALTER TABLE
    `service_user` ADD CONSTRAINT `service_user_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `service`(`id`);
ALTER TABLE
    `alert_acknowledgement` ADD CONSTRAINT `alert_acknowledgement_cancelled_user_id_foreign` FOREIGN KEY(`cancelled_user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `instance_service` ADD CONSTRAINT `instance_service_instance_id_foreign` FOREIGN KEY(`instance_id`) REFERENCES `instance`(`id`);
ALTER TABLE
    `instance_status_snapshot` ADD CONSTRAINT `instance_status_snapshot_instance_id_foreign` FOREIGN KEY(`instance_id`) REFERENCES `instance`(`id`);
ALTER TABLE
    `alert_plugin_instance` ADD CONSTRAINT `alert_plugin_instance_alert_plugin_id_foreign` FOREIGN KEY(`alert_plugin_id`) REFERENCES `alert_plugin`(`id`);
ALTER TABLE
    `service_status_snapshot` ADD CONSTRAINT `service_status_snapshot_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `service`(`id`);
ALTER TABLE
    `alert_acknowledgement` ADD CONSTRAINT `alert_acknowledgement_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `service`(`id`);
ALTER TABLE
    `alert_plugin_service` ADD CONSTRAINT `alert_plugin_service_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `service`(`id`);
ALTER TABLE
    `jenkins_status_check` ADD CONSTRAINT `jenkins_status_check_jenkins_config_id_foreign` FOREIGN KEY(`jenkins_config_id`) REFERENCES `jenkins_config`(`id`);
ALTER TABLE
    `service_user` ADD CONSTRAINT `service_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `alert_plugin_instance` ADD CONSTRAINT `alert_plugin_instance_instance_id_foreign` FOREIGN KEY(`instance_id`) REFERENCES `instance`(`id`);
ALTER TABLE
    `service_status_check` ADD CONSTRAINT `service_status_check_service_id_foreign` FOREIGN KEY(`service_id`) REFERENCES `service`(`id`);
ALTER TABLE
    `user_profile` ADD CONSTRAINT `user_profile_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `alert_plugin_user_data` ADD CONSTRAINT `alert_plugin_user_data_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user_profile`(`id`);
ALTER TABLE
    `alert_plugin_service` ADD CONSTRAINT `alert_plugin_service_alert_plugin_id_foreign` FOREIGN KEY(`alert_plugin_id`) REFERENCES `alert_plugin`(`id`);
ALTER TABLE
    `instance_users` ADD CONSTRAINT `instance_users_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `status_check` ADD CONSTRAINT `status_check_id_foreign` FOREIGN KEY(`id`) REFERENCES `jenkins_status_check`(`statuscheck_ptr_id`);
ALTER TABLE
    `alert_acknowledgement` ADD CONSTRAINT `alert_acknowledgement_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `instance_status_check` ADD CONSTRAINT `instance_status_check_instance_id_foreign` FOREIGN KEY(`instance_id`) REFERENCES `instance`(`id`);