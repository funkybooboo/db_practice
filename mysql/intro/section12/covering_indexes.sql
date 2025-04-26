USE sql_store;

-- Show all indexes on the 'customers' table
SHOW INDEXES IN customers;

-- Explain how MySQL will execute the query
-- We are selecting customer_id and state
-- If both columns are in the index, MySQL can do a "covering index" scan (faster, no table lookup)
EXPLAIN
SELECT
	customer_id, state
FROM
	customers
ORDER BY
	state;

-- Show the cost of the last executed query
-- Lower cost means better performance
SHOW STATUS LIKE 'last_query_cost';
