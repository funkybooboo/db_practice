-- Use the sql_store database for the following queries
USE sql_store;

-- Get all customers born after Jan 1, 1990 AND with more than 1000 points
SELECT
 	*
FROM
 	customers
WHERE
 	birth_date > '1990-01-01'
 	AND points > 1000;

-- Get all customers who were either born after Jan 1, 1990
-- OR have more than 1000 points AND live in the state of Virginia (VA)
SELECT
 	*
FROM
 	customers
WHERE
 	birth_date > '1990-01-01'
 	OR (points > 1000
 		AND state = 'VA');

-- Get all customers who were NOT born after Jan 1, 1990
-- AND do NOT have more than 1000 points
-- This is equivalent to customers born on or before Jan 1, 1990 AND with 1000 or fewer points
SELECT
 	*
FROM
 	customers
WHERE NOT (
 	birth_date > '1990-01-01'
 	OR points > 1000);

-- Same as the previous query but written directly using AND instead of NOT
SELECT
 	*
FROM
 	customers
WHERE 
 	birth_date <= '1990-01-01'
 	AND points <= 1000;

-- Get all items in order #6 from the order_items table
-- Only include items where the total price (quantity × unit price) is greater than 30
SELECT
	*
FROM
	order_items
WHERE 
	order_id = 6
	AND quantity * unit_price > 30;



