-- Join orders and customers using a NATURAL JOIN
-- NATURAL JOIN automatically joins tables on all columns with the same name
-- In this case, it will match on `customer_id` because it's the common column
SELECT
	o.order_id,
	c.first_name
FROM
	sql_store.orders o
NATURAL JOIN sql_store.customers c;

-- Safer Alternative
SELECT
	o.order_id,
	c.first_name
FROM
	sql_store.orders o
JOIN sql_store.customers c 
	ON o.customer_id = c.customer_id;

