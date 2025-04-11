-- Switch to the `sql_store` database
USE sql_store;

-- Insert a new order for customer with ID 1
-- Assume status '1' means something like "Processing" or "Active"
INSERT INTO orders (
    customer_id, 
    order_date,
    status
)
VALUES (
    1,
    '2019-01-02',
    1
);

-- -------------------------------

-- Get the ID of the newly inserted order
-- This returns the most recent AUTO_INCREMENT value for this session
SELECT LAST_INSERT_ID();

-- -------------------------------

-- Store the result of LAST_INSERT_ID() in a variable
-- So we can reuse it cleanly in a multi-row insert
SET @order_id := LAST_INSERT_ID();

-- Insert multiple items into `order_items` for the newly created order
-- Assumes the table structure is (order_id, product_id, quantity, unit_price)
INSERT INTO order_items
VALUES 
    (@order_id, 1, 1, 2.95),
    (@order_id, 2, 1, 3.95);
   
-- -------------------------------
   
-- Insert a new product
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES ('NewProduct', 10, 15.99);

-- Capture the product_id before doing anything else
SET @product_id := LAST_INSERT_ID();

-- Insert a new order
INSERT INTO orders (customer_id, order_date, status)
VALUES (1, CURDATE(), 1);

-- Capture the order_id
SET @order_id := LAST_INSERT_ID();

-- Insert into order_items
INSERT INTO order_items
VALUES (@order_id, @product_id, 2, 15.99);

