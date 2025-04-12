-- Select clients that have an invoice
SELECT
	*
FROM
	sql_invoicing.clients
WHERE
	client_id IN (
		SELECT
			DISTINCT client_id
		FROM
			sql_invoicing.invoices
	);

-- same as above
SELECT DISTINCT
	c.*
FROM
	sql_invoicing.clients c
JOIN sql_invoicing.invoices i
	ON c.client_id = i.client_id;

-- same as above
SELECT
	*
FROM
	sql_invoicing.clients c
WHERE
	EXISTS (
		SELECT
			i.client_id
		FROM
			sql_invoicing.invoices i
		WHERE
			i.client_id = c.client_id 
	);


-- Find the products that have never been ordered
SELECT
	*
FROM
	sql_store.products
WHERE
	product_id NOT IN (
		SELECT
			product_id
		FROM
			sql_store.order_items
	);

SELECT
	*
FROM
	sql_store.products p
WHERE
	product_id NOT EXISTS (
		SELECT
			product_id
		FROM
			sql_store.order_items oi
		WHERE p.product_id  = oi.product_id
	);


