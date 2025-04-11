-- Switch to the 'sql_invoicing' database
USE sql_invoicing;

-- Manually update invoice #1: set payment_total to 10 and payment_date to March 1, 2023
UPDATE invoices
SET
	payment_total = 10,
	payment_date = '2023-03-01'
WHERE
	invoice_id = 1;

-- View the current state of all invoices
SELECT * FROM invoices;

-- Reset payment info for invoice #1:
-- Set payment_total to its default value (likely 0 or defined default)
-- Set payment_date to NULL (i.e., no payment made)
UPDATE invoices
SET
	payment_total = DEFAULT,
	payment_date = NULL
WHERE
	invoice_id = 1;

-- View the current state of all invoices
SELECT * FROM invoices;

-- Update invoice #1 with calculated values:
-- Set payment_total to 50% of invoice_total
-- Set payment_date to the same date as due_date
UPDATE invoices
SET
	payment_total = ROUND(invoice_total * 0.5, 2),
	payment_date = due_date
WHERE
	invoice_id = 1;

-- View the final state of all invoices
SELECT * FROM invoices;
