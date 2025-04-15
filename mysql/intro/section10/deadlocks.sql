-- DEADLOCK EXAMPLE
-- =======================================
-- This script simulates a deadlock between two transactions.
-- Two different sessions (connections) are required to see it in action.
-- You must run SESSION 1 and SESSION 2 in separate connections.

-- =======================================
-- SETUP (only run once to create test data)
-- =======================================

-- Create and populate a test table
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    points INT
);

INSERT INTO customers (customer_id, name, points) VALUES
(1, 'Alice', 10),
(2, 'Bob', 20);

-- =======================================
-- SESSION 1 - TRANSACTION A
-- =======================================

-- Step 1: Begin transaction
START TRANSACTION;

-- Step 2: Lock customer_id = 1
-- This row is now locked until the transaction ends
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;

-- Step 3: Wait for a few seconds before proceeding
-- Use a manual pause or SLEEP in your SQL client if supported
-- Now try to lock customer_id = 2 (which may be locked by SESSION 2)
UPDATE customers
SET points = points + 10
WHERE customer_id = 2;

-- Step 4: Commit transaction (will fail if deadlock occurs)
COMMIT;

-- =======================================
-- SESSION 2 - TRANSACTION B (run this shortly after SESSION 1)
-- =======================================

-- Step 1: Begin transaction
START TRANSACTION;

-- Step 2: Lock customer_id = 2
UPDATE customers
SET points = points + 5
WHERE customer_id = 2;

-- Step 3: Wait for a few seconds
-- Now try to lock customer_id = 1 (which is already locked by SESSION 1)
UPDATE customers
SET points = points + 5
WHERE customer_id = 1;

-- Step 4: Commit transaction
COMMIT;

-- =======================================
-- EXPECTED RESULT
-- =======================================
-- One of the sessions will fail with a deadlock error.
-- The database detects circular waits and rolls back one transaction.
-- This prevents both sessions from waiting forever.

-- =======================================
-- NOTES
-- =======================================
-- A deadlock happens when:
-- - Transaction A locks Row 1 and wants Row 2
-- - Transaction B locks Row 2 and wants Row 1
-- - Neither can proceed, so the DB aborts one to break the cycle

-- TO AVOID DEADLOCKS:
-- - Always access rows in the same order across transactions
-- - Keep transactions short and fast
-- - Use lower isolation levels if appropriate (e.g., READ COMMITTED)
