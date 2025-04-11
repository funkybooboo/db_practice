-- Get a list of all customers, whether or not they have placed orders
-- If a customer has no orders, order_id and shipper will be NULL
SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	s.name AS shipper
FROM
	sql_store.customers c
LEFT JOIN sql_store.orders o 
	ON c.customer_id = o.customer_id          -- link customers to their orders (if any)
LEFT JOIN sql_store.shippers s 
	ON o.shipper_id = s.shipper_id            -- link orders to their shippers (if any)
ORDER BY
	c.customer_id;

-- Get a list of all orders, whether or not customer, shipper, or status details exist
SELECT
	o.order_id,
	o.order_date,
	c.first_name AS customer,
	s.name AS shipper,
	os.name AS status 
FROM
	sql_store.orders o
LEFT JOIN sql_store.customers c 
	ON c.customer_id = o.customer_id          -- link orders to customers
LEFT JOIN sql_store.shippers s 
	ON o.shipper_id = s.shipper_id            -- link orders to shippers
LEFT JOIN sql_store.order_statuses os 
	ON o.status = os.order_status_id;         -- link orders to their status

