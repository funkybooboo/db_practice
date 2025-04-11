-- Use the sql_store database for the following queries
USE sql_store;

-- Get all customers whose state is either VA, GA, or FL using multiple OR conditions
SELECT
 	*
FROM
 	customers
WHERE
 	state = 'VA'
 	OR state = 'GA'
 	OR state = 'FL';

-- Same as above, but using the more concise IN operator
SELECT
 	*
FROM
 	customers
WHERE
 	state IN ('VA', 'FL', 'GA');

-- Get all customers whose state is NOT VA, FL, or GA
SELECT
 	*
FROM
 	customers
WHERE
 	state NOT IN ('VA', 'FL', 'GA');

-- Get all products that have exactly 49, 38, or 72 units in stock
SELECT
	*
FROM 
	products
WHERE 
	quantity_in_stock IN (49, 38, 72);






