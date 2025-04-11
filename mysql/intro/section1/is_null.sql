USE sql_store;

 SELECT
 	*
 FROM
 	customers
 WHERE
 	phone IS NULL;
 
 SELECT
 	*
 FROM
 	customers
 WHERE
 	phone IS NOT NULL;


-- Get the orders that have not shipped yet
SELECT
	*
FROM
	orders
WHERE 
	shipped_date IS NULL;

