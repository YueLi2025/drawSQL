CREATE TABLE `bootstrap4_alerts_bootstrap4alerts`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `alert_context` VARCHAR(255) NOT NULL,
    `alert_dismissable` TINYINT NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_badge_bootstrap4badge`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `badge_text` VARCHAR(255) NOT NULL,
    `badge_context` VARCHAR(255) NOT NULL,
    `badge_pills` TINYINT NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_card_bootstrap4card`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `card_type` VARCHAR(255) NOT NULL,
    `card_context` VARCHAR(255) NOT NULL,
    `card_alignment` VARCHAR(255) NOT NULL,
    `card_outline` TINYINT NOT NULL,
    `card_text_color` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_card_bootstrap4cardinner`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `inner_type` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_carousel_bootstrap4carousel`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `template` VARCHAR(255) NOT NULL,
    `carousel_interval` INT NOT NULL,
    `carousel_controls` TINYINT NOT NULL,
    `carousel_indicators` TINYINT NOT NULL,
    `carousel_keyboard` TINYINT NOT NULL,
    `carousel_pause` VARCHAR(255) NOT NULL,
    `carousel_ride` VARCHAR(255) NOT NULL,
    `carousel_wrap` TINYINT NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    `carousel_aspect_ratio` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_carousel_bootstrap4carouselslide`(
    `template` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `external_link` VARCHAR(255) NOT NULL,
    `anchor` VARCHAR(255) NOT NULL,
    `mailto` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `target` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    `cmsplugin_ptr_id` INT NOT NULL,
    `carousel_content` LONGTEXT NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `carousel_image_id` INT NULL,
    `internal_link_id` INT NULL,
    `file_link_id` INT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
ALTER TABLE
    `bootstrap4_carousel_bootstrap4carouselslide` ADD INDEX `bootstrap4_carousel_bootstrap4carouselslide_carousel_image_id_index`(`carousel_image_id`);
ALTER TABLE
    `bootstrap4_carousel_bootstrap4carouselslide` ADD INDEX `bootstrap4_carousel_bootstrap4carouselslide_internal_link_id_index`(`internal_link_id`);
ALTER TABLE
    `bootstrap4_carousel_bootstrap4carouselslide` ADD INDEX `bootstrap4_carousel_bootstrap4carouselslide_file_link_id_index`(`file_link_id`);
CREATE TABLE `bootstrap4_collapse_bootstrap4collapse`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `siblings` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_collapse_bootstrap4collapsecontainer`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `identifier` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
ALTER TABLE
    `bootstrap4_collapse_bootstrap4collapsecontainer` ADD INDEX `bootstrap4_collapse_bootstrap4collapsecontainer_identifier_index`(`identifier`);
CREATE TABLE `bootstrap4_collapse_bootstrap4collapsetrigger`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `identifier` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
ALTER TABLE
    `bootstrap4_collapse_bootstrap4collapsetrigger` ADD INDEX `bootstrap4_collapse_bootstrap4collapsetrigger_identifier_index`(`identifier`);
CREATE TABLE `bootstrap4_content_bootstrap4blockquote`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `quote_content` LONGTEXT NOT NULL,
    `quote_origin` LONGTEXT NOT NULL,
    `quote_alignment` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_content_bootstrap4code`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `code_content` LONGTEXT NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_content_bootstrap4figure`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `figure_caption` VARCHAR(255) NOT NULL,
    `figure_alignment` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_grid_bootstrap4gridcolumn`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `column_type` VARCHAR(255) NOT NULL,
    `column_alignment` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    `xs_col` INT NULL,
    `xs_order` INT NULL,
    `xs_ml` TINYINT NOT NULL,
    `xs_mr` TINYINT NOT NULL,
    `sm_col` INT NULL,
    `sm_order` INT NULL,
    `sm_ml` TINYINT NOT NULL,
    `sm_mr` TINYINT NOT NULL,
    `md_col` INT NULL,
    `md_order` INT NULL,
    `md_ml` TINYINT NOT NULL,
    `md_mr` TINYINT NOT NULL,
    `lg_col` INT NULL,
    `lg_order` INT NULL,
    `lg_ml` TINYINT NOT NULL,
    `lg_mr` TINYINT NOT NULL,
    `xl_col` INT NULL,
    `xl_order` INT NULL,
    `xl_ml` TINYINT NOT NULL,
    `xl_mr` TINYINT NOT NULL,
    `lg_offset` INT NULL,
    `md_offset` INT NULL,
    `sm_offset` INT NULL,
    `xl_offset` INT NULL,
    `xs_offset` INT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_grid_bootstrap4gridcontainer`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `container_type` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_grid_bootstrap4gridrow`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `vertical_alignment` VARCHAR(255) NOT NULL,
    `horizontal_alignment` VARCHAR(255) NOT NULL,
    `gutters` TINYINT NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_jumbotron_bootstrap4jumbotron`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `fluid` TINYINT NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_link_bootstrap4link`(
    `template` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `external_link` VARCHAR(255) NOT NULL,
    `anchor` VARCHAR(255) NOT NULL,
    `mailto` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `target` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    `cmsplugin_ptr_id` INT NOT NULL,
    `link_type` VARCHAR(255) NOT NULL,
    `link_context` VARCHAR(255) NOT NULL,
    `link_size` VARCHAR(255) NOT NULL,
    `link_outline` TINYINT NOT NULL,
    `link_block` TINYINT NOT NULL,
    `internal_link_id` INT NULL,
    `icon_left` VARCHAR(255) NOT NULL,
    `icon_right` VARCHAR(255) NOT NULL,
    `file_link_id` INT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
ALTER TABLE
    `bootstrap4_link_bootstrap4link` ADD INDEX `bootstrap4_link_bootstrap4link_internal_link_id_index`(`internal_link_id`);
ALTER TABLE
    `bootstrap4_link_bootstrap4link` ADD INDEX `bootstrap4_link_bootstrap4link_file_link_id_index`(`file_link_id`);
CREATE TABLE `bootstrap4_listgroup_bootstrap4listgroup`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `list_group_flush` TINYINT NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_listgroup_bootstrap4listgroupitem`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `list_context` VARCHAR(255) NOT NULL,
    `list_state` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_media_bootstrap4media`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_media_bootstrap4mediabody`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_picture_bootstrap4picture`(
    `template` VARCHAR(255) NOT NULL,
    `external_picture` VARCHAR(255) NULL,
    `width` INT NULL,
    `height` INT NULL,
    `alignment` VARCHAR(255) NOT NULL,
    `caption_text` LONGTEXT NULL,
    `attributes` LONGTEXT NOT NULL,
    `link_url` VARCHAR(255) NULL,
    `link_target` VARCHAR(255) NOT NULL,
    `link_attributes` LONGTEXT NOT NULL,
    `use_automatic_scaling` TINYINT NOT NULL,
    `use_no_cropping` TINYINT NOT NULL,
    `use_crop` TINYINT NOT NULL,
    `use_upscale` TINYINT NOT NULL,
    `cmsplugin_ptr_id` INT NOT NULL,
    `picture_fluid` TINYINT NOT NULL,
    `picture_rounded` TINYINT NOT NULL,
    `picture_thumbnail` TINYINT NOT NULL,
    `link_page_id` INT NULL,
    `picture_id` INT NULL,
    `thumbnail_options_id` INT NULL,
    `use_responsive_image` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
ALTER TABLE
    `bootstrap4_picture_bootstrap4picture` ADD INDEX `bootstrap4_picture_bootstrap4picture_link_page_id_index`(`link_page_id`);
ALTER TABLE
    `bootstrap4_picture_bootstrap4picture` ADD INDEX `bootstrap4_picture_bootstrap4picture_picture_id_index`(`picture_id`);
ALTER TABLE
    `bootstrap4_picture_bootstrap4picture` ADD INDEX `bootstrap4_picture_bootstrap4picture_thumbnail_options_id_index`(`thumbnail_options_id`);
CREATE TABLE `bootstrap4_tabs_bootstrap4tab`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `template` VARCHAR(255) NOT NULL,
    `tab_type` VARCHAR(255) NOT NULL,
    `tab_alignment` VARCHAR(255) NOT NULL,
    `tab_index` INT NULL,
    `tab_effect` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_tabs_bootstrap4tabitem`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `tab_title` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `bootstrap4_utilities_bootstrap4spacing`(
    `cmsplugin_ptr_id` INT NOT NULL,
    `space_property` VARCHAR(255) NOT NULL,
    `space_sides` VARCHAR(255) NOT NULL,
    `space_size` VARCHAR(255) NOT NULL,
    `space_device` VARCHAR(255) NOT NULL,
    `tag_type` VARCHAR(255) NOT NULL,
    `attributes` LONGTEXT NOT NULL,
    PRIMARY KEY(`cmsplugin_ptr_id`)
);
CREATE TABLE `cms_cmsplugin`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `cms_page`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `filer_file`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `filer_image`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `filer_thumbmailoption`(
    `id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_link_bootstrap4link`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_tabs_bootstrap4tab`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_content_bootstrap4code`(`cmsplugin_ptr_id`);
ALTER TABLE
    `bootstrap4_picture_bootstrap4picture` ADD CONSTRAINT `bootstrap4_picture_bootstrap4picture_picture_id_foreign` FOREIGN KEY(`picture_id`) REFERENCES `filer_image`(`id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_content_bootstrap4blockquote`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_grid_bootstrap4gridcontainer`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_badge_bootstrap4badge`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_grid_bootstrap4gridcolumn`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_listgroup_bootstrap4listgroup`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_collapse_bootstrap4collapsecontainer`(`cmsplugin_ptr_id`);
ALTER TABLE
    `bootstrap4_carousel_bootstrap4carouselslide` ADD CONSTRAINT `bootstrap4_carousel_bootstrap4carouselslide_carousel_image_id_foreign` FOREIGN KEY(`carousel_image_id`) REFERENCES `filer_image`(`id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_picture_bootstrap4picture`(`cmsplugin_ptr_id`);
ALTER TABLE
    `bootstrap4_link_bootstrap4link` ADD CONSTRAINT `bootstrap4_link_bootstrap4link_internal_link_id_foreign` FOREIGN KEY(`internal_link_id`) REFERENCES `cms_page`(`id`);
ALTER TABLE
    `bootstrap4_carousel_bootstrap4carouselslide` ADD CONSTRAINT `bootstrap4_carousel_bootstrap4carouselslide_file_link_id_foreign` FOREIGN KEY(`file_link_id`) REFERENCES `filer_file`(`id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_carousel_bootstrap4carousel`(`cmsplugin_ptr_id`);
ALTER TABLE
    `bootstrap4_link_bootstrap4link` ADD CONSTRAINT `bootstrap4_link_bootstrap4link_file_link_id_foreign` FOREIGN KEY(`file_link_id`) REFERENCES `filer_file`(`id`);
ALTER TABLE
    `bootstrap4_picture_bootstrap4picture` ADD CONSTRAINT `bootstrap4_picture_bootstrap4picture_link_page_id_foreign` FOREIGN KEY(`link_page_id`) REFERENCES `cms_page`(`id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_card_bootstrap4cardinner`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_collapse_bootstrap4collapsetrigger`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_media_bootstrap4mediabody`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_card_bootstrap4card`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_grid_bootstrap4gridrow`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_jumbotron_bootstrap4jumbotron`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_tabs_bootstrap4tabitem`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_alerts_bootstrap4alerts`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_media_bootstrap4media`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_collapse_bootstrap4collapse`(`cmsplugin_ptr_id`);
ALTER TABLE
    `bootstrap4_carousel_bootstrap4carouselslide` ADD CONSTRAINT `bootstrap4_carousel_bootstrap4carouselslide_internal_link_id_foreign` FOREIGN KEY(`internal_link_id`) REFERENCES `cms_page`(`id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_carousel_bootstrap4carouselslide`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_utilities_bootstrap4spacing`(`cmsplugin_ptr_id`);
ALTER TABLE
    `bootstrap4_picture_bootstrap4picture` ADD CONSTRAINT `bootstrap4_picture_bootstrap4picture_thumbnail_options_id_foreign` FOREIGN KEY(`thumbnail_options_id`) REFERENCES `filer_thumbmailoption`(`id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_content_bootstrap4figure`(`cmsplugin_ptr_id`);
ALTER TABLE
    `cms_cmsplugin` ADD CONSTRAINT `cms_cmsplugin_id_foreign` FOREIGN KEY(`id`) REFERENCES `bootstrap4_listgroup_bootstrap4listgroupitem`(`cmsplugin_ptr_id`);