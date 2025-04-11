-- Use the sql_store database for the following queries
USE sql_store;

-- Get all customers who do NOT have a phone number (i.e., phone is NULL)
SELECT
 	*
FROM
 	customers
WHERE
 	phone IS NULL;

-- Get all customers who DO have a phone number (i.e., phone is NOT NULL)
SELECT
 	*
FROM
 	customers
WHERE
 	phone IS NOT NULL;

-- Get all orders that have NOT been shipped yet
-- This means the shipped_date is still NULL (not set)
SELECT
	*
FROM
	orders
WHERE 
	shipped_date IS NULL;

