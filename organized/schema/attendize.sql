CREATE TABLE `account_payment_gateways`(
    `id` INT NOT NULL,
    `account_id` INT NOT NULL,
    `payment_gateway_id` INT NOT NULL,
    `config` TEXT NOT NULL,
    `deleted_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `accounts`(
    `id` INT NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `timezone_id` INT NULL,
    `date_format_id` INT NULL,
    `datetime_format_id` INT NULL,
    `currency_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `name` VARCHAR(255) NULL,
    `last_ip` VARCHAR(255) NULL,
    `last_login_date` TIMESTAMP NULL,
    `address1` VARCHAR(255) NULL,
    `address2` VARCHAR(255) NULL,
    `city` VARCHAR(255) NULL,
    `state` VARCHAR(255) NULL,
    `postal_code` VARCHAR(255) NULL,
    `country_id` INT NULL,
    `email_footer` TEXT NULL,
    `is_active` TINYINT NOT NULL,
    `is_banned` TINYINT NOT NULL,
    `is_beta` TINYINT NOT NULL,
    `stripe_access_token` VARCHAR(255) NULL,
    `stripe_refresh_token` VARCHAR(255) NULL,
    `stripe_secret_key` VARCHAR(255) NULL,
    `stripe_publishable_key` VARCHAR(255) NULL,
    `stripe_data_raw` TEXT NULL,
    `payment_gateway_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `affiliates`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `visits` INT NOT NULL,
    `tickets_sold` INT NOT NULL,
    `sales_volume` DECIMAL(8, 2) NOT NULL,
    `last_visit` TIMESTAMP NOT NULL,
    `account_id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `affiliates` ADD INDEX `affiliates_account_id_index`(`account_id`);
CREATE TABLE `attendees`(
    `id` INT NOT NULL,
    `order_id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `ticket_id` INT NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `private_reference_number` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `is_cancelled` TINYINT NOT NULL,
    `has_arrived` TINYINT NOT NULL,
    `arrival_time` DATETIME NULL,
    `account_id` INT NOT NULL,
    `reference_index` INT NOT NULL,
    `is_refunded` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `attendees` ADD INDEX `attendees_order_id_index`(`order_id`);
ALTER TABLE
    `attendees` ADD INDEX `attendees_event_id_index`(`event_id`);
ALTER TABLE
    `attendees` ADD INDEX `attendees_ticket_id_index`(`ticket_id`);
ALTER TABLE
    `attendees` ADD INDEX `attendees_private_reference_number_index`(`private_reference_number`);
ALTER TABLE
    `attendees` ADD INDEX `attendees_account_id_index`(`account_id`);
CREATE TABLE `countries`(
    `id` INT NOT NULL,
    `capital` VARCHAR(255) NULL,
    `citizenship` VARCHAR(255) NULL,
    `country_code` VARCHAR(255) NOT NULL,
    `currency` VARCHAR(255) NULL,
    `currency_code` VARCHAR(255) NULL,
    `currency_sub_unit` VARCHAR(255) NULL,
    `full_name` VARCHAR(255) NULL,
    `iso_3166_2` VARCHAR(255) NOT NULL,
    `iso_3166_3` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `region_code` VARCHAR(255) NOT NULL,
    `sub_region_code` VARCHAR(255) NOT NULL,
    `eea` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `currencies`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `symbol_left` VARCHAR(255) NOT NULL,
    `symbol_right` VARCHAR(255) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `decimal_place` INT NOT NULL,
    `value` DOUBLE NOT NULL,
    `decimal_point` VARCHAR(255) NOT NULL,
    `thousand_point` VARCHAR(255) NOT NULL,
    `status` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `date_formats`(
    `id` INT NOT NULL,
    `format` VARCHAR(255) NOT NULL,
    `picker_format` VARCHAR(255) NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `datetime_formats`(
    `id` INT NOT NULL,
    `format` VARCHAR(255) NOT NULL,
    `picker_format` VARCHAR(255) NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `event_access_codes`(
    `id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `usage_count` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `event_images`(
    `id` INT NOT NULL,
    `image_path` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `event_id` INT NOT NULL,
    `account_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `event_question`(
    `id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `question_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `event_question` ADD INDEX `event_question_event_id_index`(`event_id`);
ALTER TABLE
    `event_question` ADD INDEX `event_question_question_id_index`(`question_id`);
CREATE TABLE `event_stats`(
    `id` INT NOT NULL,
    `date` DATE NOT NULL,
    `views` INT NOT NULL,
    `unique_views` INT NOT NULL,
    `tickets_sold` INT NOT NULL,
    `sales_volume` DECIMAL(8, 2) NOT NULL,
    `organiser_fees_volume` DECIMAL(8, 2) NOT NULL,
    `event_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `event_stats` ADD INDEX `event_stats_event_id_index`(`event_id`);
CREATE TABLE `events`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NULL,
    `bg_type` VARCHAR(255) NOT NULL,
    `bg_color` VARCHAR(255) NOT NULL,
    `bg_image_path` VARCHAR(255) NULL,
    `description` TEXT NOT NULL,
    `start_date` DATETIME NULL,
    `end_date` DATETIME NULL,
    `on_sale_date` DATETIME NULL,
    `account_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `currency_id` INT NULL,
    `sales_volume` DECIMAL(8, 2) NOT NULL,
    `organiser_fees_volume` DECIMAL(8, 2) NOT NULL,
    `organiser_fee_fixed` DECIMAL(8, 2) NOT NULL,
    `organiser_fee_percentage` DECIMAL(8, 2) NOT NULL,
    `organiser_id` INT NOT NULL,
    `venue_name` VARCHAR(255) NOT NULL,
    `venue_name_full` VARCHAR(255) NULL,
    `location_address` VARCHAR(255) NULL,
    `location_address_line_1` VARCHAR(255) NOT NULL,
    `location_address_line_2` VARCHAR(255) NOT NULL,
    `location_country` VARCHAR(255) NULL,
    `location_country_code` VARCHAR(255) NULL,
    `location_state` VARCHAR(255) NOT NULL,
    `location_post_code` VARCHAR(255) NOT NULL,
    `location_street_number` VARCHAR(255) NULL,
    `location_lat` VARCHAR(255) NULL,
    `location_long` VARCHAR(255) NULL,
    `location_google_place_id` VARCHAR(255) NULL,
    `pre_order_display_message` TEXT NULL,
    `post_order_display_message` TEXT NULL,
    `social_share_text` TEXT NULL,
    `social_show_facebook` TINYINT NOT NULL,
    `social_show_linkedin` TINYINT NOT NULL,
    `social_show_twitter` TINYINT NOT NULL,
    `social_show_email` TINYINT NOT NULL,
    `social_show_googleplus` TINYINT NOT NULL,
    `location_is_manual` INT NOT NULL,
    `is_live` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `barcode_type` VARCHAR(255) NOT NULL,
    `ticket_border_color` VARCHAR(255) NOT NULL,
    `ticket_bg_color` VARCHAR(255) NOT NULL,
    `ticket_text_color` VARCHAR(255) NOT NULL,
    `ticket_sub_text_color` VARCHAR(255) NOT NULL,
    `google_tag_manager_code` VARCHAR(255) NULL,
    `social_show_whatsapp` TINYINT NOT NULL,
    `questions_collection_type` VARCHAR(255) NOT NULL,
    `checkout_timeout_after` INT NOT NULL,
    `is_1d_barcode_enabled` TINYINT NOT NULL,
    `enable_offline_payments` TINYINT NOT NULL,
    `offline_payment_instructions` TEXT NULL,
    `event_image_position` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `events` ADD INDEX `events_account_id_index`(`account_id`);
CREATE TABLE `failed_jobs`(
    `id` INT NOT NULL,
    `connection` TEXT NOT NULL,
    `queue` TEXT NOT NULL,
    `payload` TEXT NOT NULL,
    `failed_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `messages`(
    `id` INT NOT NULL,
    `message` TEXT NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `recipients` VARCHAR(255) NULL,
    `account_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `is_sent` INT NOT NULL,
    `sent_at` DATETIME NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `messages` ADD INDEX `messages_account_id_index`(`account_id`);
CREATE TABLE `order_items`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL,
    `unit_price` DECIMAL(8, 2) NOT NULL,
    `unit_booking_fee` DECIMAL(8, 2) NULL,
    `order_id` INT NOT NULL,
    `deleted_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `order_statuses`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `orders`(
    `id` INT NOT NULL,
    `account_id` INT NOT NULL,
    `order_status_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `business_name` VARCHAR(255) NULL,
    `business_tax_number` VARCHAR(255) NULL,
    `business_address_line_one` VARCHAR(255) NULL,
    `business_address_line_two` VARCHAR(255) NULL,
    `business_address_state_province` VARCHAR(255) NULL,
    `business_address_city` VARCHAR(255) NULL,
    `ticket_pdf_path` VARCHAR(255) NULL,
    `order_reference` VARCHAR(255) NOT NULL,
    `transaction_id` VARCHAR(255) NULL,
    `discount` DECIMAL(8, 2) NULL,
    `booking_fee` DECIMAL(8, 2) NULL,
    `organiser_booking_fee` DECIMAL(8, 2) NULL,
    `order_date` DATE NULL,
    `notes` TEXT NULL,
    `is_deleted` TINYINT NOT NULL,
    `is_cancelled` TINYINT NOT NULL,
    `is_partially_refunded` TINYINT NOT NULL,
    `is_refunded` TINYINT NOT NULL,
    `amount` DECIMAL(8, 2) NOT NULL,
    `amount_refunded` DECIMAL(8, 2) NULL,
    `event_id` INT NOT NULL,
    `payment_gateway_id` INT NULL,
    `is_payment_received` TINYINT NOT NULL,
    `is_business` TINYINT NOT NULL,
    `taxamt` DOUBLE NOT NULL,
    `business_address_code` VARCHAR(255) NULL,
    `payment_intent` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `orders` ADD INDEX `orders_account_id_index`(`account_id`);
ALTER TABLE
    `orders` ADD INDEX `orders_event_id_index`(`event_id`);
CREATE TABLE `organisers`(
    `id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `account_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `about` TEXT NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NULL,
    `confirmation_key` VARCHAR(255) NOT NULL,
    `facebook` VARCHAR(255) NOT NULL,
    `twitter` VARCHAR(255) NOT NULL,
    `logo_path` VARCHAR(255) NULL,
    `is_email_confirmed` TINYINT NOT NULL,
    `show_twitter_widget` TINYINT NOT NULL,
    `show_facebook_widget` TINYINT NOT NULL,
    `page_header_bg_color` VARCHAR(255) NOT NULL,
    `page_bg_color` VARCHAR(255) NOT NULL,
    `page_text_color` VARCHAR(255) NOT NULL,
    `enable_organiser_page` TINYINT NOT NULL,
    `google_analytics_code` VARCHAR(255) NULL,
    `google_tag_manager_code` VARCHAR(255) NULL,
    `tax_name` VARCHAR(255) NOT NULL,
    `tax_value` DOUBLE NOT NULL,
    `tax_id` VARCHAR(255) NOT NULL,
    `charge_tax` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `organisers` ADD INDEX `organisers_account_id_index`(`account_id`);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_email_index`(`email`);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_token_index`(`token`);
CREATE TABLE `payment_gateways`(
    `id` INT NOT NULL,
    `provider_name` VARCHAR(255) NOT NULL,
    `provider_url` VARCHAR(255) NOT NULL,
    `is_on_site` TINYINT NOT NULL,
    `can_refund` TINYINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `default` TINYINT NOT NULL,
    `admin_blade_template` VARCHAR(255) NOT NULL,
    `checkout_blade_template` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `question_answers`(
    `id` INT NOT NULL,
    `attendee_id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `question_id` INT NOT NULL,
    `account_id` INT NOT NULL,
    `answer_text` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `question_answers` ADD INDEX `question_answers_attendee_id_index`(`attendee_id`);
ALTER TABLE
    `question_answers` ADD INDEX `question_answers_event_id_index`(`event_id`);
ALTER TABLE
    `question_answers` ADD INDEX `question_answers_question_id_index`(`question_id`);
ALTER TABLE
    `question_answers` ADD INDEX `question_answers_account_id_index`(`account_id`);
CREATE TABLE `question_options`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `question_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `question_options` ADD INDEX `question_options_question_id_index`(`question_id`);
CREATE TABLE `question_ticket`(
    `id` INT NOT NULL,
    `question_id` INT NOT NULL,
    `ticket_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `question_ticket` ADD INDEX `question_ticket_question_id_index`(`question_id`);
ALTER TABLE
    `question_ticket` ADD INDEX `question_ticket_ticket_id_index`(`ticket_id`);
CREATE TABLE `question_types`(
    `id` INT NOT NULL,
    `alias` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `has_options` TINYINT NOT NULL,
    `allow_multiple` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `questions`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `question_type_id` INT NOT NULL,
    `account_id` INT NOT NULL,
    `is_required` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `sort_order` INT NOT NULL,
    `is_enabled` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `questions` ADD INDEX `questions_account_id_index`(`account_id`);
CREATE TABLE `reserved_tickets`(
    `id` INT NOT NULL,
    `ticket_id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `quantity_reserved` INT NOT NULL,
    `expires` DATETIME NOT NULL,
    `session_id` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `ticket_event_access_code`(
    `id` INT NOT NULL,
    `ticket_id` INT NOT NULL,
    `event_access_code_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `ticket_order`(
    `id` INT NOT NULL,
    `order_id` INT NOT NULL,
    `ticket_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `ticket_order` ADD INDEX `ticket_order_order_id_index`(`order_id`);
ALTER TABLE
    `ticket_order` ADD INDEX `ticket_order_ticket_id_index`(`ticket_id`);
CREATE TABLE `ticket_statuses`(
    `id` INT NOT NULL,
    `name` TEXT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `tickets`(
    `id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `edited_by_user_id` INT NULL,
    `account_id` INT NOT NULL,
    `order_id` INT NULL,
    `event_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `max_per_person` INT NULL,
    `min_per_person` INT NULL,
    `quantity_available` INT NULL,
    `quantity_sold` INT NOT NULL,
    `start_sale_date` DATETIME NULL,
    `end_sale_date` DATETIME NULL,
    `sales_volume` DECIMAL(8, 2) NOT NULL,
    `organiser_fees_volume` DECIMAL(8, 2) NOT NULL,
    `is_paused` TINYINT NOT NULL,
    `public_id` INT NULL,
    `user_id` INT NOT NULL,
    `sort_order` INT NOT NULL,
    `is_hidden` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `tickets` ADD INDEX `tickets_account_id_index`(`account_id`);
ALTER TABLE
    `tickets` ADD INDEX `tickets_event_id_index`(`event_id`);
ALTER TABLE
    `tickets` ADD INDEX `tickets_public_id_index`(`public_id`);
CREATE TABLE `timezones`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `account_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `deleted_at` TIMESTAMP NULL,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `confirmation_code` VARCHAR(255) NOT NULL,
    `is_registered` TINYINT NOT NULL,
    `is_confirmed` TINYINT NOT NULL,
    `is_parent` TINYINT NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `api_token` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD INDEX `users_account_id_index`(`account_id`);
ALTER TABLE
    `users` ADD UNIQUE `users_api_token_unique`(`api_token`);
ALTER TABLE
    `organisers` ADD CONSTRAINT `organisers_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `event_question` ADD CONSTRAINT `event_question_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `accounts` ADD CONSTRAINT `accounts_date_format_id_foreign` FOREIGN KEY(`date_format_id`) REFERENCES `date_formats`(`id`);
ALTER TABLE
    `question_answers` ADD CONSTRAINT `question_answers_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `question_ticket` ADD CONSTRAINT `question_ticket_question_id_foreign` FOREIGN KEY(`question_id`) REFERENCES `questions`(`id`);
ALTER TABLE
    `affiliates` ADD CONSTRAINT `affiliates_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `questions` ADD CONSTRAINT `questions_question_type_id_foreign` FOREIGN KEY(`question_type_id`) REFERENCES `question_types`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_currency_id_foreign` FOREIGN KEY(`currency_id`) REFERENCES `currencies`(`id`);
ALTER TABLE
    `question_options` ADD CONSTRAINT `question_options_question_id_foreign` FOREIGN KEY(`question_id`) REFERENCES `questions`(`id`);
ALTER TABLE
    `affiliates` ADD CONSTRAINT `affiliates_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `question_answers` ADD CONSTRAINT `question_answers_attendee_id_foreign` FOREIGN KEY(`attendee_id`) REFERENCES `attendees`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `accounts` ADD CONSTRAINT `accounts_currency_id_foreign` FOREIGN KEY(`currency_id`) REFERENCES `currencies`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `tickets` ADD CONSTRAINT `tickets_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `attendees` ADD CONSTRAINT `attendees_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `tickets` ADD CONSTRAINT `tickets_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`);
ALTER TABLE
    `question_answers` ADD CONSTRAINT `question_answers_question_id_foreign` FOREIGN KEY(`question_id`) REFERENCES `questions`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY(`order_status_id`) REFERENCES `order_statuses`(`id`);
ALTER TABLE
    `reserved_tickets` ADD CONSTRAINT `reserved_tickets_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_payment_gateway_id_foreign` FOREIGN KEY(`payment_gateway_id`) REFERENCES `payment_gateways`(`id`);
ALTER TABLE
    `account_payment_gateways` ADD CONSTRAINT `account_payment_gateways_payment_gateway_id_foreign` FOREIGN KEY(`payment_gateway_id`) REFERENCES `payment_gateways`(`id`);
ALTER TABLE
    `account_payment_gateways` ADD CONSTRAINT `account_payment_gateways_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `ticket_order` ADD CONSTRAINT `ticket_order_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`);
ALTER TABLE
    `accounts` ADD CONSTRAINT `accounts_country_id_foreign` FOREIGN KEY(`country_id`) REFERENCES `countries`(`id`);
ALTER TABLE
    `event_images` ADD CONSTRAINT `event_images_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `attendees` ADD CONSTRAINT `attendees_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`);
ALTER TABLE
    `attendees` ADD CONSTRAINT `attendees_ticket_id_foreign` FOREIGN KEY(`ticket_id`) REFERENCES `tickets`(`id`);
ALTER TABLE
    `event_images` ADD CONSTRAINT `event_images_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `ticket_event_access_code` ADD CONSTRAINT `ticket_event_access_code_event_access_code_id_foreign` FOREIGN KEY(`event_access_code_id`) REFERENCES `event_access_codes`(`id`);
ALTER TABLE
    `accounts` ADD CONSTRAINT `accounts_datetime_format_id_foreign` FOREIGN KEY(`datetime_format_id`) REFERENCES `datetime_formats`(`id`);
ALTER TABLE
    `tickets` ADD CONSTRAINT `tickets_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `question_ticket` ADD CONSTRAINT `question_ticket_ticket_id_foreign` FOREIGN KEY(`ticket_id`) REFERENCES `tickets`(`id`);
ALTER TABLE
    `accounts` ADD CONSTRAINT `accounts_payment_gateway_id_foreign` FOREIGN KEY(`payment_gateway_id`) REFERENCES `payment_gateways`(`id`);
ALTER TABLE
    `order_items` ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `ticket_order` ADD CONSTRAINT `ticket_order_ticket_id_foreign` FOREIGN KEY(`ticket_id`) REFERENCES `tickets`(`id`);
ALTER TABLE
    `tickets` ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `question_answers` ADD CONSTRAINT `question_answers_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `reserved_tickets` ADD CONSTRAINT `reserved_tickets_ticket_id_foreign` FOREIGN KEY(`ticket_id`) REFERENCES `tickets`(`id`);
ALTER TABLE
    `accounts` ADD CONSTRAINT `accounts_timezone_id_foreign` FOREIGN KEY(`timezone_id`) REFERENCES `timezones`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_organiser_id_foreign` FOREIGN KEY(`organiser_id`) REFERENCES `organisers`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `event_images` ADD CONSTRAINT `event_images_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `event_stats` ADD CONSTRAINT `event_stats_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `attendees` ADD CONSTRAINT `attendees_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `questions` ADD CONSTRAINT `questions_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `event_question` ADD CONSTRAINT `event_question_question_id_foreign` FOREIGN KEY(`question_id`) REFERENCES `questions`(`id`);
ALTER TABLE
    `question_answers` ADD CONSTRAINT `question_answers_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE
    `ticket_event_access_code` ADD CONSTRAINT `ticket_event_access_code_ticket_id_foreign` FOREIGN KEY(`ticket_id`) REFERENCES `tickets`(`id`);
ALTER TABLE
    `event_access_codes` ADD CONSTRAINT `event_access_codes_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);