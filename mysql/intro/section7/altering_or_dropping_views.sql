-- If you made a mistake with the view you just created, you have two options:
-- 1. Drop the view and recreate it with the fixes
-- 2. Use ALTER (or CREATE OR REPLACE) to fix it in place (preferred)

-- OPTION 1: Drop and Recreate
-- This completely deletes the existing view and recreates it from scratch
DROP VIEW sql_invoicing.sales_by_client;

CREATE VIEW sql_invoicing.sales_by_client AS
SELECT
	c.client_id,                          -- Client ID
	c.name,                               -- Client Name
	SUM(i.invoice_total) AS total_sales   -- Total of all invoices per client
FROM
	sql_invoicing.clients c
JOIN sql_invoicing.invoices i
		USING (client_id)                 -- Join clients to invoices by client_id
GROUP BY
	client_id,                            -- Group by client to calculate aggregates
	name;

-- OPTION 2: Alter using CREATE OR REPLACE (preferred)
-- This modifies the existing view in place without needing to drop it first
CREATE OR REPLACE VIEW sql_invoicing.sales_by_client AS
SELECT
	c.client_id,
	c.name,
	SUM(i.invoice_total) AS total_sales
FROM
	sql_invoicing.clients c
JOIN sql_invoicing.invoices i
		USING (client_id)
GROUP BY
	client_id,
	name;
