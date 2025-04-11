-- Perform a CROSS JOIN between customers and products
-- This returns every possible combination of a customer with a product
-- Explicit CROSS JOIN syntax
SELECT
	c.first_name AS customer,
	p.name AS product
FROM
	sql_store.customers c
CROSS JOIN sql_store.products p
ORDER BY
	c.first_name;

-- Same as above using implicit CROSS JOIN syntax (comma-separated tables)
SELECT
	c.first_name AS customer,
	p.name AS product
FROM
	sql_store.customers c,
	sql_store.products p
ORDER BY
	c.first_name;

-- CROSS JOIN between shippers and products using implicit syntax
-- Every shipper will be paired with every product
SELECT
	s.name AS shipper,
	p.name AS product
FROM
	sql_store.shippers s,
	sql_store.products p;

-- Same CROSS JOIN between shippers and products using explicit syntax
SELECT
	s.name AS shipper,
	p.name AS product
FROM
	sql_store.shippers s
CROSS JOIN sql_store.products p;

