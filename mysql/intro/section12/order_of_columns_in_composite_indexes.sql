USE sql_store;

-- EXPLAIN shows the query execution plan.
-- We are manually telling MySQL to use the idx_state_lastname index.
EXPLAIN
SELECT
	customer_id
FROM
	customers
USE INDEX (idx_state_lastname)
WHERE
	state = 'CA'
	AND last_name LIKE 'A%';

-- Check how unique the 'state' and 'last_name' columns are.
-- Helps decide which column should come first in a composite index.
SELECT
	COUNT(DISTINCT state),    -- low cardinality (few unique states like 'CA', 'NY', etc.)
	COUNT(DISTINCT last_name) -- high cardinality (many unique last names)
FROM
	customers;

-- Create a composite index on (last_name, state).
-- Remember: "IF NOT EXISTS" is not supported by MySQL for CREATE INDEX.
-- You must manually check before creating.
CREATE INDEX idx_lastname_state ON customers (last_name, state);

-- Create a composite index on (state, last_name).
CREATE INDEX idx_state_lastname ON customers (state, last_name);

-- ─────────────────────────────────────────────────────────────
-- Notes:
-- - The order of columns in a composite index is very important.
-- - General rules when deciding index order:
--   1. Put the **more frequently filtered** column first (if possible).
--   2. Put the **higher cardinality** (more unique values) column first, to better filter rows early.
--   3. Always **analyze the real-world queries** you will run most often and optimize indexes for them.
-- - In this case:
--   - `state` has low cardinality (few unique states).
--   - `last_name` has high cardinality (many unique last names).
--   - If we usually search by **state first**, then last_name filtering (like 'A%'), it makes sense to use (state, last_name).
--   - If we were searching **mostly by last_name**, we would prefer (last_name, state).
