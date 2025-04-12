-- For each invoice, show:
-- - its ID
-- - its total
-- - the overall average invoice total
-- - the difference between the invoice total and the average
SELECT
	invoice_id,                     -- ID of the invoice
	invoice_total,                 -- Total amount of the invoice
	(
		SELECT
			AVG(invoice_total)     -- Average of all invoice totals
		FROM
			sql_invoicing.invoices
	) AS invoice_average,          -- Alias for the overall average
	invoice_total - (
		SELECT
			invoice_average       -- Subtracting average (incorrect subquery, will cause error)
	) AS difference                -- Difference between this invoice and the average
FROM
	sql_invoicing.invoices;


-- For each client, show:
-- - their ID and name
-- - total invoice sales for the client
-- - overall average invoice amount
-- - difference between this client's total sales and the average invoice amount
SELECT
	client_id,                     -- ID of the client
	name,                          -- Name of the client
	(
		SELECT
			SUM(invoice_total)    -- Sum of all invoices for this client
		FROM
			sql_invoicing.invoices
		WHERE
			client_id = c.client_id
	) AS total_sales,              -- Alias for total sales of this client
	(
		SELECT
			AVG(invoice_total)    -- Average of all invoice totals
		FROM
			sql_invoicing.invoices
	) AS average,                  -- Alias for overall average
	(
		SELECT
			total_sales - average -- Difference between this client's sales and the average
	) AS difference                -- This will error — aliases can't be used like this in SELECT
FROM
	sql_invoicing.clients c;
