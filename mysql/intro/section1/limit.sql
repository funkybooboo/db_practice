USE sql_store;

SELECT
	*
FROM
	customers
LIMIT 6, 3; -- skip 6 take 3
-- page 1: 1 - 3
-- page 2: 4 - 6
-- page 3: 7 - 9


-- Get the top three loyal customers
SELECT
	*
FROM
	customers
ORDER BY
	points DESC
LIMIT 3;
