-- Drop the trigger if it already exists to avoid errors on re-creation
DROP TRIGGER IF EXISTS sql_invoicing.payments_after_insert;

DELIMITER $$

-- Trigger: After inserting a new payment, update the corresponding invoice's payment total
CREATE TRIGGER sql_invoicing.payments_after_insert
	AFTER INSERT ON sql_invoicing.payments
	FOR EACH ROW
BEGIN
	-- Add the new payment amount to the related invoice's payment_total
	UPDATE sql_invoicing.invoices
	SET payment_total = payment_total + NEW.amount
	WHERE invoice_id = NEW.invoice_id;

	INSERT INTO sql_invoicing.payments_audit
	VALUES (NEW.client_id, NEW.date, NEW.amount, 'Insert', NOW());
END $$

DELIMITER ;

-- Test insert to trigger the logic
INSERT INTO sql_invoicing.payments
VALUES (DEFAULT, 5, 3, '2019-01-01', 10, 1);


-- Drop the trigger if it already exists to avoid errors on re-creation
DROP TRIGGER IF EXISTS sql_invoicing.payments_after_delete;

DELIMITER $$

-- Trigger: After deleting a payment, subtract its amount from the related invoice's payment total
CREATE TRIGGER sql_invoicing.payments_after_delete
	AFTER DELETE ON sql_invoicing.payments
	FOR EACH ROW
BEGIN
	-- Subtract the deleted payment's amount from the invoice's payment_total
	UPDATE sql_invoicing.invoices
	SET payment_total = payment_total - OLD.amount
	WHERE invoice_id = OLD.invoice_id;

	INSERT INTO sql_invoicing.payments_audit
	VALUES (OLD.client_id, OLD.date, OLD.amount, 'Delete', NOW());
END $$

DELIMITER ;

-- Test delete to trigger the logic
DELETE
FROM
	sql_invoicing.payments
WHERE
	payment_id = 11;
