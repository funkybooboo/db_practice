-- join based on common columns
SELECT
	o.order_id,
	c.first_name
FROM
	sql_store.orders o
NATURAL JOIN sql_store.customers c;
