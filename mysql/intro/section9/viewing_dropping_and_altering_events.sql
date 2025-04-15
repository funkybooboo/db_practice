-- Show all events that start with 'yearly'
SHOW EVENTS LIKE 'yearly%';

-- Drop the event if it already exists to avoid duplication errors
DROP EVENT IF EXISTS sql_invoicing.yearly_delete_stable_audit_rows;

DELIMITER $$

-- Modify the existing event to run on a yearly schedule
ALTER EVENT sql_invoicing.yearly_delete_stale_audit_rows
ON SCHEDULE 
	-- Alternative scheduling options (examples):
	-- AT '2019-05-01'        -- run once at a specific date
	-- EVERY 1 HOUR           -- run every hour
	-- EVERY 2 DAY            -- run every 2 days

	-- This event runs once every year, starting Jan 1, 2019, until Jan 1, 2029
	EVERY 1 YEAR 
	STARTS '2019-01-01' 
	ENDS '2029-01-01'

-- Define the logic to run when the event is triggered
DO BEGIN 
	-- Delete rows from the payments_audit table that are older than 1 year
	DELETE FROM sql_invoicing.payments_audit 
	WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$

DELIMITER ;

-- Disable the event (can be toggled on/off without deleting it)
ALTER EVENT sql_invoicing.yearly_delete_stale_audit_rows DISABLE;

-- Enable the event again
ALTER EVENT sql_invoicing.yearly_delete_stale_audit_rows ENABLE;
