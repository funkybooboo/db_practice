-- Drop the stored procedure if it already exists
DROP PROCEDURE IF EXISTS sql_invoicing.get_clients_by_state;

-- Change the delimiter to $$ so we can use semicolons inside the procedure
DELIMITER $$ 

-- Create a stored procedure to get clients by their state
CREATE PROCEDURE sql_invoicing.get_clients_by_state
(
	p_state CHAR(2) -- Input parameter: 2-letter state code, e.g., 'VA', 'CA'
)
BEGIN
	-- If the input state is NULL, default to 'CA'
	IF p_state IS NULL THEN
		SET p_state = 'CA';
	END IF;

	-- Select clients where the state matches the input (case/collation sensitive)
	SELECT
		*
	FROM
		sql_invoicing.clients c
	WHERE
		c.state COLLATE utf8mb4_unicode_ci = p_state COLLATE utf8mb4_unicode_ci;
END$$

-- Restore the delimiter
DELIMITER ;

-- Call the procedure with NULL (will default to 'CA')
CALL sql_invoicing.get_clients_by_state(NULL);


-- Alternate version using IFNULL directly in WHERE clause instead of IF block
DROP PROCEDURE IF EXISTS sql_invoicing.get_clients_by_state;

DELIMITER $$ 

CREATE PROCEDURE sql_invoicing.get_clients_by_state
(
	p_state CHAR(2) -- Input parameter: 2-letter state code
)
BEGIN
	-- Select all clients where the state matches the provided one,
	-- or all clients if p_state is NULL (i.e., match everything)
	SELECT
		*
	FROM
		sql_invoicing.clients c
	WHERE
		c.state COLLATE utf8mb4_unicode_ci = IFNULL(p_state COLLATE utf8mb4_unicode_ci, c.state COLLATE utf8mb4_unicode_ci);
END$$

DELIMITER ;

-- Call the procedure with NULL (will match all states)
CALL sql_invoicing.get_clients_by_state(NULL);


-- Create a stored procedure to get payments filtered by client and payment method
-- Both parameters are optional (can be NULL)
DROP PROCEDURE IF EXISTS sql_invoicing.get_payments;

DELIMITER $$ 

CREATE PROCEDURE sql_invoicing.get_payments
(
	p_client_id INT,            -- Input parameter: client ID
	p_payment_method_id TINYINT -- Input parameter: payment method ID
)
BEGIN
	-- Select all payments where:
	-- - client_id matches if provided (else match all)
	-- - payment_method matches if provided (else match all)
	SELECT
		*
	FROM
		sql_invoicing.payments p
	WHERE
		p.client_id = IFNULL(p_client_id, p.client_id) AND 
		p.payment_method = IFNULL(p_payment_method_id, p.payment_method);
END$$

DELIMITER ;

-- Test calls with different combinations of filters
CALL sql_invoicing.get_payments(NULL, NULL); -- All payments
CALL sql_invoicing.get_payments(1, NULL);    -- Payments by client 1
CALL sql_invoicing.get_payments(NULL, 1);    -- Payments using payment method 1
CALL sql_invoicing.get_payments(1, 1);       -- Payments by client 1 using method 1
