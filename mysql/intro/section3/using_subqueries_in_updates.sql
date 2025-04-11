-- Switch to the 'sql_invoicing' database
USE sql_invoicing;

-- Update invoices for the client named 'Myworks':
-- Set payment_total to 50% of invoice_total (rounded to 2 decimals)
-- Set payment_date to due_date
UPDATE invoices
SET
	payment_total = ROUND(invoice_total * 0.5, 2),
	payment_date = due_date
WHERE
	client_id = (
		SELECT client_id
		FROM clients
		WHERE name = 'Myworks'
	);

-- Update invoices for clients located in California (CA) or New York (NY):
-- Same 50% payment logic as above
UPDATE invoices
SET
	payment_total = ROUND(invoice_total * 0.5, 2),
	payment_date = due_date
WHERE
	client_id IN (
		SELECT client_id
		FROM clients
		WHERE state IN ('CA', 'NY')
	);

-- Update invoices that have not yet been paid:
-- Only apply update if payment_date is currently NULL
UPDATE invoices
SET
	payment_total = ROUND(invoice_total * 0.5, 2),
	payment_date = due_date
WHERE
	payment_date IS NULL;

-- Switch to the 'sql_store' database
USE sql_store;

-- Mark customers as 'Gold customer' in the orders table:
-- Only applies to orders where the customer has more than 3000 points
UPDATE orders
SET
	comments = 'Gold customer'
WHERE
	customer_id IN (
		SELECT customer_id
		FROM customers
		WHERE points > 3000
	);
