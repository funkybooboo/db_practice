CREATE TABLE `students`(
    `student_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `date_registered` DATETIME NOT NULL
);
CREATE TABLE `courses`(
    `course_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `price` DECIMAL(5, 2) NOT NULL,
    `date_created` DATETIME NOT NULL,
    `date_modified` DATETIME NOT NULL
);
CREATE TABLE `student_courses`(
    `student_id` BIGINT UNSIGNED NOT NULL,
    `course_id` BIGINT UNSIGNED NOT NULL,
    `enrolled_at` DATETIME NOT NULL,
    `price` DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY(`student_id`)
);
ALTER TABLE
    `student_courses` ADD PRIMARY KEY(`course_id`);
CREATE TABLE `tags`(
    `tag_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
);
CREATE TABLE `course_tags`(
    `course_id` BIGINT UNSIGNED NOT NULL,
    `tag_id` BIGINT UNSIGNED NOT NULL,
    `tagged_at` DATETIME NOT NULL,
    PRIMARY KEY(`course_id`)
);
ALTER TABLE
    `course_tags` ADD PRIMARY KEY(`tag_id`);
CREATE TABLE `instructors`(
    `instructor_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `date_registered` DATETIME NOT NULL
);
CREATE TABLE `instructor_courses`(
    `instructor_id` BIGINT UNSIGNED NOT NULL,
    `course_id` BIGINT UNSIGNED NOT NULL,
    `assigned_at` DATETIME NOT NULL,
    `pay_per_student` DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY(`instructor_id`)
);
ALTER TABLE
    `instructor_courses` ADD PRIMARY KEY(`course_id`);
ALTER TABLE
    `students` ADD CONSTRAINT `students_student_id_foreign` FOREIGN KEY(`student_id`) REFERENCES `student_courses`(`student_id`);
ALTER TABLE
    `instructors` ADD CONSTRAINT `instructors_instructor_id_foreign` FOREIGN KEY(`instructor_id`) REFERENCES `instructor_courses`(`instructor_id`);
ALTER TABLE
    `courses` ADD CONSTRAINT `courses_course_id_foreign` FOREIGN KEY(`course_id`) REFERENCES `course_tags`(`course_id`);
ALTER TABLE
    `courses` ADD CONSTRAINT `courses_course_id_foreign` FOREIGN KEY(`course_id`) REFERENCES `student_courses`(`course_id`);
ALTER TABLE
    `tags` ADD CONSTRAINT `tags_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `course_tags`(`tag_id`);
ALTER TABLE
    `courses` ADD CONSTRAINT `courses_course_id_foreign` FOREIGN KEY(`course_id`) REFERENCES `instructor_courses`(`course_id`);