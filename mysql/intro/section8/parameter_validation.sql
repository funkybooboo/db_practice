DROP PROCEDURE IF EXISTS sql_invoicing.make_payment;

DELIMITER $$ 

CREATE PROCEDURE sql_invoicing.make_payment
(
	p_invoice_id INT,
	p_payment_amount DECIMAL(9, 2),
	p_payment_date DATE
)
BEGIN
	IF p_payment_amount <= 0 THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid payment amount';
	END IF;

	UPDATE sql_invoicing.invoices i 
		SET i.payment_total = p_payment_amount, 
		i.payment_date = p_payment_date
	WHERE 
		i.invoice_id = p_invoice_id;
END$$

DELIMITER ;

CALL sql_invoicing.make_payment(1, 100.0, '2019-01-01');
