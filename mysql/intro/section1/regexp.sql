USE sql_store;

 SELECT
 	*
 FROM
 	customers
 WHERE
 	last_name REGEXP 'field';
 	-- last_name LIKE '%field%'; -- same as above

 SELECT
 	*
 FROM
 	customers
 WHERE
 	last_name REGEXP 'field$|mac|^rose';

 SELECT
 	*
 FROM
 	customers
 WHERE
 	last_name REGEXP '[gim]e';
 -- ge
 -- ie
 -- me

 SELECT
 	*
 FROM
 	customers
 WHERE
 	last_name REGEXP '[a-h]e';

-- ^ beginning
-- $ end
-- | logical or
-- [abcd]
-- [a-f]


-- Get the customers whose:
-- 	1. first names are ELKA or AMBUR
SELECT
	*
FROM
	customers
WHERE
	first_name IN ('elka', 'ambur');
-- 	2. last names end with EY or ON
SELECT
	*
FROM
	customers
WHERE
	last_name REGEXP 'ey$|on$';
--  3. last names start with MY or contains SE
SELECT
	*
FROM
	customers
WHERE
	last_name REGEXP '^my|se';
-- 	4. last names contain B follow R or U
SELECT
	*
FROM
	customers
WHERE
	last_name REGEXP 'b[ru]';


