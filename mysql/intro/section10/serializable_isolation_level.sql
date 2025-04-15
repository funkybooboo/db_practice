USE sql_store;

-- Set isolation level to REPEATABLE READ
-- This prevents:
--   - Dirty reads (can't see uncommitted changes)
--   - Unrepeatable reads (data read once will remain the same throughout the transaction)
-- BUT it does NOT prevent phantom reads (new rows added to a range can appear later)
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Transaction A begins
START TRANSACTION;

-- First read: points for customer_id = 1 (e.g., returns 10)
-- REPEATABLE READ takes a shared lock on this row
-- This prevents other transactions from modifying it until A commits
SELECT
	points
FROM
	customers
WHERE
	customer_id = 1;

-- In another session, Transaction B tries to update the same row
-- It must now wait for Transaction A to finish (either commit or rollback)

-- Transaction B (simulated in another session)
-- START TRANSACTION;
-- UPDATE customers SET points = 30 WHERE customer_id = 1;
-- COMMIT;
-- This query is **blocked** until Transaction A finishes

-- Back in Transaction A, we read again
-- It returns the same value (e.g., 10), ensuring no unrepeatable read
-- Even though B tried to update, it couldn't until A committed
SELECT
	points
FROM
	customers
WHERE
	customer_id = 1;

-- Now A commits, releasing the lock
COMMIT;

-- Now Transaction B (from earlier) will proceed
