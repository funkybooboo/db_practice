-- User or session variable
SET @invoices_count = 0; -- This variable is declared at the session level, not inside the procedure

DELIMITER $$

-- Create a stored procedure named 'get_risk_factor' in the 'sql_invoicing' schema
CREATE PROCEDURE sql_invoicing.get_risk_factor()
BEGIN
	-- Local variables declared inside the procedure
	DECLARE risk_factor DECIMAL(9, 2) DEFAULT 0; -- Initialized to 0; would be NULL if no default was given
	DECLARE invoices_total DECIMAL(9, 2);        -- Will store the sum of all invoice totals
	DECLARE invoices_count INT;                 -- Will store the count of all invoices

	-- Fetch the number of invoices and their total amount from the 'invoices' table
	SELECT
		COUNT(*),              -- Count all rows (invoices)
		SUM(invoice_total)     -- Sum of all invoice_total values
	INTO
		invoices_count,        -- Store count into this local variable
		invoices_total         -- Store sum into this local variable
	FROM
		sql_invoicing.invoices;

	-- Calculate a custom 'risk factor' based on the average invoice amount
	SET risk_factor = invoices_total / invoices_count * 5;

	-- Return the computed risk factor
	SELECT risk_factor;
END$$

DELIMITER ;

-- Call the stored procedure to get the risk factor
CALL sql_invoicing.get_risk_factor();
