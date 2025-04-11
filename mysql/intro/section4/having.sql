USE sql_invoicing;

SELECT 
    client_id,
    SUM(invoice_total) AS total_sales,
    COUNT(*) AS number_of_invoices
FROM
    invoices
JOIN clients USING (client_id)
GROUP BY
    client_id
HAVING total_sales > 500 AND number_of_invoices > 5;


USE sql_store;
-- Get the customers
-- 	located in Virgina
--	who have spent more than $100
SELECT 
	c.customer_id,
	c.first_name,
	c.last_name,
	SUM(oi.quantity * oi.unit_price) AS total_sales
FROM
	customers c
JOIN orders o
		USING (customer_id)
JOIN order_items oi
		USING (order_id)
WHERE
	state = 'VA'
GROUP BY 
	c.customer_id,
	c.first_name,
	c.last_name
HAVING total_sales > 100
