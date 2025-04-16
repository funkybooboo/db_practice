-- Use the school database
USE school;

-- Insert Sample Data for the Students Table
INSERT INTO students (first_name, last_name, email, date_registered) VALUES
    ('John', 'Doe', 'john.doe@example.com', NOW()),
    ('Jane', 'Smith', 'jane.smith@example.com', NOW()),
    ('Michael', 'Johnson', 'michael.johnson@example.com', NOW());

-- Insert Sample Data for the Courses Table 
INSERT INTO courses (title, price, date_created, date_modified) VALUES
    ('Introduction to Programming', 99.99, NOW(), NOW()),
    ('Database Fundamentals', 149.99, NOW(), NOW()),
    ('Web Development Basics', 199.99, NOW(), NOW());

-- Insert Sample Data for the Instructors Table
INSERT INTO instructors (first_name, last_name, email, date_registered) VALUES
    ('Alice', 'Johnson', 'alice.johnson@example.com', NOW()),
    ('Bob', 'Miller', 'bob.miller@example.com', NOW());

-- Insert Sample Data for the Tags Table 
INSERT INTO tags (name) VALUES
    ('Programming'),
    ('Database'),
    ('Web Development'),
    ('Beginner');


-- Insert Sample Data for the Student_Courses Table
INSERT INTO student_courses (student_id, course_id, enrolled_at, price, coupon) VALUES
    (1, 1, NOW(), 99.99, 'WELCOME10'),
    (2, 2, NOW(), 149.99, NULL),
    (1, 3, NOW(), 199.99, 'SUMMER20'),
    (3, 1, NOW(), 99.99, NULL);

-- Insert Sample Data for the Course_Tags Table 
INSERT INTO course_tags (course_id, tag_id, tagged_at) VALUES
    (1, 1, NOW()), -- "Introduction to Programming" tagged as "Programming"
    (1, 4, NOW()), -- "Introduction to Programming" tagged as "Beginner"
    (2, 2, NOW()), -- "Database Fundamentals" tagged as "Database"
    (3, 1, NOW()), -- "Web Development Basics" tagged as "Programming"
    (3, 3, NOW()); -- "Web Development Basics" tagged as "Web Development"

-- Insert Sample Data for the Instructor_Courses Table
INSERT INTO instructor_courses (instructor_id, course_id, assigned_at, pay_per_student) VALUES
    (1, 1, NOW(), 10.00),
    (2, 2, NOW(), 12.00),
    (1, 3, NOW(), 15.00);

