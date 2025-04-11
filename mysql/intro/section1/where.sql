-- Use the sql_store database
USE sql_store;

-- Get all customers who have more than 3000 points
SELECT
	*
FROM
	customers
WHERE
	points > 3000;

-- Get all customers who are in Virginia (state = 'VA')
-- Note: SQL is case-insensitive by default, so 'va' will work too
SELECT
	*
FROM
	customers
WHERE
	state = 'va';

-- Get all customers who are NOT in Virginia
-- You can use either != or <> for "not equal"
SELECT
	*
FROM
	customers
WHERE
	state != 'va';
-- OR
-- state <> 'va';

-- Get all customers born after January 1, 1990
SELECT
	*
FROM
	customers
WHERE
	birth_date > '1990-01-01';

-- Get all orders that were placed after January 1, 2018
SELECT
	*
FROM
	orders
WHERE
	order_date > '2018-01-01';

