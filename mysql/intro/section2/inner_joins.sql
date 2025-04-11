-- Use the sql_store database
USE sql_store;

-- Get all orders and their corresponding customer data
-- Using direct table names (no aliases)
SELECT
	*
FROM
	orders
JOIN customers ON
	orders.customer_id = customers.customer_id;

-- Same as above, explicitly specifying INNER JOIN (same default behavior)
SELECT
	*
FROM
	orders
INNER JOIN customers ON
	orders.customer_id = customers.customer_id;

-- Select only specific fields from orders and customers
-- (without aliases, but fully qualified column names)
SELECT
	order_id, customers.customer_id, first_name, last_name 
FROM
	orders
JOIN customers ON
	orders.customer_id = customers.customer_id;

-- Same query, but using table aliases for cleaner and shorter syntax
SELECT
	order_id, c.customer_id, first_name, last_name 
FROM
	orders o
JOIN customers c ON
	o.customer_id = c.customer_id;

-- Join order_items with products to get detailed product information for each order item
-- Also calculates total price for each line item (quantity × unit_price)
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

