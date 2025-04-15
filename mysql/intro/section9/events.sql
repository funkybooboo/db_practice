SHOW VARIABLES LIKE 'event%';

SET GLOBAL event_scheduler = ON;
-- SET GLOBAL event_scheduler = OFF;

DELIMITER $$

CREATE EVENT sql_invoicing.yearly_delete_stale_audit_rows
ON SCHEDULE 
	-- AT '2019-05-01' -- once at a date
	-- EVERY 1 HOUR
	-- EVERY 2 DAY
	EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01'
DO BEGIN 
	DELETE FROM sql_invoicing.payments_audit 
	WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$


DELIMITER ;
