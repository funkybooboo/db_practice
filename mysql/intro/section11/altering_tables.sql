-- Switch to the target database
USE sql_store2;

-- Alter the customers table
ALTER TABLE customers
    -- 1) Add a NOT NULL last_name column (varchar up to 50 chars) immediately after first_name
    ADD last_name VARCHAR(50) NOT NULL AFTER first_name,
    -- 2) Add a NOT NULL city column (varchar up to 50 chars) at the end of the table
    ADD city VARCHAR(50) NOT NULL,
    -- 3) Change first_name to allow up to 55 chars and set its default to an empty string
    MODIFY COLUMN first_name VARCHAR(55) DEFAULT '',
    -- 4) Remove the points column entirely
    DROP points
;
