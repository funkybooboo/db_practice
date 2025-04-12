-- IF(expression, first, second)
-- true return first
-- false return second

SELECT
	order_id,
	order_date,
	IF(YEAR(order_date) = YEAR(NOW()), 'Active', 'Arcive') AS status
	
FROM
	sql_store.orders;
	

SELECT
	product_id,
	name,
	COUNT(*) AS orders,
	IF(COUNT(*) > 1, 'Many times', 'Once') AS frequency
FROM
	sql_store.products
JOIN sql_store.order_items
		USING (product_id)
GROUP BY
	product_id,
	name;
