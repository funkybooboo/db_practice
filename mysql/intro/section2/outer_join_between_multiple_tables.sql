SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	s.name AS shipper
FROM
	sql_store.customers c
LEFT JOIN sql_store.orders o ON
	c.customer_id = o.customer_id
LEFT JOIN sql_store.shippers s ON
	o.shipper_id = s.shipper_id 
ORDER BY
	c.customer_id;


SELECT
	o.order_id,
	o.order_date,
	c.first_name AS customer,
	s.name AS shipper,
	os.name AS status 
FROM
	sql_store.orders o
LEFT JOIN sql_store.customers c ON
	c.customer_id = o.customer_id 
LEFT JOIN sql_store.shippers s ON
	o.shipper_id = s.shipper_id
LEFT JOIN sql_store.order_statuses os ON
	o.status = os.order_status_id;

