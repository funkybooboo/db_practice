-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS sql_store2;

-- Switch to using the newly created database
USE sql_store2;

-- Drop the orders and customers tables if they already exist (to start fresh)
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- Create the customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id 	INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each customer, auto-incremented
    first_name 		VARCHAR(50) NOT NULL,           -- First name of the customer (required)
    points 			INT NOT NULL DEFAULT 0,         -- Points assigned to the customer, defaults to 0
    email 			VARCHAR(255) NOT NULL UNIQUE    -- Email address, must be unique and not null
);

-- Create the orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id 		INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each order, auto-incremented
    customer_id		INT NOT NULL,                   -- Foreign key linking to customers
    FOREIGN KEY fk_orders_customers (customer_id)
        REFERENCES customers (customer_id)
        ON UPDATE CASCADE            -- If customer_id changes, update here too
        ON DELETE NO ACTION          -- Prevent deletion of a customer if they have orders
);
