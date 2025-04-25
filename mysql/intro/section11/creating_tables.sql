-- Create a new database if it doesn't already exist
CREATE DATABASE IF NOT EXISTS sql_store2;

-- Switch to the newly created (or existing) database
USE sql_store2;

-- Drop the 'customers' table if it already exists (useful for resetting during development)
DROP TABLE IF EXISTS customers;

-- Create the 'customers' table if it doesn't already exist
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each customer
    first_name VARCHAR(50) NOT NULL,             -- Customer's first name (required)
    points INT NOT NULL DEFAULT 0,               -- Loyalty/reward points, defaults to 0
    email VARCHAR(255) NOT NULL UNIQUE           -- Customer email, must be unique and not null
);
