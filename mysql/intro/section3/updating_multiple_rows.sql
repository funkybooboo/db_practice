-- Switch to the 'sql_invoicing' database
USE sql_invoicing;

-- Update all invoices for client_id = 3:
-- Set payment_total to 50% of invoice_total (rounded to 2 decimal places)
-- Set payment_date equal to due_date
UPDATE invoices
SET
	payment_total = ROUND(invoice_total * 0.5, 2),
	payment_date = due_date
WHERE client_id = 3;

-- Update all invoices for clients with IDs 3 or 4:
-- Same logic: 50% payment, payment_date matches due_date
UPDATE invoices
SET
	payment_total = ROUND(invoice_total * 0.5, 2),
	payment_date = due_date
WHERE client_id IN (3, 4);

-- Switch to the 'sql_store' database
USE sql_store;

-- Add 50 bonus points to any customer born before January 1, 1990
UPDATE customers
SET
	points = points + 50
WHERE 
	birth_date < '1990-01-01';
