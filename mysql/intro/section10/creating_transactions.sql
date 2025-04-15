USE sql_store; 
-- Select the database to work with

START TRANSACTION;
-- Begin a transaction block to group multiple SQL statements as a single unit

INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-01', 1);
-- Insert a new order for customer with ID 1

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);
-- Add an item to the order we just inserted
-- LAST_INSERT_ID() returns the ID of the last inserted order

COMMIT;
-- Commit the transaction: permanently save the changes

-- ROLLBACK;
-- Optionally, use this instead of COMMIT to undo the changes (useful for testing or error handling)

SHOW VARIABLES LIKE 'autocommit';
-- Check if autocommit is enabled
-- If ON, MySQL commits each statement automatically unless inside a START TRANSACTION block
