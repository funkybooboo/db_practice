-- Drop the procedure if it already exists to avoid duplication errors during creation
DROP PROCEDURE IF EXISTS sql_invoicing.make_payment;

-- Set custom delimiter to define procedure body (useful because the body contains semicolons)
DELIMITER $$ 

-- Create a stored procedure named 'make_payment' in the 'sql_invoicing' schema
CREATE PROCEDURE sql_invoicing.make_payment
(
	p_invoice_id INT,               -- Input: ID of the invoice to apply the payment to
	p_payment_amount DECIMAL(9, 2), -- Input: Amount of the payment being made
	p_payment_date DATE             -- Input: Date when the payment was made
)
BEGIN
	-- Check if the payment amount is valid (greater than 0)
	-- If not, raise an error with SQLSTATE '22003' (numeric value out of range)
	IF p_payment_amount <= 0 THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid payment amount';
	END IF;

	-- Update the specified invoice with the new payment amount and payment date
	UPDATE sql_invoicing.invoices i 
		SET i.payment_total = p_payment_amount, 
		    i.payment_date = p_payment_date
	WHERE 
		i.invoice_id = p_invoice_id; -- Only update the invoice that matches the given ID
END$$

-- Restore the default SQL statement delimiter
DELIMITER ;

-- Example call to the stored procedure: applies a $100 payment made on '2019-01-01' to invoice ID 1
CALL sql_invoicing.make_payment(1, 100.0, '2019-01-01');
