-- Set the custom statement delimiter to $$ to define the stored procedure body cleanly
DELIMITER $$

- Create a stored procedure called `get_clients`
-- This procedure retrieves all records from the `clients` table
CREATE PROCEDURE sql_invoicing.get_clients()
BEGIN
	SELECT
		*                       -- Select all columns
	FROM
		sql_invoicing.clients; -- From the clients table
END$$

-- Reset the delimiter back to semicolon
DELIMITER ;

-- Call the stored procedure to retrieve all clients
CALL sql_invoicing.get_clients();


-- Create a stored procedure called `get_invoices_with_balance`
-- This procedure retrieves invoices with a positive balance from the view
DELIMITER $$

CREATE PROCEDURE sql_invoicing.get_invoices_with_balance()
BEGIN
	SELECT
		*                             -- Select all columns from the view
	FROM
		sql_invoicing.invoices_with_balance -- Use the view that filters invoices with balance > 0
	WHERE
		balance > 0;                  -- Additional safeguard (although view already filters this)
END$$

-- Reset the delimiter back to semicolon
DELIMITER ;

-- Call the stored procedure to retrieve invoices with a balance
CALL sql_invoicing.get_invoices_with_balance();
