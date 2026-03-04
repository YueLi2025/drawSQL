CREATE TABLE `activities`(
    `id` INT NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `extra` TEXT NOT NULL,
    `book_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `entity_id` INT NOT NULL,
    `entity_type` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `api_tokens`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `token_id` VARCHAR(255) NOT NULL,
    `secret` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `expires_at` DATE NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `attachments`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `extension` VARCHAR(255) NOT NULL,
    `uploaded_to` INT NOT NULL,
    `external` TINYINT NOT NULL,
    `order` INT NOT NULL,
    `created_by` INT NOT NULL,
    `updated_by` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `books`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `created_by` INT NOT NULL,
    `updated_by` INT NOT NULL,
    `restricted` TINYINT NOT NULL,
    `image_id` INT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `bookshelves`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `created_by` INT NULL,
    `updated_by` INT NULL,
    `restricted` TINYINT NOT NULL,
    `image_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `bookshelves_books`(
    `bookshelf_id` INT NOT NULL,
    `book_id` INT NOT NULL,
    `order` INT NOT NULL,
    PRIMARY KEY(`bookshelf_id`, `book_id`)
);
CREATE TABLE `cache`(
    `key` VARCHAR(255) NOT NULL,
    `value` TEXT NOT NULL,
    `expiration` INT NOT NULL
);
CREATE TABLE `chapters`(
    `id` INT NOT NULL,
    `book_id` INT NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `name` TEXT NOT NULL,
    `description` TEXT NOT NULL,
    `priority` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `created_by` INT NOT NULL,
    `updated_by` INT NOT NULL,
    `restricted` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `comments`(
    `id` INT NOT NULL,
    `entity_id` INT NOT NULL,
    `entity_type` VARCHAR(255) NOT NULL,
    `text` LONGTEXT NULL,
    `html` LONGTEXT NULL,
    `parent_id` INT NULL,
    `local_id` INT NULL,
    `created_by` INT NOT NULL,
    `updated_by` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `email_confirmations`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `entity_permissions`(
    `id` INT NOT NULL,
    `restrictable_id` INT NOT NULL,
    `restrictable_type` VARCHAR(255) NOT NULL,
    `role_id` INT NOT NULL,
    `action` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `images`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `created_by` INT NOT NULL,
    `updated_by` INT NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `uploaded_to` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `joint_permissions`(
    `id` INT NOT NULL,
    `role_id` INT NOT NULL,
    `entity_type` VARCHAR(255) NOT NULL,
    `entity_id` INT NOT NULL,
    `action` VARCHAR(255) NOT NULL,
    `has_permission` TINYINT NOT NULL,
    `has_permission_own` TINYINT NOT NULL,
    `created_by` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `migrations`(
    `id` INT NOT NULL,
    `migration` VARCHAR(255) NOT NULL,
    `batch` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `page_revisions`(
    `id` INT NOT NULL,
    `page_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `html` LONGTEXT NOT NULL,
    `text` LONGTEXT NOT NULL,
    `created_by` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `slug` VARCHAR(255) NOT NULL,
    `book_slug` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `markdown` LONGTEXT NOT NULL,
    `summary` VARCHAR(255) NULL,
    `revision_number` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `pages`(
    `id` INT NOT NULL,
    `book_id` INT NOT NULL,
    `chapter_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `html` LONGTEXT NOT NULL,
    `text` LONGTEXT NOT NULL,
    `priority` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `created_by` INT NOT NULL,
    `updated_by` INT NOT NULL,
    `restricted` TINYINT NOT NULL,
    `draft` TINYINT NOT NULL,
    `markdown` LONGTEXT NOT NULL,
    `revision_count` INT NOT NULL,
    `template` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);
CREATE TABLE `permission_role`(
    `permission_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    PRIMARY KEY(`permission_id`, `role_id`)
);
CREATE TABLE `role_permissions`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `role_user`(
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    PRIMARY KEY(`user_id`, `role_id`)
);
CREATE TABLE `roles`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `system_name` VARCHAR(255) NOT NULL,
    `external_auth_id` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `search_terms`(
    `id` INT NOT NULL,
    `term` VARCHAR(255) NOT NULL,
    `entity_type` VARCHAR(255) NOT NULL,
    `entity_id` INT NOT NULL,
    `score` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `sessions`(
    `id` VARCHAR(255) NOT NULL,
    `user_id` INT NULL,
    `ip_address` VARCHAR(255) NULL,
    `user_agent` TEXT NULL,
    `payload` TEXT NOT NULL,
    `last_activity` INT NOT NULL
);
CREATE TABLE `settings`(
    `setting_key` VARCHAR(255) NOT NULL,
    `value` TEXT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`setting_key`)
);
CREATE TABLE `social_accounts`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `driver` VARCHAR(255) NOT NULL,
    `driver_id` VARCHAR(255) NOT NULL,
    `avatar` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `tags`(
    `id` INT NOT NULL,
    `entity_id` INT NOT NULL,
    `entity_type` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NOT NULL,
    `order` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `user_invites`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `email_confirmed` TINYINT NOT NULL,
    `image_id` INT NOT NULL,
    `external_auth_id` VARCHAR(255) NOT NULL,
    `system_name` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `views`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `viewable_id` INT NOT NULL,
    `viewable_type` VARCHAR(255) NOT NULL,
    `views` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `pages` ADD CONSTRAINT `pages_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `books`(`id`);
ALTER TABLE
    `joint_permissions` ADD CONSTRAINT `joint_permissions_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `activities` ADD CONSTRAINT `activities_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_image_id_foreign` FOREIGN KEY(`image_id`) REFERENCES `images`(`id`);
ALTER TABLE
    `entity_permissions` ADD CONSTRAINT `entity_permissions_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `role_user` ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `user_invites` ADD CONSTRAINT `user_invites_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `page_revisions` ADD CONSTRAINT `page_revisions_page_id_foreign` FOREIGN KEY(`page_id`) REFERENCES `pages`(`id`);
ALTER TABLE
    `activities` ADD CONSTRAINT `activities_entity_id_foreign` FOREIGN KEY(`entity_id`) REFERENCES `books`(`id`);
ALTER TABLE
    `activities` ADD CONSTRAINT `activities_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `books`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_id_foreign` FOREIGN KEY(`id`) REFERENCES `bookshelves`(`id`);
ALTER TABLE
    `permission_role` ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`);
ALTER TABLE
    `email_confirmations` ADD CONSTRAINT `email_confirmations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `bookshelves_books` ADD CONSTRAINT `bookshelves_books_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `books`(`id`);
ALTER TABLE
    `role_user` ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `sessions` ADD CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `views` ADD CONSTRAINT `views_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `activities` ADD CONSTRAINT `activities_entity_id_foreign` FOREIGN KEY(`entity_id`) REFERENCES `bookshelves`(`id`);
ALTER TABLE
    `bookshelves` ADD CONSTRAINT `bookshelves_image_id_foreign` FOREIGN KEY(`image_id`) REFERENCES `images`(`id`);
ALTER TABLE
    `tags` ADD CONSTRAINT `tags_entity_id_foreign` FOREIGN KEY(`entity_id`) REFERENCES `books`(`id`);
ALTER TABLE
    `api_tokens` ADD CONSTRAINT `api_tokens_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `tags` ADD CONSTRAINT `tags_entity_id_foreign` FOREIGN KEY(`entity_id`) REFERENCES `bookshelves`(`id`);
ALTER TABLE
    `views` ADD CONSTRAINT `views_viewable_id_foreign` FOREIGN KEY(`viewable_id`) REFERENCES `bookshelves`(`id`);
ALTER TABLE
    `bookshelves_books` ADD CONSTRAINT `bookshelves_books_bookshelf_id_foreign` FOREIGN KEY(`bookshelf_id`) REFERENCES `bookshelves`(`id`);
ALTER TABLE
    `chapters` ADD CONSTRAINT `chapters_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `books`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_id_foreign` FOREIGN KEY(`id`) REFERENCES `books`(`id`);
ALTER TABLE
    `books` ADD CONSTRAINT `books_image_id_foreign` FOREIGN KEY(`image_id`) REFERENCES `images`(`id`);
ALTER TABLE
    `pages` ADD CONSTRAINT `pages_chapter_id_foreign` FOREIGN KEY(`chapter_id`) REFERENCES `chapters`(`id`);
ALTER TABLE
    `social_accounts` ADD CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `views` ADD CONSTRAINT `views_viewable_id_foreign` FOREIGN KEY(`viewable_id`) REFERENCES `books`(`id`);