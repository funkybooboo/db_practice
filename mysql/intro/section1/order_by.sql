-- Use the sql_store database for the following queries
USE sql_store;

-- Get all customers sorted alphabetically by first name (ascending order by default)
SELECT
 	*
FROM
 	customers
ORDER BY
 	first_name;
 	-- first_name ASC; -- ASC (ascending) is the default, so this is equivalent

-- Get all customers sorted by first name in descending (Z → A) order
SELECT
 	*
FROM
 	customers
ORDER BY
 	first_name DESC;

-- Get all customers sorted first by state (descending), 
-- and then by first name (ascending) within each state
SELECT
 	*
FROM
 	customers
ORDER BY
 	state DESC, first_name ASC;

-- Select only first name, last name, and a constant value 10 as "points" for every customer
-- Then order the results by birth_date (earliest to latest),
-- then by points (which is the same for everyone, so has no effect here),
-- and finally by first name (alphabetically)
SELECT
 	first_name,
 	last_name,
 	10 AS points
FROM
 	customers
ORDER BY
 	birth_date ASC,
 	points DESC,
 	first_name ASC;

-- Get all items from order ID 2
-- Also calculate total_price for each item (quantity × unit_price)
-- Sort the items by total_price (ascending)
SELECT
	*,
	quantity * unit_price AS total_price
FROM
	order_items
WHERE
	order_id = 2
ORDER BY
	total_price;

