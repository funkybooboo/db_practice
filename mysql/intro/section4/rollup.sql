-- Switch to the `sql_invoicing` database
USE sql_invoicing;

-- Get total sales grouped by client
SELECT client_id, SUM(invoice_total) AS total_sales -- Sum of invoices per client
FROM invoices
GROUP BY
    client_id;

-- Same as above, but includes a rollup row for grand total
SELECT client_id, SUM(invoice_total) AS total_sales -- Sum of invoices per client + grand total
FROM invoices
GROUP BY
    client_id
WITH
    ROLLUP;

-- Get total sales grouped by state and city, including subtotals and grand total
SELECT state, city, SUM(invoice_total) AS total_sales -- Sum of invoices grouped by state and city
FROM invoices i
    JOIN clients c USING (client_id) -- Join clients to get state and city info
GROUP BY
    state,
    city
WITH
    ROLLUP;
-- Includes subtotals by state and overall total

-- Get total payment amounts per payment method, including a rollup for grand total
SELECT pm.name AS payment_method, SUM(p.amount) AS total -- Sum of payments grouped by method
FROM
    payments p
    JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY
    pm.name
WITH
    ROLLUP;
-- Includes grand total across all payment methods