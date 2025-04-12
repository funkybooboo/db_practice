-- Select clients who have at least two invoices using a subquery with IN
SELECT
	*
FROM
	sql_invoicing.clients
WHERE
	client_id IN (
		-- Select client IDs from invoices table grouped by client
		SELECT
			client_id
		FROM
			sql_invoicing.invoices
		GROUP BY
			client_id
		-- Only include clients with 2 or more invoices
		HAVING
			COUNT(*) >= 2
	);


-- Same logic as above, but using = ANY instead of IN
SELECT
	*
FROM
	sql_invoicing.clients
WHERE
	client_id = ANY (
		-- Select client IDs from invoices table grouped by client
		SELECT
			client_id
		FROM
			sql_invoicing.invoices
		GROUP BY
			client_id
		-- Only include clients with 2 or more invoices
		HAVING
			COUNT(*) >= 2
	);
