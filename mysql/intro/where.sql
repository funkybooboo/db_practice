USE sql_store;


-- Get all customers that have more then 3000 points
-- SELECT
-- 	*
-- FROM
-- 	customers
-- WHERE
-- 	points > 3000;

-- Get all customers who are in vergina
-- SELECT
-- 	*
-- FROM
-- 	customers
-- WHERE
-- 	state = 'va';

-- Get all customers who are not in vergina
-- SELECT
-- 	*
-- FROM
-- 	customers
-- WHERE
-- 	state != 'va';
-- 	-- state <> 'va'; -- same thing as above

-- SELECT *
-- FROM customers 
-- WHERE birth_date > '1990-01-01';


-- Get the orders placed after 2018
SELECT
	*
FROM
	orders
WHERE
	order_date > '2018-01-01';







