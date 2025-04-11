-- Switch to the 'sql_invoicing' database
USE sql_invoicing;

-- DELETE FROM invoices; -- delete everything in this table

-- Delete only invoices that belong to the client named 'Myworks'
DELETE
FROM
	invoices
WHERE
	client_id = (
		SELECT
			client_id
		FROM
			clients
		WHERE
			name = 'Myworks'
	);

-- Safer version if multiple clients might have the name 'Myworks'
DELETE
FROM
	invoices
WHERE
	client_id IN (
		SELECT
			client_id
		FROM
			clients
		WHERE
			name = 'Myworks'
	);
