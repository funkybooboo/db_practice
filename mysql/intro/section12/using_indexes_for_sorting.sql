USE sql_store;

-- Show all indexes on the 'customers' table
SHOW INDEXES IN customers;

-- Explain how MySQL will execute the query
-- We are selecting customer_id and ordering by 'state'
-- If no index on 'state', MySQL may have to sort the whole table
EXPLAIN
SELECT
	customer_id
FROM
	customers
ORDER BY
	state;

-- Show the cost of the last executed query
-- Lower cost means better performance
SHOW STATUS LIKE 'last_query_cost';
