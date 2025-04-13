-- Remove the procedure if it already exists to avoid conflict
DROP PROCEDURE IF EXISTS sql_invoicing.get_unpaid_invoices_for_client;

-- Change the statement delimiter to $$ to support the full procedure body
DELIMITER $$ 

-- Create a stored procedure to get unpaid invoices for a specific client
CREATE PROCEDURE sql_invoicing.get_unpaid_invoices_for_client
(
	p_client_id INT,                      -- Input parameter: ID of the client
	OUT p_invoices_count INT,            -- Output parameter: total number of unpaid invoices
	OUT p_invoice_total DECIMAL(9, 2)    -- Output parameter: total amount of unpaid invoices
)
BEGIN
	-- Get the count and sum of unpaid invoices for the given client
	SELECT
		COUNT(*),                      -- Total unpaid invoices
		SUM(i.invoice_total)          -- Total amount of unpaid invoices
	INTO p_invoices_count, p_invoice_total -- Store results into OUT parameters
	FROM sql_invoicing.invoices i
	WHERE 
		i.client_id = p_client_id AND -- Filter by given client ID
		i.payment_total = 0;          -- Only include invoices that haven't been paid
END$$

-- Restore the statement delimiter
DELIMITER ;

-- Declare user-defined session variables to receive the OUT values
SET @invoices_count = 0;
SET @invoice_total = 0;

-- Call the stored procedure with client ID 3, storing output in the session variables
CALL sql_invoicing.get_unpaid_invoices_for_client(3, @invoices_count, @invoice_total);

-- Display the output values
SELECT @invoices_count AS invoices_count, @invoice_total AS invoice_total;
