-- Updatable views:
-- A view is *updatable* (i.e., can be used in INSERT, UPDATE, DELETE) if it does NOT contain:
--   - DISTINCT
--   - Aggregate functions (SUM, AVG, etc.)
--   - GROUP BY or HAVING
--   - UNION or UNION ALL
--   - Joins in some SQL engines (MySQL allows certain simple joins)

-- Create an updatable view of invoices that still have an outstanding balance
CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT 
	invoice_id,
	number,
	client_id,
	invoice_total,
	payment_total,
	invoice_total - payment_total AS balance,
	invoice_date,
	due_date,
	payment_date
FROM 
	sql_invoicing.invoices
WHERE 
	invoice_total - payment_total > 0;

-- Delete an invoice record through the view
DELETE
FROM
	sql_invoicing.invoices_with_balance
WHERE
	invoice_id = 1;

-- Update the due date of a specific invoice through the view
UPDATE
	sql_invoicing.invoices_with_balance
SET
	due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
WHERE
	invoice_id = 2;
