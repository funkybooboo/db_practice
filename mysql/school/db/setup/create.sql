-- Create and use the school database
CREATE DATABASE IF NOT EXISTS school;
USE school;

-- Students table: Each student is uniquely identified by student_id.
CREATE TABLE students (
    student_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_registered DATETIME NOT NULL
);

-- Courses table: Each course is uniquely identified by course_id.
CREATE TABLE courses (
    course_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    date_created DATETIME NOT NULL,
    date_modified DATETIME NOT NULL
);

-- Student_Courses table: Linking students and courses.
-- A student can enroll in several courses and each enrollment is unique by (student_id, course_id).
CREATE TABLE student_courses (
    student_id BIGINT UNSIGNED NOT NULL,
    course_id BIGINT UNSIGNED NOT NULL,
    enrolled_at DATETIME NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    coupon VARCHAR(50),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Tags table: Tags used to describe courses.
CREATE TABLE tags (
    tag_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Course_Tags table: A linking table for the many-to-many relationship between courses and tags.
CREATE TABLE course_tags (
    course_id BIGINT UNSIGNED NOT NULL,
    tag_id BIGINT UNSIGNED NOT NULL,
    tagged_at DATETIME NOT NULL,
    PRIMARY KEY (course_id, tag_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

-- Instructors table: Each instructor has a unique identifier.
CREATE TABLE instructors (
    instructor_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_registered DATETIME NOT NULL
);

-- Instructor_Courses table: Linking instructors to courses.
-- The composite primary key ensures that each instructor–course assignment is unique.
CREATE TABLE instructor_courses (
    instructor_id BIGINT UNSIGNED NOT NULL,
    course_id BIGINT UNSIGNED NOT NULL,
    assigned_at DATETIME NOT NULL,
    pay_per_student DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (instructor_id, course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
