-- Get each order along with the first name of the customer who placed it
-- Using explicit ON clause
SELECT 
	o.order_id,
	c.first_name
FROM
	sql_store.orders o
JOIN sql_store.customers c ON
	o.customer_id = c.customer_id;

-- Same as above, but:
-- - Uses `USING (customer_id)` instead of `ON o.customer_id = c.customer_id`
-- - Also LEFT JOINs to shippers to include shipper name (if any)
SELECT 
	o.order_id,
	c.first_name,
	s.name AS shipper
FROM
	sql_store.orders o
JOIN sql_store.customers c
		USING (customer_id)  -- shorthand for ON o.customer_id = c.customer_id
LEFT JOIN sql_store.shippers s
		USING (shipper_id);  -- shorthand for ON o.shipper_id = s.shipper_id


-- Join order_items with itself using multiple conditions: order_id and product_id
-- Explicit ON syntax
SELECT
	*
FROM
	sql_store.order_items oi
JOIN sql_store.order_items oin ON
	oi.order_id = oin.order_id
	AND oi.product_id = oin.product_id;

-- Same self-join, but using `USING` shorthand for cleaner syntax
SELECT
	*
FROM
	sql_store.order_items oi
JOIN sql_store.order_items oin
		USING (order_id, product_id);


-- Get payments, their associated client name, amount, and payment method
-- Uses `USING` for client_id since it's named the same in both tables
-- Uses ON for payment_method since column names differ
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

