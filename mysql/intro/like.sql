USE sql_store;

-- SELECT
-- 	*
-- FROM
-- 	customers
-- WHERE
-- 	last_name LIKE 'b%'; -- % any number of characters

-- SELECT
-- 	*
-- FROM
-- 	customers
-- WHERE
-- 	last_name LIKE '_____y'; -- _ one character

-- Get the customers whose addresses contain TRAIL or AVENUE 
SELECT
	*
FROM
	customers
WHERE
	address LIKE '%trail%'
	OR address LIKE '%avenue%';

-- Get the customers whose phone numebers end with 9
SELECT
	*
FROM
	customers
WHERE
	phone LIKE '%9';

-- Get the customers whose phone numebers dont end with 9
SELECT
	*
FROM
	customers
WHERE
	phone NOT LIKE '%9';



