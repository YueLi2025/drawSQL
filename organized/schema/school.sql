CREATE TABLE `account_sectors`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `accounts`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `amount` INT NOT NULL,
    `description` TEXT NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `attendances`(
    `id` INT NOT NULL,
    `student_id` INT NOT NULL,
    `section_id` INT NOT NULL,
    `exam_id` INT NOT NULL,
    `present` TINYINT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `books`(
    `id` INT NOT NULL,
    `book_code` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `author` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL,
    `rackNo` VARCHAR(255) NOT NULL,
    `rowNo` VARCHAR(255) NOT NULL,
    `img_path` VARCHAR(255) NOT NULL,
    `about` TEXT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `price` INT NOT NULL,
    `class_id` INT NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `books` ADD UNIQUE `books_book_code_unique`(`book_code`);
CREATE TABLE `classes`(
    `id` INT NOT NULL,
    `class_number` VARCHAR(255) NOT NULL,
    `school_id` INT NOT NULL,
    `group` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `courses`(
    `id` INT NOT NULL,
    `course_name` VARCHAR(255) NOT NULL,
    `class_id` INT NOT NULL,
    `course_type` VARCHAR(255) NOT NULL,
    `course_time` VARCHAR(255) NOT NULL,
    `grade_system_name` VARCHAR(255) NOT NULL,
    `quiz_count` INT NOT NULL,
    `assignment_count` INT NOT NULL,
    `ct_count` INT NOT NULL,
    `quiz_percent` INT NOT NULL,
    `attendance_percent` INT NOT NULL,
    `assignment_percent` INT NOT NULL,
    `ct_percent` INT NOT NULL,
    `final_exam_percent` INT NOT NULL,
    `practical_percent` INT NOT NULL,
    `att_fullmark` INT NOT NULL,
    `quiz_fullmark` INT NOT NULL,
    `a_fullmark` INT NOT NULL,
    `ct_fullmark` INT NOT NULL,
    `final_fullmark` INT NOT NULL,
    `practical_fullmark` INT NOT NULL,
    `school_id` INT NOT NULL,
    `exam_id` INT NOT NULL,
    `teacher_id` INT NOT NULL,
    `section_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `departments`(
    `id` INT NOT NULL,
    `school_id` INT NOT NULL,
    `department_name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `events`(
    `id` INT NOT NULL,
    `file_path` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `active` TINYINT NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `exam_for_classes`(
    `id` INT NOT NULL,
    `class_id` INT NOT NULL,
    `exam_id` INT NOT NULL,
    `active` TINYINT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `exams`(
    `id` INT NOT NULL,
    `exam_name` VARCHAR(255) NOT NULL,
    `active` TINYINT NOT NULL,
    `notice_published` TINYINT NOT NULL,
    `result_published` TINYINT NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `term` VARCHAR(255) NOT NULL,
    `start_date` VARCHAR(255) NOT NULL,
    `end_date` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `faqs`(
    `id` INT NOT NULL,
    `question` VARCHAR(255) NOT NULL,
    `answer` TEXT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `feedbacks`(
    `id` INT NOT NULL,
    `description` TEXT NOT NULL,
    `teacher_id` INT NOT NULL,
    `student_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `fees`(
    `id` INT NOT NULL,
    `fee_name` VARCHAR(255) NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `forms`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `file_path` VARCHAR(255) NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `grade_systems`(
    `id` INT NOT NULL,
    `grade_system_name` VARCHAR(255) NOT NULL,
    `grade` VARCHAR(255) NOT NULL,
    `point` DOUBLE NOT NULL,
    `from_mark` INT NOT NULL,
    `to_mark` INT NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `grades`(
    `id` INT NOT NULL,
    `marks` DOUBLE NOT NULL,
    `gpa` DOUBLE NOT NULL,
    `attendance` DOUBLE NOT NULL,
    `quiz1` DOUBLE NOT NULL,
    `quiz2` DOUBLE NOT NULL,
    `quiz3` DOUBLE NOT NULL,
    `quiz4` DOUBLE NOT NULL,
    `quiz5` DOUBLE NOT NULL,
    `ct1` DOUBLE NOT NULL,
    `ct2` DOUBLE NOT NULL,
    `ct3` DOUBLE NOT NULL,
    `ct4` DOUBLE NOT NULL,
    `ct5` DOUBLE NOT NULL,
    `assignment1` DOUBLE NOT NULL,
    `assignment2` DOUBLE NOT NULL,
    `assignment3` DOUBLE NOT NULL,
    `written` DOUBLE NOT NULL,
    `mcq` DOUBLE NOT NULL,
    `practical` DOUBLE NOT NULL,
    `exam_id` INT NOT NULL,
    `student_id` INT NOT NULL,
    `teacher_id` INT NOT NULL,
    `course_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `homeworks`(
    `id` INT NOT NULL,
    `file_path` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `teacher_id` INT NOT NULL,
    `section_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `issued_books`(
    `id` INT NOT NULL,
    `student_code` INT NOT NULL,
    `book_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    `school_id` INT NOT NULL,
    `issue_date` DATE NOT NULL,
    `return_date` DATE NOT NULL,
    `fine` DECIMAL(8, 2) NOT NULL,
    `borrowed` TINYINT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `messages`(
    `id` INT NOT NULL,
    `phone_number` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `message` TEXT NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `messages` ADD UNIQUE `messages_email_unique`(`email`);
CREATE TABLE `migrations`(
    `id` INT NOT NULL,
    `migration` VARCHAR(255) NOT NULL,
    `batch` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `notices`(
    `id` INT NOT NULL,
    `file_path` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `active` TINYINT NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `notifications`(
    `id` INT NOT NULL,
    `sent_status` TINYINT NOT NULL,
    `active` TINYINT NOT NULL,
    `message` TEXT NOT NULL,
    `student_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `oauth_access_tokens`(
    `id` VARCHAR(255) NOT NULL,
    `user_id` INT NULL,
    `client_id` INT NOT NULL,
    `name` VARCHAR(255) NULL,
    `scopes` TEXT NULL,
    `revoked` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `expires_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth_access_tokens` ADD INDEX `oauth_access_tokens_user_id_index`(`user_id`);
CREATE TABLE `oauth_auth_codes`(
    `id` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `client_id` INT NOT NULL,
    `scopes` TEXT NULL,
    `revoked` TINYINT NOT NULL,
    `expires_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `oauth_clients`(
    `id` INT NOT NULL,
    `user_id` INT NULL,
    `name` VARCHAR(255) NOT NULL,
    `secret` VARCHAR(255) NOT NULL,
    `redirect` TEXT NOT NULL,
    `personal_access_client` TINYINT NOT NULL,
    `password_client` TINYINT NOT NULL,
    `revoked` TINYINT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth_clients` ADD INDEX `oauth_clients_user_id_index`(`user_id`);
CREATE TABLE `oauth_personal_access_clients`(
    `id` INT NOT NULL,
    `client_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth_personal_access_clients` ADD INDEX `oauth_personal_access_clients_client_id_index`(`client_id`);
CREATE TABLE `oauth_refresh_tokens`(
    `id` VARCHAR(255) NOT NULL,
    `access_token_id` VARCHAR(255) NOT NULL,
    `revoked` TINYINT NOT NULL,
    `expires_at` DATETIME NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `oauth_refresh_tokens` ADD INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id`);
CREATE TABLE `password_resets`(
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL
);
ALTER TABLE
    `password_resets` ADD INDEX `password_resets_email_index`(`email`);
CREATE TABLE `payments`(
    `id` INT NOT NULL,
    `payment_id` VARCHAR(255) NOT NULL,
    `payment_status` TINYINT NOT NULL,
    `amount` DOUBLE NOT NULL,
    `custormer_id` INT NOT NULL,
    `charge_for` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `routines`(
    `id` INT NOT NULL,
    `file_path` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `active` TINYINT NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `section_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `schools`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `established` VARCHAR(255) NOT NULL,
    `about` TEXT NOT NULL,
    `medium` VARCHAR(255) NOT NULL,
    `code` INT NOT NULL,
    `theme` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `schools` ADD UNIQUE `schools_code_unique`(`code`);
CREATE TABLE `sections`(
    `id` INT NOT NULL,
    `section_number` VARCHAR(255) NOT NULL,
    `room_number` INT NOT NULL,
    `class_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `student_board_exams`(
    `id` INT NOT NULL,
    `student_id` INT NOT NULL,
    `exam_name` VARCHAR(255) NOT NULL,
    `group` VARCHAR(255) NOT NULL,
    `roll` INT NOT NULL,
    `registration` INT NOT NULL,
    `session` VARCHAR(255) NOT NULL,
    `board` VARCHAR(255) NOT NULL,
    `passing_year` INT NOT NULL,
    `institution_name` VARCHAR(255) NOT NULL,
    `gpa` DOUBLE NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `student_infos`(
    `id` INT NOT NULL,
    `student_id` INT NOT NULL,
    `session` VARCHAR(255) NOT NULL,
    `version` VARCHAR(255) NOT NULL,
    `group` VARCHAR(255) NOT NULL,
    `birthday` DATETIME NOT NULL,
    `religion` VARCHAR(255) NOT NULL,
    `father_name` VARCHAR(255) NOT NULL,
    `father_phone_number` VARCHAR(255) NOT NULL,
    `father_national_id` VARCHAR(255) NOT NULL,
    `father_occupation` VARCHAR(255) NOT NULL,
    `father_designation` VARCHAR(255) NOT NULL,
    `father_annual_income` INT NOT NULL,
    `mother_name` VARCHAR(255) NOT NULL,
    `mother_phone_number` VARCHAR(255) NOT NULL,
    `mother_national_id` VARCHAR(255) NOT NULL,
    `mother_occupation` VARCHAR(255) NOT NULL,
    `mother_designation` VARCHAR(255) NOT NULL,
    `mother_annual_income` INT NOT NULL,
    `user_id` INT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `subscriptions`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `stripe_id` VARCHAR(255) NOT NULL,
    `stripe_plan` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL,
    `trial_ends_at` TIMESTAMP NULL,
    `ends_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `syllabuses`(
    `id` INT NOT NULL,
    `file_path` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `active` TINYINT NOT NULL,
    `school_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `class_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `users`(
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `active` TINYINT NOT NULL,
    `school_id` INT NULL,
    `code` INT NULL,
    `student_code` INT NULL,
    `gender` VARCHAR(255) NOT NULL,
    `blood_group` VARCHAR(255) NOT NULL,
    `nationality` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `about` TEXT NOT NULL,
    `pic_path` VARCHAR(255) NOT NULL,
    `verified` TINYINT NOT NULL,
    `section_id` INT NULL,
    `remember_token` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL,
    `updated_at` TIMESTAMP NULL,
    `department_id` INT NOT NULL,
    `stripe_id` VARCHAR(255) NULL,
    `card_brand` VARCHAR(255) NULL,
    `card_last_four` VARCHAR(255) NULL,
    `trial_ends_at` TIMESTAMP NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD UNIQUE `users_student_code_unique`(`student_code`);
ALTER TABLE
    `users` ADD UNIQUE `users_phone_number_unique`(`phone_number`);
ALTER TABLE
    `student_board_exams` ADD CONSTRAINT `student_board_exams_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `fees` ADD CONSTRAINT `fees_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `notices` ADD CONSTRAINT `notices_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `exam_for_classes` ADD CONSTRAINT `exam_for_classes_class_id_foreign` FOREIGN KEY(`class_id`) REFERENCES `classes`(`id`);
ALTER TABLE
    `oauth_clients` ADD CONSTRAINT `oauth_clients_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_department_id_foreign` FOREIGN KEY(`department_id`) REFERENCES `departments`(`id`);
ALTER TABLE
    `student_board_exams` ADD CONSTRAINT `student_board_exams_student_id_foreign` FOREIGN KEY(`student_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_custormer_id_foreign` FOREIGN KEY(`custormer_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `account_sectors` ADD CONSTRAINT `account_sectors_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `grade_systems` ADD CONSTRAINT `grade_systems_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `exams` ADD CONSTRAINT `exams_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `grades` ADD CONSTRAINT `grades_course_id_foreign` FOREIGN KEY(`course_id`) REFERENCES `courses`(`id`);
ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `courses` ADD CONSTRAINT `courses_exam_id_foreign` FOREIGN KEY(`exam_id`) REFERENCES `exams`(`id`);
ALTER TABLE
    `classes` ADD CONSTRAINT `classes_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `feedbacks` ADD CONSTRAINT `feedbacks_student_id_foreign` FOREIGN KEY(`student_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `syllabuses` ADD CONSTRAINT `syllabuses_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `books` ADD CONSTRAINT `books_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_section_id_foreign` FOREIGN KEY(`section_id`) REFERENCES `sections`(`id`);
ALTER TABLE
    `routines` ADD CONSTRAINT `routines_section_id_foreign` FOREIGN KEY(`section_id`) REFERENCES `sections`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `notices` ADD CONSTRAINT `notices_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `exams` ADD CONSTRAINT `exams_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `forms` ADD CONSTRAINT `forms_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `syllabuses` ADD CONSTRAINT `syllabuses_class_id_foreign` FOREIGN KEY(`class_id`) REFERENCES `classes`(`id`);
ALTER TABLE
    `courses` ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `faqs` ADD CONSTRAINT `faqs_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `departments` ADD CONSTRAINT `departments_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `student_infos` ADD CONSTRAINT `student_infos_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `student_infos` ADD CONSTRAINT `student_infos_student_id_foreign` FOREIGN KEY(`student_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `oauth_auth_codes` ADD CONSTRAINT `oauth_auth_codes_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `fees` ADD CONSTRAINT `fees_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `issued_books` ADD CONSTRAINT `issued_books_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `sections` ADD CONSTRAINT `sections_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `routines` ADD CONSTRAINT `routines_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `sections` ADD CONSTRAINT `sections_class_id_foreign` FOREIGN KEY(`class_id`) REFERENCES `classes`(`id`);
ALTER TABLE
    `courses` ADD CONSTRAINT `courses_class_id_foreign` FOREIGN KEY(`class_id`) REFERENCES `classes`(`id`);
ALTER TABLE
    `grades` ADD CONSTRAINT `grades_exam_id_foreign` FOREIGN KEY(`exam_id`) REFERENCES `exams`(`id`);
ALTER TABLE
    `attendances` ADD CONSTRAINT `attendances_exam_id_foreign` FOREIGN KEY(`exam_id`) REFERENCES `exams`(`id`);
ALTER TABLE
    `courses` ADD CONSTRAINT `courses_section_id_foreign` FOREIGN KEY(`section_id`) REFERENCES `sections`(`id`);
ALTER TABLE
    `exam_for_classes` ADD CONSTRAINT `exam_for_classes_exam_id_foreign` FOREIGN KEY(`exam_id`) REFERENCES `exams`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `accounts` ADD CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `oauth_access_tokens` ADD CONSTRAINT `oauth_access_tokens_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `account_sectors` ADD CONSTRAINT `account_sectors_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_payment_id_foreign` FOREIGN KEY(`payment_id`) REFERENCES `payments`(`id`);
ALTER TABLE
    `attendances` ADD CONSTRAINT `attendances_section_id_foreign` FOREIGN KEY(`section_id`) REFERENCES `sections`(`id`);
ALTER TABLE
    `grades` ADD CONSTRAINT `grades_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `attendances` ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `grade_systems` ADD CONSTRAINT `grade_systems_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `homeworks` ADD CONSTRAINT `homeworks_section_id_foreign` FOREIGN KEY(`section_id`) REFERENCES `sections`(`id`);
ALTER TABLE
    `forms` ADD CONSTRAINT `forms_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `syllabuses` ADD CONSTRAINT `syllabuses_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `subscriptions` ADD CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `issued_books` ADD CONSTRAINT `issued_books_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `messages` ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `books` ADD CONSTRAINT `books_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `courses` ADD CONSTRAINT `courses_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `issued_books` ADD CONSTRAINT `issued_books_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `books`(`id`);
ALTER TABLE
    `accounts` ADD CONSTRAINT `accounts_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);
ALTER TABLE
    `feedbacks` ADD CONSTRAINT `feedbacks_teacher_id_foreign` FOREIGN KEY(`teacher_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `books` ADD CONSTRAINT `books_class_id_foreign` FOREIGN KEY(`class_id`) REFERENCES `classes`(`id`);
ALTER TABLE
    `routines` ADD CONSTRAINT `routines_school_id_foreign` FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`);