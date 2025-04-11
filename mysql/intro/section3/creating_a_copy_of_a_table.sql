-- Switch to the sql_store database
USE sql_store;

-- Create a new table `orders_archived` and copy ALL current orders
-- Note: This copies column structure and data, but NOT metadata like primary keys, indexes, or auto_increment settings
CREATE TABLE orders_archived AS 
SELECT *
FROM orders;

-- Optionally archive only *old* orders (before 2019)
-- This INSERT will ADD these older rows into `orders_archived` if it's already been created
INSERT INTO orders_archived
SELECT *
FROM orders
WHERE order_date < '2019-01-01';

-- -----------------------

-- If you only want old orders, you can skip creating the table first and just do:
CREATE TABLE orders_archived AS
SELECT *
FROM orders
WHERE order_date < '2019-01-01';

-- -----------------------

-- Switch to the sql_invoicing database
USE sql_invoicing;

-- Create a new archive table `invoices_archived`
-- Includes selected invoice fields + client name via JOIN
-- Only includes invoices that have been paid (i.e., `payment_date IS NOT NULL`)
CREATE TABLE invoices_archived AS
SELECT
    i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.payment_date,
    i.due_date
FROM invoices i
JOIN clients c USING (client_id)
WHERE i.payment_date IS NOT NULL;

