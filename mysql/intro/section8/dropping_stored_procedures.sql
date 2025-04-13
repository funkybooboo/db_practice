-- Drop the stored procedure if it already exists
-- This prevents errors when recreating the procedure
DROP PROCEDURE IF EXISTS sql_invoicing.get_clients;

-- Change the delimiter to $$ to define the stored procedure body cleanly
DELIMITER $$ 

-- Create a new stored procedure called `get_clients` in the `sql_invoicing` schema
-- This procedure retrieves all rows from the `clients` table
CREATE PROCEDURE sql_invoicing.get_clients()
BEGIN
	SELECT
		*                       -- Select all columns
	FROM
		sql_invoicing.clients; -- From the clients table
END$$

-- Restore the default statement delimiter (;)
DELIMITER ;
