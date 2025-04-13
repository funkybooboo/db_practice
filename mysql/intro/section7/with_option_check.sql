-- Create or replace the view 'invoices_with_balance'
-- This view shows only invoices where there is an outstanding balance
CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT 
	invoice_id,                         -- Unique ID of the invoice
	number,                             -- Invoice number
	client_id,                          -- Associated client
	invoice_total,                      -- Total amount billed
	payment_total,                      -- Amount paid so far
	invoice_total - payment_total AS balance,  -- Remaining balance
	invoice_date,                       -- Date invoice was issued
	due_date,                           -- When payment is due
	payment_date                        -- When payment was received
FROM 
	sql_invoicing.invoices             -- From the invoices table
WHERE 
	invoice_total - payment_total > 0; -- Only include invoices with a positive balance


-- Attempt to update payment_total to equal invoice_total for invoice_id = 2
-- This would result in a balance of 0, so the row will no longer meet the view's WHERE clause
UPDATE
	sql_invoicing.invoices_with_balance
SET
	payment_total = invoice_total 
WHERE
	invoice_id = 2;

-- After the above update, invoice 2 disappears from the view
-- because its balance is now 0, and the view only shows invoices with balance > 0


-- Recreate the view, this time with the WITH CHECK OPTION
-- This ensures that any updates or inserts through the view must continue to meet the WHERE clause
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
	invoice_total - payment_total > 0
WITH CHECK OPTION;  -- Enforce the WHERE clause on updates and inserts through the view


-- Try the same type of update again, this time for invoice_id = 3
-- The update would make balance = 0, violating the view's WHERE clause
-- Because of WITH CHECK OPTION, this update will now fail with an error
UPDATE
	sql_invoicing.invoices_with_balance
SET
	payment_total = invoice_total 
WHERE
	invoice_id = 3;
