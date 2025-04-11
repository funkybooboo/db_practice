-- Use the sql_store database for the following queries
USE sql_store;

-- Get 3 customers starting from the 7th row (skip 6, then take 3)
-- This is useful for pagination
-- LIMIT <offset>, <count>
-- Page 1: LIMIT 0, 3  → rows 1 to 3
-- Page 2: LIMIT 3, 3  → rows 4 to 6
-- Page 3: LIMIT 6, 3  → rows 7 to 9
SELECT
	*
FROM
	customers
LIMIT 6, 3;

-- Get the top 3 most loyal customers based on the highest number of points
-- Sort the customers in descending order of points, then return only the first 3
SELECT
	*
FROM
	customers
ORDER BY
	points DESC
LIMIT 3;

