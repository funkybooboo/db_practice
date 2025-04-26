USE sql_store;

-- Show all indexes on the customers table
SHOW INDEXES IN customers;

-- Output Explanation:
-- - Table: customers
-- - Non_unique: 0 = Unique index (like a PRIMARY KEY), 1 = Non-unique index
-- - Key_name:
--     - PRIMARY → the primary key index (customer_id)
--     - idx_state → custom index on the state column
--     - idx_points → custom index on the points column
-- - Seq_in_index: the order of the column in the index (useful for composite/multi-column indexes)
-- - Column_name: the column the index is on
-- - Collation: A = Ascending order
-- - Cardinality: estimated number of unique values (helps query optimizer)
-- - Index_type: BTREE (default index type in MySQL)

-- Notes:
-- - PRIMARY is automatically created when we define a PRIMARY KEY. 
--   It’s a clustered index, meaning it defines the physical order of rows.
-- - We manually created idx_state and idx_points indexes to optimize queries filtering by state and points.

-- Recalculate and update table statistics (so MySQL query optimizer can make better decisions)
ANALYZE TABLE customers;

-- Show all indexes on the orders table
SHOW INDEXES IN orders;

-- Recalculate statistics for the orders table too
ANALYZE TABLE orders;

-- Notes:
-- - MySQL automatically creates indexes for FOREIGN KEY columns (like customer_id in orders).
-- - This helps speed up JOINs and ensures referential integrity checks are efficient.
