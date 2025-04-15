-- Show all triggers where the table name starts with 'payments'
-- Useful for checking if expected triggers are already created
SHOW TRIGGERS LIKE 'payments%';


-- Naming convention for triggers:
-- <table_name>_<before|after>_<insert|update|delete>

-- Example: payments_after_insert
--   payments  -> table name
--   after     -> trigger runs after the action
--   insert    -> trigger fires on INSERT operations

-- This format makes it easy to understand:
--   - Which table the trigger is on
--   - When it runs (before or after the change)
--   - What type of action activates it (insert, update, or delete)
