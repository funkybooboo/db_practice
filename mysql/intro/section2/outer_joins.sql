-- INNER JOIN → JOIN
-- OUTER JOIN → LEFT OUTER JOIN → LEFT JOIN
-- RIGHT OUTER JOIN → RIGHT JOIN

-- Get all customers, along with their orders if they have any
-- Customers without orders will still appear, but order_id will be NULL
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

-- Get all products and the quantity ordered (if any)
-- Products that have never been ordered will still appear, with NULL quantity
SELECT
	p.product_id,
	p.name,
	oi.quantity
FROM
	sql_store.products p
LEFT JOIN sql_store.order_items oi ON
	p.product_id = oi.product_id;

