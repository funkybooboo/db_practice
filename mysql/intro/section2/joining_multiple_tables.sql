SELECT
	o.order_id,
	o.order_date,
	c.first_name,
	c.last_name,
	os.name AS status
FROM
	sql_store.orders o
JOIN sql_store.customers c ON
	o.customer_id = c.customer_id
JOIN sql_store.order_statuses os ON
	os.order_status_id = o.status;

SELECT
	p.date,
	i.number AS invoid_number,
	p.amount,
	c.name,
	pm.name AS payment_method
FROM
	sql_invoicing.payments p
JOIN sql_invoicing.payment_methods pm ON
	p.payment_method = pm.payment_method_id
JOIN sql_invoicing.clients c ON
	p.client_id = c.client_id
JOIN sql_invoicing.invoices i ON
	p.invoice_id = i.invoice_id;
	










