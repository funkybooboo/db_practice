USE sql_store;


-- SELECT
-- 	*
-- FROM
-- 	customers
-- ORDER BY
-- 	first_name;
-- 	-- first_name ASC; -- same as above

-- SELECT
-- 	*
-- FROM
-- 	customers
-- ORDER BY
-- 	first_name DESC;

-- SELECT
-- 	*
-- FROM
-- 	customers
-- ORDER BY
-- 	state DESC, first_name ASC;

-- SELECT
-- 	first_name,
-- 	last_name,
-- 	10 AS points
-- FROM
-- 	customers
-- ORDER BY
-- 	birth_date ASC,
-- 	points DESC,
-- 	first_name ASC;


SELECT
	*,
	quantity * unit_price AS total_price
FROM
	order_items
WHERE
	order_id = 2
ORDER BY
	total_price;


