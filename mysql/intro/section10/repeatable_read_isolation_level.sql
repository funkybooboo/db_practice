USE sql_store;

-- Set isolation level to SERIALIZABLE
-- This is the strictest isolation level:
-- - Prevents dirty reads
-- - Prevents unrepeatable reads
-- - Prevents phantom reads
-- All transactions behave as if they run one after another, not at the same time
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Transaction A begins
START TRANSACTION;

-- First read: points for customer_id = 1
-- A range lock is placed on this row
-- This prevents any other transaction from reading, inserting, updating, or deleting this row
SELECT
	points
FROM
	customers
WHERE
	customer_id = 1;

-- At the same time, another session runs Transaction B
-- Transaction B:
--   START TRANSACTION;
--   UPDATE customers SET points = 30 WHERE customer_id = 1;
--   COMMIT;
-- This query is blocked until Transaction A finishes

-- Back in Transaction A
-- Reading again will return the same value as before
-- No other transaction was able to change the data
SELECT
	points
FROM
	customers
WHERE
	customer_id = 1;

-- Finish Transaction A
COMMIT;

-- Now Transaction B is allowed to run
