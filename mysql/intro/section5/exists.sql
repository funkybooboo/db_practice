-- Select clients that have at least one invoice (using subquery and DISTINCT)
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

-- Same as above, but using an INNER JOIN to find matching client_ids in both tables
SELECT DISTINCT
	c.*
FROM
	sql_invoicing.clients c
JOIN sql_invoicing.invoices i
	ON c.client_id = i.client_id;

-- Same logic again, but using EXISTS to check for the presence of at least one invoice for each client
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


-- Find products that have never been ordered (i.e., not present in the order_items table)
-- This uses NOT IN with a subquery to exclude product_ids that were ordered
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

-- Same logic using NOT EXISTS instead of NOT IN, which is generally safer with NULLs
SELECT
	*
FROM
	sql_store.products p
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			sql_store.order_items oi
		WHERE
			p.product_id = oi.product_id
	);
