CREATE TABLE `heya_campaign_memberships`(
    `id` BIGINT NOT NULL,
    `user_type` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `campaign_gid` VARCHAR(255) NOT NULL,
    `concurrent` TINYINT NOT NULL,
    `last_sent_at` DATETIME NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `heya_campaign_memberships` ADD UNIQUE `heya_campaign_memberships_user_type_user_id_campaign_gid_unique`(
        `user_type`,
        `user_id`,
        `campaign_gid`
    );
CREATE TABLE `heya_campaign_receipts`(
    `id` BIGINT NOT NULL,
    `user_type` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `step_gid` VARCHAR(255) NOT NULL,
    `sent_at` DATETIME NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `heya_campaign_receipts` ADD UNIQUE `heya_campaign_receipts_user_type_user_id_step_gid_unique`(`user_type`, `user_id`, `step_gid`);
CREATE TABLE `users`(
    `id` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `heya_campaign_memberships` ADD CONSTRAINT `heya_campaign_memberships_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `heya_campaign_receipts` ADD CONSTRAINT `heya_campaign_receipts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);