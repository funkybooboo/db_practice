-- Get all order items and their corresponding notes by joining two tables:
-- - order_items (aliased as oi)
-- - order_item_notes (aliased as oin)
-- The join is done using both order_id and product_id to ensure exact matches
SELECT
	*
FROM
	sql_store.order_items oi
JOIN sql_store.order_item_notes oin 
	ON oi.order_id = oin.order_id
	AND oi.product_id = oin.product_id;

