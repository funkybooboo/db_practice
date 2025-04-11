-- Get all orders along with the matching customer details
-- using the explicit INNER JOIN syntax
SELECT
	*
FROM
	sql_store.orders o 
JOIN sql_store.customers c 
	ON o.customer_id = c.customer_id;

-- Same result as above, but using the implicit JOIN syntax
-- Tables are listed with commas, and join condition is in the WHERE clause
SELECT
	*
FROM
	sql_store.orders o,
	sql_store.customers c
WHERE
	o.customer_id = c.customer_id;

