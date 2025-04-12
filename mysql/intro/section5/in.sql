-- Find the products that have never been ordered
SELECT
	*
FROM
	sql_store.products
WHERE
	-- Exclude products that appear in the order_items table
	product_id NOT IN (
		SELECT
			DISTINCT product_id
		FROM
			sql_store.order_items
	);

-- Find clients who have never received an invoice
SELECT
	*
FROM
	sql_invoicing.clients
WHERE
	-- Exclude clients that appear in the invoices table
	client_id NOT IN (
		SELECT
			DISTINCT client_id
		FROM
			sql_invoicing.invoices
	);
