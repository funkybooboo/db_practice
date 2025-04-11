USE sql_store;

 SELECT
 	*
 FROM
 	customers
 WHERE
 	state = 'VA'
 	OR state = 'GA'
 	OR state = 'FL';

 SELECT
 	*
 FROM
 	customers
 WHERE
 	state IN ('VA', 'FL', 'GA');

 SELECT
 	*
 FROM
 	customers
 WHERE
 	state NOT IN ('VA', 'FL', 'GA');

-- Return products with quantity in stock equal to 49, 38, 72
SELECT
	*
FROM 
	products
WHERE 
	quantity_in_stock IN (49, 38, 72);







