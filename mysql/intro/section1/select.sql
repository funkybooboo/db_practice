-- Use the sql_store database
USE sql_store;

-- Get each customer's last name, first name, points,
-- and a calculated discount amount which is points divided by 100
SELECT 
 	last_name, 
 	first_name, 
 	points, 
 	points / 100 AS discount_amount
FROM
 	customers;

-- Get a list of all distinct (unique) states where customers are located
-- Removes duplicates from the state column
SELECT DISTINCT 
 	state
FROM
 	customers;

-- Return all products with the following:
-- - name of the product
-- - original unit price
-- - new price (calculated as unit price * 1.1 to apply a 10% increase)
SELECT
 	name,
 	unit_price,
 	unit_price * 1.1 AS new_price
FROM
 	products;

