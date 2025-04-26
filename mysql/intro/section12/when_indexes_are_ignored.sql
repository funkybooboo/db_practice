USE sql_store;

-- ─── BAD WAY ─────────────────────────────────────────────────────────────
-- This query uses OR between two different columns (state OR points).
-- MySQL usually cannot efficiently use indexes when OR is involved between different columns.
-- It may have to scan a lot more rows.
EXPLAIN
SELECT
	customer_id
FROM
	customers
WHERE
	state = 'CA'
	OR points > 1000;

-- ─── GOOD WAY ─────────────────────────────────────────────────────────────
-- Solution: break it into two separate SELECTs and combine them with UNION.
-- Each SELECT can independently use its appropriate index.

-- Create an index on points (if not already created).
-- NOTE: MySQL does NOT support "IF NOT EXISTS" for CREATE INDEX.
-- You have to manually check if it exists before creating it.
CREATE INDEX idx_points ON customers (points);

-- Better query structure:
-- Now MySQL can use the best index for each subquery separately.
EXPLAIN
SELECT
	customer_id
FROM
	customers
WHERE
	state = 'CA'
UNION
SELECT
	customer_id
FROM
	customers
WHERE
	points > 1000;

-- ─────────────────────────────────────────────────────────────
--   EXTRA TIP:
--   UNION automatically removes duplicates.
--   If you are sure there are no duplicates and want it faster,
--   you can use UNION ALL (no deduplication).

-- ─── BAD WAY ─────────────────────────────────────────────────────────────
-- MySQL cannot use an index if you apply an expression (like points + 10) to the column.
-- It must calculate the expression for every row instead of using the index.
EXPLAIN
SELECT
	customer_id
FROM
	customers
WHERE
	points + 10 > 2010;

-- ─── GOOD WAY ─────────────────────────────────────────────────────────────
-- Always write the condition directly on the column to allow the index to be used.
-- (Move math to the constant side of the comparison.)
EXPLAIN
SELECT
	customer_id
FROM
	customers
WHERE
	points > 2000;
