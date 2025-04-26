-- Use the sql_store database
USE sql_store;

-- EXPLAIN shows how MySQL plans to execute the query
-- This query finds customers from the state of 'CA'
-- Before adding an index, MySQL had to scan all 1010 rows (full table scan)
EXPLAIN
SELECT
    customer_id
FROM
    customers
WHERE
    state = 'CA';

-- Create an index on the "state" column
-- This will allow MySQL to find rows matching a specific state much faster
-- After the index is created, MySQL only needs to scan around 112 rows
CREATE INDEX IF NOT EXISTS idx_state ON customers (state);

-- Now let's check another query:
-- Find customers who have more than 1000 points
-- EXPLAIN shows how MySQL plans to find these rows
-- Before creating an index, MySQL again has to scan all 1010 rows
EXPLAIN
SELECT
    customer_id
FROM
    customers
WHERE
    points > 1000;

-- Create an index on the "points" column
-- This index speeds up queries that filter based on customer points
-- After adding the index, MySQL only needs to scan about 529 rows
CREATE INDEX IF NOT EXISTS idx_points ON customers (points);
