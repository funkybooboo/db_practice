-- Get all order items from the sql_store.order_items table
-- and join them with matching products from the sql_inventory.products table
-- using product_id as the joining key
SELECT
	*
FROM
	sql_store.order_items oi
JOIN sql_inventory.products p ON
	oi.product_id = p.product_id;

