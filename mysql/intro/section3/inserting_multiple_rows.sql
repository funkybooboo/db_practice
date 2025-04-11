-- Switch to the `sql_store` database
USE sql_store;

-- Insert multiple rows into the `shippers` table
-- Assumes the `shippers` table has at least: (shipper_id, name)
-- shipper_id is auto-incremented, so only `name` is provided
INSERT INTO shippers (name)
VALUES 
    ('Shipper1'),
    ('Shipper2'),
    ('Shipper3');

-- Insert multiple rows into the `products` table
-- Assumes the `products` table has at least: (product_id, name, quantity_in_stock, unit_price)
-- product_id is auto-incremented, so it's not included in the insert
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES
    ('Product1', 10, 12.4),
    ('Product2', 21, 1.4),
    ('Product3', 87, 11.1);
