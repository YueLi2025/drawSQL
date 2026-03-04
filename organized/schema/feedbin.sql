CREATE TABLE "actions"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NULL,
    "query" TEXT NULL,
    "actions" TEXT NULL,
    "feed_ids" TEXT NULL,
    "all_feeds" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "title" TEXT NULL,
    "tag_ids" BIGINT NULL,
    "action_type" BIGINT NULL,
    "computed_feed_ids" BIGINT NULL,
    "status" BIGINT NULL
);
CREATE TABLE "authentication_tokens"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "token" TEXT NOT NULL,
    "purpose" INTEGER NOT NULL,
    "data" jsonb NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "active" BOOLEAN NOT NULL
);
CREATE INDEX "authentication_tokens_purpose_token_active_index" ON
    "authentication_tokens"("purpose", "token", "active");
ALTER TABLE
    "authentication_tokens" ADD CONSTRAINT "authentication_tokens_purpose_token_unique" UNIQUE("purpose", "token");
CREATE INDEX "authentication_tokens_user_id_index" ON
    "authentication_tokens"("user_id");
CREATE TABLE "billing_events"(
    "id" BIGINT NOT NULL,
    "details" TEXT NULL,
    "event_type" VARCHAR(255) NULL,
    "billable_id" BIGINT NULL,
    "billable_type" VARCHAR(255) NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "event_id" VARCHAR(255) NOT NULL,
    "info" JSON NOT NULL
);
CREATE INDEX "billing_events_billable_id_billable_type_index" ON
    "billing_events"("billable_id", "billable_type");
ALTER TABLE
    "billing_events" ADD CONSTRAINT "billing_events_event_id_unique" UNIQUE("event_id");
CREATE TABLE "coupons"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NULL,
    "coupon_code" VARCHAR(255) NULL,
    "sent_to" VARCHAR(255) NULL,
    "redeemed" BOOLEAN NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE INDEX "coupons_user_id_index" ON
    "coupons"("user_id");
CREATE TABLE "deleted_users"(
    "id" BIGINT NOT NULL,
    "email" TEXT NULL,
    "customer_id" TEXT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE INDEX "deleted_users_email_index" ON
    "deleted_users"("email");
CREATE TABLE "devices"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NULL,
    "token" TEXT NULL,
    "model" TEXT NULL,
    "device_type" BIGINT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "operating_system" TEXT NOT NULL
);
CREATE INDEX "devices_user_id_index" ON
    "devices"("user_id");
ALTER TABLE
    "devices" ADD CONSTRAINT "devices_token_unique" UNIQUE("token");
CREATE TABLE "entries"(
    "id" BIGINT NOT NULL,
    "feed_id" BIGINT NULL,
    "title" TEXT NULL,
    "url" TEXT NULL,
    "author" TEXT NULL,
    "summary" TEXT NULL,
    "content" TEXT NULL,
    "published" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "entry_id" TEXT NULL,
    "public_id" VARCHAR(255) NULL,
    "old_public_id" VARCHAR(255) NULL,
    "starred_entreis_count" BIGINT NOT NULL,
    "data" JSON NULL,
    "original" JSON NULL,
    "source" TEXT NULL,
    "image_url" TEXT NULL,
    "processed_image_url" TEXT NULL,
    "image" JSON NULL,
    "recently_played_entries_count" BIGINT NULL,
    "thread_id" BIGINT NULL,
    "settings" jsonb NULL
);
CREATE INDEX "entries_feed_id_index" ON
    "entries"("feed_id");
ALTER TABLE
    "entries" ADD CONSTRAINT "entries_public_id_unique" UNIQUE("public_id");
CREATE INDEX "entries_thread_id_index" ON
    "entries"("thread_id");
CREATE TABLE "favicons"(
    "id" BIGINT NOT NULL,
    "host" TEXT NULL,
    "favicon" TEXT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "data" JSON NULL,
    "url" VARCHAR(255) NULL
);
ALTER TABLE
    "favicons" ADD CONSTRAINT "favicons_host_unique" UNIQUE("host");
CREATE TABLE "feed_stats"(
    "id" BIGINT NOT NULL,
    "feed_id" BIGINT NULL,
    "day" DATE NULL,
    "entries_count" BIGINT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE INDEX "feed_stats_feed_id_day_index" ON
    "feed_stats"("feed_id", "day");
CREATE INDEX "feed_stats_feed_id_index" ON
    "feed_stats"("feed_id");
CREATE TABLE "feeds"(
    "id" BIGINT NOT NULL,
    "title" TEXT NULL,
    "feed_url" TEXT NULL,
    "site_url" TEXT NULL,
    "etag" TEXT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "last_modified" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "subscriptions_count" BIGINT NOT NULL,
    "protected" BOOLEAN NOT NULL,
    "push_expiration" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "last_published_entry" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "host" TEXT NULL,
    "self_url" TEXT NULL,
    "feed_type" BIGINT NULL,
    "active" BOOLEAN NOT NULL,
    "options" JSON NULL
);
ALTER TABLE
    "feeds" ADD CONSTRAINT "feeds_feed_url_unique" UNIQUE("feed_url");
CREATE INDEX "feeds_last_published_entry_index" ON
    "feeds"("last_published_entry");
CREATE INDEX "feeds_host_index" ON
    "feeds"("host");
CREATE INDEX "feeds_feed_type_index" ON
    "feeds"("feed_type");
CREATE INDEX "feeds_active_index" ON
    "feeds"("active");
CREATE TABLE "import_items"(
    "id" BIGINT NOT NULL,
    "import_id" BIGINT NULL,
    "details" TEXT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "item_type" VARCHAR(255) NULL,
    "status" BIGINT NOT NULL
);
CREATE INDEX "import_items_import_id_status_index" ON
    "import_items"("import_id", "status");
CREATE INDEX "import_items_import_id_index" ON
    "import_items"("import_id");
CREATE TABLE "imports"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NULL,
    "complete" BOOLEAN NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "upload" VARCHAR(255) NULL
);
CREATE TABLE "in_app_purchases"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NULL,
    "transaction_id" TEXT NULL,
    "purchase_date" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "receipt" JSON NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "response" JSON NULL
);
CREATE INDEX "in_app_purchases_user_id_index" ON
    "in_app_purchases"("user_id");
ALTER TABLE
    "in_app_purchases" ADD CONSTRAINT "in_app_purchases_transaction_id_unique" UNIQUE("transaction_id");
CREATE TABLE "newsletter_senders"(
    "id" BIGINT NOT NULL,
    "feed_id" BIGINT NOT NULL,
    "active" BOOLEAN NOT NULL,
    "token" TEXT NOT NULL,
    "full_token" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "newsletter_senders" ADD CONSTRAINT "newsletter_senders_feed_id_unique" UNIQUE("feed_id");
CREATE INDEX "newsletter_senders_token_index" ON
    "newsletter_senders"("token");
CREATE TABLE "plans"(
    "id" BIGINT NOT NULL,
    "stripe_id" VARCHAR(255) NULL,
    "name" VARCHAR(255) NULL,
    "price" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "price_tier" BIGINT NULL
);
CREATE TABLE "recently_played_entries"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "entry_id" BIGINT NOT NULL,
    "progress" BIGINT NOT NULL,
    "duration" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "recently_played_entries" ADD CONSTRAINT "recently_played_entries_user_id_entry_id_unique" UNIQUE("user_id", "entry_id");
CREATE INDEX "recently_played_entries_user_id_created_at_index" ON
    "recently_played_entries"("user_id", "created_at");
CREATE INDEX "recently_played_entries_user_id_index" ON
    "recently_played_entries"("user_id");
CREATE INDEX "recently_played_entries_entry_id_index" ON
    "recently_played_entries"("entry_id");
CREATE TABLE "recently_read_entries"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NULL,
    "entry_id" BIGINT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL
);
CREATE INDEX "recently_read_entries_user_id_id_index" ON
    "recently_read_entries"("user_id", "id");
ALTER TABLE
    "recently_read_entries" ADD CONSTRAINT "recently_read_entries_user_id_entry_id_unique" UNIQUE("user_id", "entry_id");
CREATE INDEX "recently_read_entries_user_id_index" ON
    "recently_read_entries"("user_id");
CREATE INDEX "recently_read_entries_entry_id_index" ON
    "recently_read_entries"("entry_id");
CREATE INDEX "recently_read_entries_created_at_index" ON
    "recently_read_entries"("created_at");
CREATE TABLE "saved_searches"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "query" TEXT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL
);
CREATE INDEX "saved_searches_user_id_index" ON
    "saved_searches"("user_id");
CREATE TABLE "sharing_services"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NULL,
    "label" TEXT NULL,
    "url" TEXT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL
);
CREATE INDEX "sharing_services_user_id_index" ON
    "sharing_services"("user_id");
CREATE TABLE "starred_entries"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NULL,
    "feed_id" BIGINT NULL,
    "entry_id" BIGINT NULL,
    "published" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "source" TEXT NULL
);
ALTER TABLE
    "starred_entries" ADD CONSTRAINT "starred_entries_user_id_entry_id_unique" UNIQUE("user_id", "entry_id");
CREATE INDEX "starred_entries_user_id_index" ON
    "starred_entries"("user_id");
CREATE INDEX "starred_entries_feed_id_index" ON
    "starred_entries"("feed_id");
CREATE INDEX "starred_entries_entry_id_index" ON
    "starred_entries"("entry_id");
CREATE INDEX "starred_entries_published_index" ON
    "starred_entries"("published");
CREATE TABLE "subscriptions"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NULL,
    "feed_id" BIGINT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "title" TEXT NULL,
    "view_inline" BOOLEAN NOT NULL,
    "active" BOOLEAN NOT NULL,
    "push" BOOLEAN NOT NULL,
    "show_updates" BOOLEAN NOT NULL,
    "muted" BOOLEAN NOT NULL,
    "show_retweets" BOOLEAN NOT NULL,
    "media_only" BOOLEAN NOT NULL,
    "kind" BIGINT NULL,
    "view_mode" BIGINT NULL
);
ALTER TABLE
    "subscriptions" ADD CONSTRAINT "subscriptions_user_id_feed_id_unique" UNIQUE("user_id", "feed_id");
CREATE INDEX "subscriptions_feed_id_active_muted_show_updates_index" ON
    "subscriptions"(
        "feed_id",
        "active",
        "muted",
        "show_updates"
    );
CREATE INDEX "subscriptions_feed_id_active_muted_index" ON
    "subscriptions"("feed_id", "active", "muted");
CREATE INDEX "subscriptions_user_id_index" ON
    "subscriptions"("user_id");
CREATE INDEX "subscriptions_feed_id_index" ON
    "subscriptions"("feed_id");
CREATE INDEX "subscriptions_created_at_index" ON
    "subscriptions"("created_at");
CREATE INDEX "subscriptions_show_retweets_index" ON
    "subscriptions"("show_retweets");
CREATE INDEX "subscriptions_media_only_index" ON
    "subscriptions"("media_only");
CREATE INDEX "subscriptions_kind_index" ON
    "subscriptions"("kind");
CREATE TABLE "suggested_categories"(
    "id" BIGINT NOT NULL,
    "name" TEXT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL
);
CREATE TABLE "suggested_feeds"(
    "id" BIGINT NOT NULL,
    "suggested_category_id" BIGINT NULL,
    "feed_id" BIGINT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE INDEX "suggested_feeds_suggested_category_id_index" ON
    "suggested_feeds"("suggested_category_id");
CREATE INDEX "suggested_feeds_feed_id_index" ON
    "suggested_feeds"("feed_id");
CREATE TABLE "supported_sharing_services"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "service_id" VARCHAR(255) NOT NULL,
    "settings" JSON NULL,
    "service_options" JSON NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL
);
ALTER TABLE
    "supported_sharing_services" ADD CONSTRAINT "supported_sharing_services_user_id_service_id_unique" UNIQUE("user_id", "service_id");
CREATE INDEX "supported_sharing_services_user_id_index" ON
    "supported_sharing_services"("user_id");
CREATE TABLE "taggings"(
    "id" BIGINT NOT NULL,
    "feed_id" BIGINT NULL,
    "user_id" BIGINT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "tag_id" BIGINT NULL
);
CREATE INDEX "taggings_user_id_tag_id_index" ON
    "taggings"("user_id", "tag_id");
CREATE INDEX "taggings_user_id_feed_id_index" ON
    "taggings"("user_id", "feed_id");
CREATE INDEX "taggings_user_id_index" ON
    "taggings"("user_id");
CREATE INDEX "taggings_tag_id_index" ON
    "taggings"("tag_id");
CREATE TABLE "tags"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE INDEX "tags_name_index" ON
    "tags"("name");
CREATE TABLE "unreads"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "feed_id" BIGINT NOT NULL,
    "entry_id" BIGINT NOT NULL,
    "published" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "entry_created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE INDEX "unreads_user_id_published_index" ON
    "unreads"("user_id", "published");
CREATE INDEX "unreads_user_id_feed_id_published_index" ON
    "unreads"("user_id", "feed_id", "published");
ALTER TABLE
    "unreads" ADD CONSTRAINT "unreads_user_id_entry_id_unique" UNIQUE("user_id", "entry_id");
CREATE INDEX "unreads_user_id_created_at_index" ON
    "unreads"("user_id", "created_at");
CREATE INDEX "unreads_user_id_index" ON
    "unreads"("user_id");
CREATE INDEX "unreads_feed_id_index" ON
    "unreads"("feed_id");
CREATE INDEX "unreads_entry_id_index" ON
    "unreads"("entry_id");
CREATE TABLE "updated_entries"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NULL,
    "entry_id" BIGINT NULL,
    "feed_id" BIGINT NULL,
    "published" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL
);
ALTER TABLE
    "updated_entries" ADD CONSTRAINT "updated_entries_user_id_entry_id_unique" UNIQUE("user_id", "entry_id");
CREATE INDEX "updated_entries_user_id_index" ON
    "updated_entries"("user_id");
CREATE INDEX "updated_entries_entry_id_index" ON
    "updated_entries"("entry_id");
CREATE INDEX "updated_entries_feed_id_index" ON
    "updated_entries"("feed_id");
CREATE TABLE "users"(
    "id" BIGINT NOT NULL,
    "email" VARCHAR(255) NULL,
    "password_digest" VARCHAR(255) NULL,
    "customer_id" VARCHAR(255) NULL,
    "last_4_digits" VARCHAR(255) NULL,
    "plan_id" BIGINT NULL,
    "admin" BOOLEAN NULL,
    "suspended" BOOLEAN NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "auth_token" VARCHAR(255) NULL,
    "password_reset_token" INTEGER NOT NULL,
    "password_reset_sent_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "settings" JSON NULL,
    "starred_token" VARCHAR(255) NULL,
    "inbound_email_token" VARCHAR(255) NULL,
    "tag_visibility" JSON NULL,
    "expires_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "newsletter_token" VARCHAR(255) NULL,
    "price_tier" BIGINT NULL,
    "page_token" VARCHAR(255) NULL
);
ALTER TABLE
    "users" ADD CONSTRAINT "users_email_unique" UNIQUE("email");
ALTER TABLE
    "users" ADD CONSTRAINT "users_customer_id_unique" UNIQUE("customer_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_auth_token_unique" UNIQUE("auth_token");
ALTER TABLE
    "users" ADD CONSTRAINT "users_password_reset_token_unique" UNIQUE("password_reset_token");
ALTER TABLE
    "users" ADD CONSTRAINT "users_starred_token_unique" UNIQUE("starred_token");
ALTER TABLE
    "users" ADD CONSTRAINT "users_inbound_email_token_unique" UNIQUE("inbound_email_token");
CREATE INDEX "users_expires_at_index" ON
    "users"("expires_at");
ALTER TABLE
    "users" ADD CONSTRAINT "users_newsletter_token_unique" UNIQUE("newsletter_token");
ALTER TABLE
    "users" ADD CONSTRAINT "users_page_token_unique" UNIQUE("page_token");
ALTER TABLE
    "plans" ADD CONSTRAINT "plans_id_foreign" FOREIGN KEY("id") REFERENCES "users"("plan_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "actions"("user_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "recently_read_entries"("user_id");
ALTER TABLE
    "feeds" ADD CONSTRAINT "feeds_id_foreign" FOREIGN KEY("id") REFERENCES "feed_stats"("feed_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "saved_searches"("user_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "recently_played_entries"("user_id");
ALTER TABLE
    "feeds" ADD CONSTRAINT "feeds_id_foreign" FOREIGN KEY("id") REFERENCES "updated_entries"("feed_id");
ALTER TABLE
    "imports" ADD CONSTRAINT "imports_id_foreign" FOREIGN KEY("id") REFERENCES "import_items"("import_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "taggings"("user_id");
ALTER TABLE
    "feeds" ADD CONSTRAINT "feeds_id_foreign" FOREIGN KEY("id") REFERENCES "newsletter_senders"("feed_id");
ALTER TABLE
    "feeds" ADD CONSTRAINT "feeds_id_foreign" FOREIGN KEY("id") REFERENCES "suggested_feeds"("feed_id");
ALTER TABLE
    "feeds" ADD CONSTRAINT "feeds_id_foreign" FOREIGN KEY("id") REFERENCES "unreads"("feed_id");
ALTER TABLE
    "entries" ADD CONSTRAINT "entries_id_foreign" FOREIGN KEY("id") REFERENCES "recently_played_entries"("entry_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "devices"("user_id");
ALTER TABLE
    "entries" ADD CONSTRAINT "entries_id_foreign" FOREIGN KEY("id") REFERENCES "recently_read_entries"("entry_id");
ALTER TABLE
    "entries" ADD CONSTRAINT "entries_id_foreign" FOREIGN KEY("id") REFERENCES "entries"("entry_id");
ALTER TABLE
    "feeds" ADD CONSTRAINT "feeds_id_foreign" FOREIGN KEY("id") REFERENCES "starred_entries"("feed_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "supported_sharing_services"("user_id");
ALTER TABLE
    "tags" ADD CONSTRAINT "tags_id_foreign" FOREIGN KEY("id") REFERENCES "taggings"("tag_id");
ALTER TABLE
    "suggested_categories" ADD CONSTRAINT "suggested_categories_id_foreign" FOREIGN KEY("id") REFERENCES "suggested_feeds"("suggested_category_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "updated_entries"("user_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "subscriptions"("user_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "sharing_services"("user_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "starred_entries"("user_id");
ALTER TABLE
    "feeds" ADD CONSTRAINT "feeds_id_foreign" FOREIGN KEY("id") REFERENCES "entries"("feed_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "in_app_purchases"("user_id");
ALTER TABLE
    "feeds" ADD CONSTRAINT "feeds_id_foreign" FOREIGN KEY("id") REFERENCES "subscriptions"("feed_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "coupons"("user_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "authentication_tokens"("user_id");
ALTER TABLE
    "feeds" ADD CONSTRAINT "feeds_id_foreign" FOREIGN KEY("id") REFERENCES "taggings"("feed_id");
ALTER TABLE
    "entries" ADD CONSTRAINT "entries_id_foreign" FOREIGN KEY("id") REFERENCES "updated_entries"("entry_id");
ALTER TABLE
    "entries" ADD CONSTRAINT "entries_id_foreign" FOREIGN KEY("id") REFERENCES "starred_entries"("entry_id");
ALTER TABLE
    "entries" ADD CONSTRAINT "entries_id_foreign" FOREIGN KEY("id") REFERENCES "unreads"("entry_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "imports"("user_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_id_foreign" FOREIGN KEY("id") REFERENCES "unreads"("user_id");