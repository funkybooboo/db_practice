USE sql_store;

-- Create a composite index on (state, points).
-- Composite indexes help when filtering by multiple columns together.
-- IMPORTANT: MySQL does NOT support "IF NOT EXISTS" for CREATE INDEX.
-- You have to check manually first if the index exists.
CREATE INDEX idx_state_points ON customers (state, points);

-- Show all indexes on the 'customers' table.
SHOW INDEXES IN customers;

-- Explain how MySQL would run this query:
-- Now it can use the composite index (state, points) efficiently.
-- Filtering by 'state' and 'points' together is much faster with the composite index.
EXPLAIN
SELECT
	customer_id
FROM
	customers
WHERE
	state = 'CA' AND points > 1000;

-- Drop old individual indexes if they exist.
-- MySQL also does NOT support "IF EXISTS" for DROP INDEX,
-- you must manually check if the index exists before trying to drop it.
DROP INDEX idx_state ON customers;
DROP INDEX idx_points ON customers;
