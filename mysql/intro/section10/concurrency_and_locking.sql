USE sql_store;

-- Start a transaction block
START TRANSACTION;

-- Increase the loyalty points of customer with ID 1 by 10
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;

-- Commit the transaction to make the changes permanent
COMMIT;

-- Note:
-- If two transactions try to update the same row at the same time,
-- MySQL will place a lock on the row being updated.
-- The second transaction will have to wait until the first one finishes (commits or rolls back)
-- before it can proceed. This ensures data consistency.
