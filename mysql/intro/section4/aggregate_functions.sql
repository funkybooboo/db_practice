-- Switch to the `sql_invoicing` database
USE sql_invoicing;

-- Aggregate stats on invoices issued after July 1st, 2019
SELECT
	MAX(invoice_total) AS highest,                     -- Highest invoice amount
	MIN(invoice_total) AS lowest,                      -- Lowest invoice amount
	AVG(invoice_total) AS average,                     -- Average invoice amount
	SUM(invoice_total * 1.1) AS total,                 -- Total invoice amount with a 10% markup (e.g., tax)
	COUNT(invoice_total) AS number_of_invoices,        -- Count of non-null invoice totals
	COUNT(payment_date) AS count_of_payments,          -- Count of invoices that have been paid
	COUNT(DISTINCT client_id) AS total_records         -- Unique clients with invoices after the given date
FROM
	invoices
WHERE invoice_date > '2019-07-01';


-- Compare invoice totals and payments between the first and second halves of 2019
-- and provide a grand total for the entire year
SELECT
	'First half of 2019' AS date_range,                                 -- Label for the row
	SUM(invoice_total) AS total_sales,                                  -- Total invoiced in H1 2019
	SUM(payment_total) AS total_payments,                               -- Total paid in H1 2019
	SUM(invoice_total - payment_total) AS what_we_expect                -- Outstanding balance (if any)
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'

UNION

SELECT
	'Second half of 2019' AS date_range,                                -- Label for the row
	SUM(invoice_total) AS total_sales,                                  -- Total invoiced in H2 2019
	SUM(payment_total) AS total_payments,                               -- Total paid in H2 2019
	SUM(invoice_total - payment_total) AS what_we_expect                -- Outstanding balance (if any)
FROM invoices
WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'

UNION

SELECT
	'Total' AS date_range,                                              -- Label for the row
	SUM(invoice_total) AS total_sales,                                  -- Total invoiced in all of 2019
	SUM(payment_total) AS total_payments,                               -- Total paid in all of 2019
	SUM(invoice_total - payment_total) AS what_we_expect                -- Total outstanding balance
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-12-31';
