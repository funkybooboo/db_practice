SELECT
	*
FROM
	sql_store.orders o 
JOIN sql_store.customers c 
	ON o.customer_id = c.customer_id;

-- same as above
-- Implpicit Join Syntax
SELECT
	*
FROM
	sql_store.orders o,
	sql_store.customers c
WHERE
	o.customer_id = c.customer_id;


