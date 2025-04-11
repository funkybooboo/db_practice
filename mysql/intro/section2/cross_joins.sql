-- every record from c will be combined with records from p
SELECT
	c.first_name AS customer,
	p.name AS product
FROM
	sql_store.customers c
CROSS JOIN sql_store.products p
ORDER BY
	c.first_name;
-- same as above
SELECT
	c.first_name AS customer,
	p.name AS product
FROM
	sql_store.customers c,
	sql_store.products p
ORDER BY
	c.first_name;
-- Do a cross join between shippers and products
-- 	using the implicit syntax
--	and then suing the explicit syntax
SELECT
	s.name AS shipper,
	p.name AS product
FROM
	sql_store.shippers s,
	sql_store.products p;

SELECT
	s.name AS shipper,
	p.name AS product
FROM
	sql_store.shippers s
CROSS JOIN sql_store.products p;
