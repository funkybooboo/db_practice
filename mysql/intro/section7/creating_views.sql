-- Create a view that summarizes total sales by client
CREATE VIEW sql_invoicing.sales_by_client AS
SELECT
	c.client_id,                            -- Unique ID of the client
	c.name,                                 -- Name of the client
	SUM(i.invoice_total) AS total_sales     -- Total amount invoiced to the client
FROM
	sql_invoicing.clients c
JOIN sql_invoicing.invoices i             -- Join clients with their invoices
		USING (client_id)
GROUP BY
	client_id,                              -- Group by client ID and name to aggregate properly
	name;

-- Query the view to retrieve clients with total sales over 500
SELECT
	*
FROM
	sql_invoicing.sales_by_client
JOIN sql_invoicing.clients c              -- Rejoin with clients table (though redundant here, as name is already in the view)
		USING (client_id)
WHERE
	total_sales > 500                      -- Filter to include only clients with total sales greater than 500
ORDER BY
	total_sales DESC;                      -- Sort results by highest total sales first


-- Create a view that calculates the outstanding balance for each client
CREATE VIEW sql_invoicing.clients_balance AS
SELECT
	c.client_id,                                             -- Unique ID of the client
	c.name,                                                  -- Name of the client
	SUM(i.invoice_total - i.payment_total) AS balance        -- Total balance owed by the client (unpaid amount)
FROM
	sql_invoicing.clients c
JOIN sql_invoicing.invoices i                               -- Join clients with their invoices
		USING (client_id)
GROUP BY
	c.client_id,                                             -- Group by client ID and name to aggregate balances
	c.name
ORDER BY
	balance DESC;                                            -- Sort by highest outstanding balance

-- Query the client balances view to see current outstanding balances
SELECT * FROM sql_invoicing.clients_balance;
