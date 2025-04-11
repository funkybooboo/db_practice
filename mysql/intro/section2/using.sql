SELECT 
	o.order_id,
	c.first_name
FROM
	sql_store.orders o
JOIN sql_store.customers c ON
	o.customer_id = c.customer_id;
-- same as above
SELECT 
	o.order_id,
	c.first_name,
	s.name AS shipper
FROM
	sql_store.orders o
JOIN sql_store.customers c
		USING (customer_id)
LEFT JOIN sql_store.shippers s
		USING (shipper_id);

SELECT
	*
FROM
	sql_store.order_items oi
JOIN sql_store.order_items oin ON
	oi.order_id = oin.order_id
	AND oi.product_id = oin.product_id;
-- same as above
SELECT
	*
FROM
	sql_store.order_items oi
JOIN sql_store.order_items oin
		USING (order_id,
	product_id);

SELECT
	p.date,
	c.name AS client,
	p.amount,
	pm.name AS payment_method
FROM
	sql_invoicing.payments p
JOIN sql_invoicing.clients c
		USING (client_id)
JOIN sql_invoicing.payment_methods pm ON
	p.payment_method = pm.payment_method_id;