DROP PROCEDURE IF EXISTS sql_invoicing.get_clients_by_state;

DELIMITER $$ 

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
		c.state COLLATE utf8mb4_unicode_ci = p_state COLLATE utf8mb4_unicode_ci;
END$$

DELIMITER ;

-- Run the stored procedure with 'CA' as the argument
CALL sql_invoicing.get_clients_by_state('CA');




-- Write a stored procedure to return invoices for a given client

DROP PROCEDURE IF EXISTS sql_invoicing.get_invoices_by_client;

DELIMITER $$ 

CREATE PROCEDURE sql_invoicing.get_invoices_by_client
(
	p_client_id INT
)
BEGIN
	SELECT
		*
	FROM
		sql_invoicing.invoices i
	WHERE
		p_client_id = i.client_id;
END$$

DELIMITER ;

-- Run the stored procedure with 'CA' as the argument
CALL sql_invoicing.get_invoices_by_client(1);



