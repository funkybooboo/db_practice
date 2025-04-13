-- Remove the procedure if it already exists to avoid duplication errors
DROP PROCEDURE IF EXISTS sql_invoicing.get_clients_by_state;

-- Define a new statement delimiter to allow semicolons inside the procedure body
DELIMITER $$ 

-- Create a stored procedure to fetch clients by their 2-character state code
CREATE PROCEDURE sql_invoicing.get_clients_by_state
(
	p_state CHAR(2) -- e.g., 'VA', 'CA'
)
BEGIN
	SELECT
		*
	FROM
		sql_invoicing.clients c
	WHERE
		-- Use the same collation on both sides to avoid collation mismatch errors
		c.state COLLATE utf8mb4_unicode_ci = p_state COLLATE utf8mb4_unicode_ci;
END$$

-- Reset the statement delimiter back to default
DELIMITER ;

-- Call the procedure with 'CA' to get clients from California
CALL sql_invoicing.get_clients_by_state('CA');




-- Remove the procedure if it already exists to avoid duplication errors
DROP PROCEDURE IF EXISTS sql_invoicing.get_invoices_by_client;

-- Change the delimiter to allow semicolons within the procedure body
DELIMITER $$ 

-- Create a stored procedure to fetch invoices for a specific client ID
CREATE PROCEDURE sql_invoicing.get_invoices_by_client
(
	p_client_id INT -- ID of the client whose invoices are needed
)
BEGIN
	SELECT
		*
	FROM
		sql_invoicing.invoices i
	WHERE
		-- Filter invoices for the given client ID
		p_client_id = i.client_id;
END$$

-- Reset the statement delimiter back to default
DELIMITER ;

-- Call the procedure with client_id = 1 to get their invoices
CALL sql_invoicing.get_invoices_by_client(1);
