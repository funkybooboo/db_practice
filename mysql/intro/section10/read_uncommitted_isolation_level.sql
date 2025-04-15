USE sql_store;

-- Set the isolation level for this session to READ UNCOMMITTED
-- This allows dirty reads: reading data that has been modified but not yet committed
-- It's the fastest isolation level, but also the least safe
-- Use when absolute performance is needed and occasional inconsistent reads are acceptable
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- Transaction A starts
-- This transaction updates a customer's points but hasn't committed yet
START TRANSACTION;

UPDATE
	customers
SET points = 20
WHERE
	customer_id = 1;

-- COMMIT is delayed to simulate a long transaction
-- Meanwhile, another transaction (B) can run

-- Transaction B (simultaneously)
-- Because of READ UNCOMMITTED, this query can read the uncommitted value from Transaction A
-- This is called a "dirty read" — data that may later be rolled back
SELECT
	points
FROM
	customers
WHERE
	customer_id = 1;

-- Transaction A commits
COMMIT;

-- =============================
-- Notes on READ UNCOMMITTED:
-- - Allows dirty reads (reading uncommitted changes)
-- - No locks are placed on the data
-- - Highest concurrency, lowest consistency
-- - Good for:
--     * Logging or auditing processes
--     * Large report generation on non-critical, frequently updated data
--     * When eventual consistency is acceptable
-- - Not safe when:
--     * You rely on accurate, finalized data
--     * You're updating based on reads (e.g., read-modify-write patterns)
