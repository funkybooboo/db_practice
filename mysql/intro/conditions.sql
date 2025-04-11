USE sql_store;

-- SELECT
-- 	*
-- FROM
-- 	customers
-- WHERE
-- 	birth_date > '1990-01-01'
-- 	AND points > 1000;

-- SELECT
-- 	*
-- FROM
-- 	customers
-- WHERE
-- 	birth_date > '1990-01-01'
-- 	OR (points > 1000
-- 		AND state = 'VA');

-- SELECT
-- 	*
-- FROM
-- 	customers
-- WHERE NOT (
-- 	birth_date > '1990-01-01'
-- 	OR points > 1000);

-- SELECT
-- 	*
-- FROM
-- 	customers
-- WHERE 
-- 	birth_date <= '1990-01-01'
-- 	AND points <= 1000;

-- From the order_items table, get the items
--	for order number 6
--	where the total price is greater than 30
SELECT
	*
FROM
	order_items
WHERE 
	order_id = 6
	AND quantity * unit_price > 30;





