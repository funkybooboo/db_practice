USE sql_store;

 SELECT 
 	last_name, 
 	first_name, 
 	points, 
 	points / 100 AS discount_amount
 FROM
 	customers

 SELECT DISTINCT 
 	state
 FROM
 	customers;

-- Return all the products
-- 	name
--	unit price
-- 	new price (unit price * 1.1)
 SELECT
 	name,
 	unit_price,
 	unit_price * 1.1 AS new_price
 FROM
 	products;


