-- Select all columns from a derived table (sales_summary)
SELECT
	*
FROM (
	-- Create a derived table that calculates total sales, average invoice amount, and the difference
	SELECT
		client_id,  -- ID of the client
		name,       -- Name of the client
		
		-- Subquery to calculate the total invoice amount for the current client
		(
		SELECT
			SUM(invoice_total)
		FROM
			sql_invoicing.invoices
		WHERE
			client_id = c.client_id
		) AS total_sales,

		-- Subquery to calculate the average invoice amount across all clients
		(
		SELECT
			AVG(invoice_total)
		FROM
			sql_invoicing.invoices
		) AS average,
		-- Subquery to calculate the differance between total_sales and average
		(
		SELECT
			total_sales - average 
		) AS difference
	FROM
		sql_invoicing.clients c
) AS sales_summary
-- Only include clients who have at least one invoice (i.e., total_sales is not NULL)
WHERE total_sales IS NOT NULL;
