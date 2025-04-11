USE sql_store;

SELECT
	*
FROM
	orders
JOIN customers ON
	orders.customer_id = customers.customer_id;

-- same as above
SELECT
	*
FROM
	orders
INNER JOIN customers ON
	orders.customer_id = customers.customer_id;

SELECT
	order_id, customers.customer_id, first_name, last_name 
FROM
	orders
JOIN customers ON
	orders.customer_id = customers.customer_id;

-- same as above
SELECT
	order_id, c.customer_id, first_name, last_name 
FROM
	orders o
JOIN customers c ON
	o.customer_id = c.customer_id;

SELECT
	p.product_id,
	oi.order_id,
	p.name,
	oi.quantity,
	oi.unit_price,
	oi.quantity * oi.unit_price AS total_price
FROM
	order_items oi
INNER JOIN products p ON
	oi.product_id = p.product_id;











