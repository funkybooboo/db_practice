-- Switch to the `sql_invoicing` database
USE sql_invoicing;

-- Get clients with more than $500 in total sales and more than 5 invoices
SELECT
    client_id,
    SUM(invoice_total) AS total_sales, -- Calculate total sales per client
    COUNT(*) AS number_of_invoices -- Count number of invoices per client
FROM invoices
    JOIN clients USING (client_id) -- Join to get client details
GROUP BY
    client_id
HAVING
    total_sales > 500 -- Filter for clients with sales > $500
    AND number_of_invoices > 5;
-- And more than 5 invoices

-- Switch to the `sql_store` database
USE sql_store;

-- Get customers located in Virginia who have spent more than $100
SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) AS total_sales -- Calculate total sales per customer
FROM
    customers c
    JOIN orders o USING (customer_id) -- Join to get orders per customer
    JOIN order_items oi USING (order_id) -- Join to get order items per order
WHERE
    state = 'VA' -- Filter for customers in Virginia
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    total_sales > 100;
-- Only include those who spent > $100