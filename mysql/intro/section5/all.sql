-- Find all invoices that are larger than the largest invoice from client with ID 3
SELECT
	*
FROM
	sql_invoicing.invoices
WHERE
	invoice_total > (
		-- Subquery returns the maximum invoice total for client 3
		SELECT
			MAX(invoice_total)
		FROM
			sql_invoicing.invoices
		WHERE
			client_id = 3
	);

-- Same logic using the ALL keyword instead of MAX()
-- Returns all invoices that are greater than every invoice from client 3
SELECT
	*
FROM
	sql_invoicing.invoices
WHERE
	invoice_total > ALL (
		-- Subquery returns all invoice totals for client 3
		SELECT
			invoice_total
		FROM
			sql_invoicing.invoices
		WHERE
			client_id = 3
	);
