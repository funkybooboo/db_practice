-- Remove the function if it already exists
DROP FUNCTION IF EXISTS sql_invoicing.get_risk_factor_for_client_func;

-- Change the delimiter so semicolons inside the function don't end it early
DELIMITER $$

-- Create a function that returns a calculated risk factor for a given client
CREATE FUNCTION sql_invoicing.get_risk_factor_for_client_func(p_client_id INT)
RETURNS DECIMAL(9, 2)  -- Return type must be declared (precision, scale)

-- DETERMINISTIC         -- Only needed if same input always returns the same output
READS SQL DATA          -- Required if you read from tables
-- MODIFIES SQL DATA     -- Only needed if you're updating/inserting/deleting data

BEGIN
    -- Declare local variables. These are temporary and only exist during the function call.
	DECLARE risk_factor DECIMAL(9, 2) DEFAULT 0;  -- Final value to return
	DECLARE invoices_total DECIMAL(9, 2);         -- Will store the total invoice amount for the client
	DECLARE invoices_count INT;                   -- Will store how many invoices the client has

	-- Query to get both the number of invoices and the total value of those invoices
	SELECT
		COUNT(*),              -- Total number of matching rows
		SUM(invoice_total)     -- Total of the invoice_total column
	INTO
		invoices_count,        -- Save the count result
		invoices_total         -- Save the sum result
	FROM
		sql_invoicing.invoices i
	WHERE 
		i.client_id = p_client_id;  -- Filter invoices to only the given client

	-- Calculate the risk factor as: average invoice total * 5
	-- If there are no invoices, this would normally result in NULL
	SET risk_factor = invoices_total / invoices_count * 5;

	-- Return 0 instead of NULL if there were no invoices (to avoid errors or unexpected nulls)
	RETURN IFNULL(risk_factor, 0);
END$$

-- Reset the delimiter back to the default semicolon
DELIMITER ;

-- Use the function to show each client’s risk factor
SELECT
	client_id,
	name,
	sql_invoicing.get_risk_factor_for_client_func(client_id) AS risk_factor
FROM
	sql_invoicing.clients;
