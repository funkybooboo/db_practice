-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS sql_store2;

-- Select the database to use
USE sql_store2;

-- Drop existing tables if they exist to start fresh
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- Create 'customers' table
CREATE TABLE IF NOT EXISTS customers (
    customer_id 	INT PRIMARY KEY AUTO_INCREMENT,  -- Unique customer ID, auto-incremented
    first_name 		VARCHAR(50) NOT NULL,             -- Customer's first name, required
    points 			INT NOT NULL DEFAULT 0,           -- Loyalty points, defaults to 0
    email 			VARCHAR(255) NOT NULL UNIQUE      -- Customer email, must be unique
);

-- Create 'orders' table
CREATE TABLE IF NOT EXISTS orders (
    order_id 		INT PRIMARY KEY AUTO_INCREMENT,  -- Unique order ID, auto-incremented
    customer_id		INT NOT NULL,                    -- ID of the customer who placed the order
    FOREIGN KEY fk_orders_customers (customer_id)    -- Foreign key constraint to 'customers'
        REFERENCES customers (customer_id)
        ON UPDATE CASCADE                             -- Update 'customer_id' in orders if it changes in customers
        ON DELETE NO ACTION                           -- Prevent deletion of customers who have orders
);

-- Alter 'customers' table
ALTER TABLE customers
    ADD last_name VARCHAR(50) NOT NULL AFTER first_name,   -- Add 'last_name' column after 'first_name'
    ADD city VARCHAR(50) NOT NULL,                         -- Add 'city' column
    MODIFY COLUMN first_name VARCHAR(55) DEFAULT '',       -- Modify 'first_name' to allow empty string default
    DROP points;                                            -- Remove 'points' column

-- Alter 'orders' table
ALTER TABLE orders
	ADD PRIMARY KEY (order_id),     -- Re-add primary key on 'order_id' (redundant since already primary, but added here per script)
	DROP PRIMARY KEY,               -- Drop existing primary key (odd sequence — see note below)
	DROP FOREIGN KEY fk_orders_customers,   -- Drop existing foreign key constraint
	ADD FOREIGN KEY fk_orders_customers (customer_id)       -- Recreate foreign key constraint to 'customers'
		REFERENCES customers (customer_id)
		ON UPDATE CASCADE
		ON DELETE NO ACTION;
