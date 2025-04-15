USE sql_store;

-- Set isolation level to READ COMMITTED
-- This prevents dirty reads (can't see uncommitted changes)
-- But allows non-repeatable reads (data may change between reads)
-- This is the default in many databases (like SQL Server and Oracle)
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Transaction A starts
START TRANSACTION;

-- Transaction A reads the customer's points
-- At this point, it sees the committed value (say, 10)
SELECT
	points
FROM
	customers
WHERE
	customer_id = 1;

-- Meanwhile, Transaction B runs separately and commits a change
-- (this is a simulation, not part of this script)
-- Transaction B:
--   START TRANSACTION;
--   UPDATE customers SET points = 30 WHERE customer_id = 1;
--   COMMIT;

-- Now Transaction A reads again
-- Since READ COMMITTED allows seeing new committed data between statements,
-- it will see the updated value (30 instead of 10)
-- This is called an "unrepeatable read" — same query, different result within the same transaction
SELECT
	points
FROM
	customers
WHERE
	customer_id = 1;

-- Commit Transaction A
COMMIT;

-- =============================
-- Notes on READ COMMITTED:
-- - Prevents dirty reads (no uncommitted data is read)
-- - Allows unrepeatable reads (data can change between two reads)
-- - Moderate balance between consistency and performance
-- - Good for:
--     * Most OLTP systems where dirty reads must be avoided
--     * When occasional re-reads with changed values are acceptable
-- - Not suitable when:
--     * You expect multiple reads to return the same result in a transaction (e.g., financial reports)
