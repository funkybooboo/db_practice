-- INNTER JOIN -> JOIN
-- OUTER JOIN -> LEFT OUTER JOIN -> LEFT JOIN
-- RIGHT OUTER JOIN -> RIGHT JOIN

SELECT
	c.customer_id,
	c.first_name,
	o.order_id
FROM
	sql_store.customers c
LEFT JOIN sql_store.orders o ON
	c.customer_id = o.customer_id
ORDER BY
	c.customer_id;


SELECT
	p.product_id,
	p.name,
	oi.quantity
FROM
	sql_store.products p
LEFT JOIN sql_store.order_items oi ON
	p.product_id = oi.product_id;






