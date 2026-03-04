CREATE TABLE `auth_group`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_group` ADD UNIQUE `auth_group_name_unique`(`name`);
CREATE TABLE `auth_group_permissions`(
    `id` INT NOT NULL,
    `group_id` INT NOT NULL,
    `permission_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_group_permissions` ADD UNIQUE `auth_group_permissions_group_id_permission_id_unique`(`group_id`, `permission_id`);
ALTER TABLE
    `auth_group_permissions` ADD INDEX `auth_group_permissions_permission_id_index`(`permission_id`);
CREATE TABLE `auth_permission`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `content_type_id` INT NOT NULL,
    `codename` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_permission` ADD UNIQUE `auth_permission_content_type_id_codename_unique`(`content_type_id`, `codename`);
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
CREATE TABLE `auth_user_groups`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `group_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_user_groups` ADD UNIQUE `auth_user_groups_user_id_group_id_unique`(`user_id`, `group_id`);
ALTER TABLE
    `auth_user_groups` ADD INDEX `auth_user_groups_group_id_index`(`group_id`);
CREATE TABLE `auth_user_user_permissions`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `permission_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `auth_user_user_permissions` ADD UNIQUE `auth_user_user_permissions_user_id_permission_id_unique`(`user_id`, `permission_id`);
ALTER TABLE
    `auth_user_user_permissions` ADD INDEX `auth_user_user_permissions_permission_id_index`(`permission_id`);
CREATE TABLE `django_admin_log`(
    `id` INT NOT NULL,
    `action_time` DATETIME NOT NULL,
    `object_id` LONGTEXT NULL,
    `object_repr` VARCHAR(255) NOT NULL,
    `action_flag` SMALLINT NOT NULL,
    `change_message` LONGTEXT NOT NULL,
    `content_type_id` INT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `django_admin_log` ADD INDEX `django_admin_log_content_type_id_index`(`content_type_id`);
ALTER TABLE
    `django_admin_log` ADD INDEX `django_admin_log_user_id_index`(`user_id`);
CREATE TABLE `django_content_type`(
    `id` INT NOT NULL,
    `app_label` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `django_content_type` ADD UNIQUE `django_content_type_app_label_model_unique`(`app_label`, `model`);
CREATE TABLE `django_migrations`(
    `id` INT NOT NULL,
    `app` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `applied` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `django_session`(
    `session_key` VARCHAR(255) NOT NULL,
    `session_data` LONGTEXT NOT NULL,
    `expire_date` DATETIME NOT NULL,
    PRIMARY KEY(`session_key`)
);
ALTER TABLE
    `django_session` ADD INDEX `django_session_expire_date_index`(`expire_date`);
CREATE TABLE `home_homepage`(
    `page_ptr_id` INT NOT NULL,
    PRIMARY KEY(`page_ptr_id`)
);
CREATE TABLE `taggit_tag`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `taggit_tag` ADD UNIQUE `taggit_tag_name_unique`(`name`);
ALTER TABLE
    `taggit_tag` ADD UNIQUE `taggit_tag_slug_unique`(`slug`);
CREATE TABLE `taggit_taggeditem`(
    `id` INT NOT NULL,
    `object_id` INT NOT NULL,
    `content_type_id` INT NOT NULL,
    `tag_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `taggit_taggeditem` ADD UNIQUE `taggit_taggeditem_object_id_content_type_id_tag_id_unique`(
        `object_id`,
        `content_type_id`,
        `tag_id`
    );
ALTER TABLE
    `taggit_taggeditem` ADD INDEX `taggit_taggeditem_object_id_content_type_id_index`(`object_id`, `content_type_id`);
ALTER TABLE
    `taggit_taggeditem` ADD INDEX `taggit_taggeditem_object_id_index`(`object_id`);
ALTER TABLE
    `taggit_taggeditem` ADD INDEX `taggit_taggeditem_tag_id_index`(`tag_id`);
CREATE TABLE `wagtailcore_collection`(
    `id` INT NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `depth` INT NOT NULL,
    `numchild` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailcore_collection` ADD UNIQUE `wagtailcore_collection_path_unique`(`path`);
CREATE TABLE `wagtailcore_collectionviewrestriction`(
    `id` INT NOT NULL,
    `restriction_type` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `collection_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailcore_collectionviewrestriction` ADD INDEX `wagtailcore_collectionviewrestriction_collection_id_index`(`collection_id`);
CREATE TABLE `wagtailcore_collectionviewrestriction_groups`(
    `id` INT NOT NULL,
    `collectionviewrestriction_id` INT NOT NULL,
    `group_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailcore_collectionviewrestriction_groups` ADD UNIQUE `collectionviewrestriction_id_group_id_unique`(
        `collectionviewrestriction_id`,
        `group_id`
    );
ALTER TABLE
    `wagtailcore_collectionviewrestriction_groups` ADD INDEX `wagtailcore_collectionviewrestriction_groups_group_id_index`(`group_id`);
CREATE TABLE `wagtailcore_groupcollectionpermission`(
    `id` INT NOT NULL,
    `collection_id` INT NOT NULL,
    `group_id` INT NOT NULL,
    `permission_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailcore_groupcollectionpermission` ADD UNIQUE `collection_id_group_id_permission_id_unique`(
        `collection_id`,
        `group_id`,
        `permission_id`
    );
ALTER TABLE
    `wagtailcore_groupcollectionpermission` ADD INDEX `wagtailcore_groupcollectionpermission_collection_id_index`(`collection_id`);
ALTER TABLE
    `wagtailcore_groupcollectionpermission` ADD INDEX `wagtailcore_groupcollectionpermission_permission_id_index`(`permission_id`);
CREATE TABLE `wagtailcore_grouppagepermission`(
    `id` INT NOT NULL,
    `permission_type` VARCHAR(255) NOT NULL,
    `group_id` INT NOT NULL,
    `page_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailcore_grouppagepermission` ADD UNIQUE `permission_type_group_id_page_id_unique`(
        `permission_type`,
        `group_id`,
        `page_id`
    );
ALTER TABLE
    `wagtailcore_grouppagepermission` ADD INDEX `wagtailcore_grouppagepermission_page_id_index`(`page_id`);
CREATE TABLE `wagtailcore_page`(
    `id` INT NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `depth` INT NOT NULL,
    `numchild` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `live` TINYINT NOT NULL,
    `has_unpublished_changes` TINYINT NOT NULL,
    `url_path` LONGTEXT NOT NULL,
    `seo_title` VARCHAR(255) NOT NULL,
    `show_in_menus` TINYINT NOT NULL,
    `search_description` LONGTEXT NOT NULL,
    `go_live_at` DATETIME NULL,
    `expire_at` DATETIME NULL,
    `expired` TINYINT NOT NULL,
    `content_type_id` INT NOT NULL,
    `owner_id` INT NULL,
    `locked` TINYINT NOT NULL,
    `latest_revision_created_at` DATETIME NULL,
    `first_published_at` DATETIME NULL,
    `live_revision_id` INT NULL,
    `last_published_at` DATETIME NULL,
    `draft_title` VARCHAR(255) NOT NULL,
    `locked_at` DATETIME NULL,
    `locked_by_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailcore_page` ADD UNIQUE `wagtailcore_page_path_unique`(`path`);
ALTER TABLE
    `wagtailcore_page` ADD INDEX `wagtailcore_page_slug_index`(`slug`);
ALTER TABLE
    `wagtailcore_page` ADD INDEX `wagtailcore_page_content_type_id_index`(`content_type_id`);
ALTER TABLE
    `wagtailcore_page` ADD INDEX `wagtailcore_page_owner_id_index`(`owner_id`);
ALTER TABLE
    `wagtailcore_page` ADD INDEX `wagtailcore_page_first_published_at_index`(`first_published_at`);
ALTER TABLE
    `wagtailcore_page` ADD INDEX `wagtailcore_page_live_revision_id_index`(`live_revision_id`);
ALTER TABLE
    `wagtailcore_page` ADD INDEX `wagtailcore_page_locked_by_id_index`(`locked_by_id`);
CREATE TABLE `wagtailcore_pagerevision`(
    `id` INT NOT NULL,
    `submitted_for_moderation` TINYINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `content_json` LONGTEXT NOT NULL,
    `approved_go_live_at` DATETIME NULL,
    `page_id` INT NOT NULL,
    `user_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailcore_pagerevision` ADD INDEX `wagtailcore_pagerevision_submitted_for_moderation_index`(`submitted_for_moderation`);
ALTER TABLE
    `wagtailcore_pagerevision` ADD INDEX `wagtailcore_pagerevision_created_at_index`(`created_at`);
ALTER TABLE
    `wagtailcore_pagerevision` ADD INDEX `wagtailcore_pagerevision_approved_go_live_at_index`(`approved_go_live_at`);
ALTER TABLE
    `wagtailcore_pagerevision` ADD INDEX `wagtailcore_pagerevision_page_id_index`(`page_id`);
ALTER TABLE
    `wagtailcore_pagerevision` ADD INDEX `wagtailcore_pagerevision_user_id_index`(`user_id`);
CREATE TABLE `wagtailcore_pageviewrestriction`(
    `id` INT NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `page_id` INT NOT NULL,
    `restriction_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailcore_pageviewrestriction` ADD INDEX `wagtailcore_pageviewrestriction_page_id_index`(`page_id`);
CREATE TABLE `wagtailcore_pageviewrestriction_groups`(
    `id` INT NOT NULL,
    `pageviewrestriction_id` INT NOT NULL,
    `group_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailcore_pageviewrestriction_groups` ADD UNIQUE `pageviewrestriction_id_group_id_unique`(
        `pageviewrestriction_id`,
        `group_id`
    );
ALTER TABLE
    `wagtailcore_pageviewrestriction_groups` ADD INDEX `wagtailcore_pageviewrestriction_groups_group_id_index`(`group_id`);
CREATE TABLE `wagtailcore_site`(
    `id` INT NOT NULL,
    `hostname` VARCHAR(255) NOT NULL,
    `port` INT NOT NULL,
    `is_default_site` TINYINT NOT NULL,
    `root_page_id` INT NOT NULL,
    `site_name` VARCHAR(255) NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailcore_site` ADD UNIQUE `wagtailcore_site_hostname_port_unique`(`hostname`, `port`);
ALTER TABLE
    `wagtailcore_site` ADD INDEX `wagtailcore_site_hostname_index`(`hostname`);
ALTER TABLE
    `wagtailcore_site` ADD INDEX `wagtailcore_site_root_page_id_index`(`root_page_id`);
CREATE TABLE `wagtaildocs_document`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `file` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `uploaded_by_user_id` INT NULL,
    `collection_id` INT NOT NULL,
    `file_size` INT NULL,
    `file_hash` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtaildocs_document` ADD INDEX `wagtaildocs_document_uploaded_by_user_id_index`(`uploaded_by_user_id`);
ALTER TABLE
    `wagtaildocs_document` ADD INDEX `wagtaildocs_document_collection_id_index`(`collection_id`);
CREATE TABLE `wagtailembeds_embed`(
    `id` INT NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `max_width` SMALLINT NULL,
    `type` VARCHAR(255) NOT NULL,
    `html` LONGTEXT NOT NULL,
    `title` LONGTEXT NOT NULL,
    `author_name` LONGTEXT NOT NULL,
    `provider_name` LONGTEXT NOT NULL,
    `thumbnail_url` VARCHAR(255) NULL,
    `width` INT NULL,
    `height` INT NULL,
    `last_updated` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailembeds_embed` ADD UNIQUE `wagtailembeds_embed_url_max_width_unique`(`url`, `max_width`);
CREATE TABLE `wagtailforms_formsubmission`(
    `id` INT NOT NULL,
    `form_data` LONGTEXT NOT NULL,
    `submit_time` DATETIME NOT NULL,
    `page_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailforms_formsubmission` ADD INDEX `wagtailforms_formsubmission_page_id_index`(`page_id`);
CREATE TABLE `wagtailimages_image`(
    `id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `file` VARCHAR(255) NOT NULL,
    `width` INT NOT NULL,
    `height` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `focal_point_x` INT NULL,
    `focal_point_y` INT NULL,
    `focal_point_width` INT NULL,
    `focal_point_height` INT NULL,
    `uploaded_by_user_id` INT NULL,
    `file_size` INT NULL,
    `collection_id` INT NOT NULL,
    `file_hash` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailimages_image` ADD INDEX `wagtailimages_image_created_at_index`(`created_at`);
ALTER TABLE
    `wagtailimages_image` ADD INDEX `wagtailimages_image_uploaded_by_user_id_index`(`uploaded_by_user_id`);
ALTER TABLE
    `wagtailimages_image` ADD INDEX `wagtailimages_image_collection_id_index`(`collection_id`);
CREATE TABLE `wagtailimages_rendition`(
    `id` INT NOT NULL,
    `file` VARCHAR(255) NOT NULL,
    `width` INT NOT NULL,
    `height` INT NOT NULL,
    `focal_point_key` VARCHAR(255) NOT NULL,
    `filter_spec` VARCHAR(255) NOT NULL,
    `image_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailimages_rendition` ADD UNIQUE `focal_point_key_filter_spec_image_id_unique`(
        `focal_point_key`,
        `filter_spec`,
        `image_id`
    );
ALTER TABLE
    `wagtailimages_rendition` ADD INDEX `wagtailimages_rendition_filter_spec_index`(`filter_spec`);
CREATE TABLE `wagtailredirects_redirect`(
    `id` INT NOT NULL,
    `old_path` VARCHAR(255) NOT NULL,
    `is_permanent` TINYINT NOT NULL,
    `redirect_link` VARCHAR(255) NOT NULL,
    `redirect_page_id` INT NULL,
    `site_id` INT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailredirects_redirect` ADD UNIQUE `wagtailredirects_redirect_old_path_site_id_unique`(`old_path`, `site_id`);
ALTER TABLE
    `wagtailredirects_redirect` ADD INDEX `wagtailredirects_redirect_old_path_index`(`old_path`);
ALTER TABLE
    `wagtailredirects_redirect` ADD INDEX `wagtailredirects_redirect_redirect_page_id_index`(`redirect_page_id`);
ALTER TABLE
    `wagtailredirects_redirect` ADD INDEX `wagtailredirects_redirect_site_id_index`(`site_id`);
CREATE TABLE `wagtailsearch_editorspick`(
    `id` INT NOT NULL,
    `sort_order` INT NULL,
    `description` LONGTEXT NOT NULL,
    `page_id` INT NOT NULL,
    `query_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailsearch_editorspick` ADD INDEX `wagtailsearch_editorspick_page_id_index`(`page_id`);
ALTER TABLE
    `wagtailsearch_editorspick` ADD INDEX `wagtailsearch_editorspick_query_id_index`(`query_id`);
CREATE TABLE `wagtailsearch_query`(
    `id` INT NOT NULL,
    `query_string` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailsearch_query` ADD UNIQUE `wagtailsearch_query_query_string_unique`(`query_string`);
CREATE TABLE `wagtailsearch_querydailyhits`(
    `id` INT NOT NULL,
    `date` DATE NOT NULL,
    `hits` INT NOT NULL,
    `query_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailsearch_querydailyhits` ADD UNIQUE `wagtailsearch_querydailyhits_date_query_id_unique`(`date`, `query_id`);
CREATE TABLE `wagtailusers_userprofile`(
    `id` INT NOT NULL,
    `submitted_notifications` TINYINT NOT NULL,
    `approved_notifications` TINYINT NOT NULL,
    `rejected_notifications` TINYINT NOT NULL,
    `user_id` INT NOT NULL,
    `preferred_language` VARCHAR(255) NOT NULL,
    `current_time_zone` VARCHAR(255) NOT NULL,
    `avatar` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `wagtailusers_userprofile` ADD UNIQUE `wagtailusers_userprofile_user_id_unique`(`user_id`);
ALTER TABLE
    `wagtaildocs_document` ADD CONSTRAINT `wagtaildocs_document_collection_id_foreign` FOREIGN KEY(`collection_id`) REFERENCES `wagtailcore_collection`(`id`);
ALTER TABLE
    `wagtailcore_pageviewrestriction_groups` ADD CONSTRAINT `wagtailcore_pageviewrestriction_groups_pageviewrestriction_id_foreign` FOREIGN KEY(`pageviewrestriction_id`) REFERENCES `wagtailcore_pageviewrestriction`(`id`);
ALTER TABLE
    `wagtailcore_site` ADD CONSTRAINT `wagtailcore_site_root_page_id_foreign` FOREIGN KEY(`root_page_id`) REFERENCES `wagtailcore_page`(`id`);
ALTER TABLE
    `auth_group_permissions` ADD CONSTRAINT `auth_group_permissions_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`);
ALTER TABLE
    `wagtailcore_groupcollectionpermission` ADD CONSTRAINT `wagtailcore_groupcollectionpermission_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`);
ALTER TABLE
    `wagtailcore_page` ADD CONSTRAINT `wagtailcore_page_content_type_id_foreign` FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`);
ALTER TABLE
    `wagtailcore_page` ADD CONSTRAINT `wagtailcore_page_live_revision_id_foreign` FOREIGN KEY(`live_revision_id`) REFERENCES `wagtailcore_pagerevision`(`id`);
ALTER TABLE
    `wagtailcore_pageviewrestriction_groups` ADD CONSTRAINT `wagtailcore_pageviewrestriction_groups_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`);
ALTER TABLE
    `auth_user_user_permissions` ADD CONSTRAINT `auth_user_user_permissions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `wagtailforms_formsubmission` ADD CONSTRAINT `wagtailforms_formsubmission_page_id_foreign` FOREIGN KEY(`page_id`) REFERENCES `wagtailcore_page`(`id`);
ALTER TABLE
    `wagtaildocs_document` ADD CONSTRAINT `wagtaildocs_document_uploaded_by_user_id_foreign` FOREIGN KEY(`uploaded_by_user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `auth_user_user_permissions` ADD CONSTRAINT `auth_user_user_permissions_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`);
ALTER TABLE
    `wagtailcore_collectionviewrestriction_groups` ADD CONSTRAINT `wagtailcore_collectionviewrestriction_groups_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`);
ALTER TABLE
    `django_admin_log` ADD CONSTRAINT `django_admin_log_content_type_id_foreign` FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`);
ALTER TABLE
    `wagtailcore_groupcollectionpermission` ADD CONSTRAINT `wagtailcore_groupcollectionpermission_collection_id_foreign` FOREIGN KEY(`collection_id`) REFERENCES `wagtailcore_collection`(`id`);
ALTER TABLE
    `wagtailcore_pageviewrestriction` ADD CONSTRAINT `wagtailcore_pageviewrestriction_page_id_foreign` FOREIGN KEY(`page_id`) REFERENCES `wagtailcore_page`(`id`);
ALTER TABLE
    `wagtailcore_page` ADD CONSTRAINT `wagtailcore_page_id_foreign` FOREIGN KEY(`id`) REFERENCES `home_homepage`(`page_ptr_id`);
ALTER TABLE
    `wagtailredirects_redirect` ADD CONSTRAINT `wagtailredirects_redirect_site_id_foreign` FOREIGN KEY(`site_id`) REFERENCES `wagtailcore_site`(`id`);
ALTER TABLE
    `django_admin_log` ADD CONSTRAINT `django_admin_log_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `wagtailimages_image` ADD CONSTRAINT `wagtailimages_image_uploaded_by_user_id_foreign` FOREIGN KEY(`uploaded_by_user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `wagtailcore_grouppagepermission` ADD CONSTRAINT `wagtailcore_grouppagepermission_page_id_foreign` FOREIGN KEY(`page_id`) REFERENCES `wagtailcore_page`(`id`);
ALTER TABLE
    `wagtailcore_collectionviewrestriction_groups` ADD CONSTRAINT `wagtailcore_collectionviewrestriction_groups_collectionviewrestriction_id_foreign` FOREIGN KEY(`collectionviewrestriction_id`) REFERENCES `wagtailcore_collectionviewrestriction`(`id`);
ALTER TABLE
    `wagtailcore_groupcollectionpermission` ADD CONSTRAINT `wagtailcore_groupcollectionpermission_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`);
ALTER TABLE
    `wagtailcore_page` ADD CONSTRAINT `wagtailcore_page_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `wagtailsearch_editorspick` ADD CONSTRAINT `wagtailsearch_editorspick_page_id_foreign` FOREIGN KEY(`page_id`) REFERENCES `wagtailcore_page`(`id`);
ALTER TABLE
    `wagtailcore_page` ADD CONSTRAINT `wagtailcore_page_locked_by_id_foreign` FOREIGN KEY(`locked_by_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `auth_user_groups` ADD CONSTRAINT `auth_user_groups_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `auth_permission` ADD CONSTRAINT `auth_permission_content_type_id_foreign` FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`);
ALTER TABLE
    `auth_group_permissions` ADD CONSTRAINT `auth_group_permissions_permission_id_foreign` FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`);
ALTER TABLE
    `wagtailcore_pagerevision` ADD CONSTRAINT `wagtailcore_pagerevision_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `wagtailcore_collectionviewrestriction` ADD CONSTRAINT `wagtailcore_collectionviewrestriction_collection_id_foreign` FOREIGN KEY(`collection_id`) REFERENCES `wagtailcore_collection`(`id`);
ALTER TABLE
    `auth_user_groups` ADD CONSTRAINT `auth_user_groups_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`);
ALTER TABLE
    `taggit_taggeditem` ADD CONSTRAINT `taggit_taggeditem_content_type_id_foreign` FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`);
ALTER TABLE
    `wagtailsearch_editorspick` ADD CONSTRAINT `wagtailsearch_editorspick_query_id_foreign` FOREIGN KEY(`query_id`) REFERENCES `wagtailsearch_query`(`id`);
ALTER TABLE
    `wagtailcore_grouppagepermission` ADD CONSTRAINT `wagtailcore_grouppagepermission_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`);
ALTER TABLE
    `wagtailimages_image` ADD CONSTRAINT `wagtailimages_image_collection_id_foreign` FOREIGN KEY(`collection_id`) REFERENCES `wagtailcore_collection`(`id`);
ALTER TABLE
    `wagtailcore_pagerevision` ADD CONSTRAINT `wagtailcore_pagerevision_page_id_foreign` FOREIGN KEY(`page_id`) REFERENCES `wagtailcore_page`(`id`);
ALTER TABLE
    `wagtailusers_userprofile` ADD CONSTRAINT `wagtailusers_userprofile_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`);
ALTER TABLE
    `wagtailsearch_querydailyhits` ADD CONSTRAINT `wagtailsearch_querydailyhits_query_id_foreign` FOREIGN KEY(`query_id`) REFERENCES `wagtailsearch_query`(`id`);
ALTER TABLE
    `wagtailimages_rendition` ADD CONSTRAINT `wagtailimages_rendition_image_id_foreign` FOREIGN KEY(`image_id`) REFERENCES `wagtailimages_image`(`id`);
ALTER TABLE
    `wagtailredirects_redirect` ADD CONSTRAINT `wagtailredirects_redirect_redirect_page_id_foreign` FOREIGN KEY(`redirect_page_id`) REFERENCES `wagtailcore_page`(`id`);
ALTER TABLE
    `taggit_taggeditem` ADD CONSTRAINT `taggit_taggeditem_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `taggit_tag`(`id`);