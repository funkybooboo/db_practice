-- List all available storage engines and their details (support for transactions, etc.)
SHOW ENGINES;

-- Make sure you are working in the correct database
USE sql_store2;

-- Optional: Check the current storage engine of the table before changing it
SHOW TABLE STATUS LIKE 'customers';

-- If needed, change the storage engine of the table to InnoDB
-- This operation rebuilds the table, so it can take a while for large tables
-- InnoDB provides:
--   - Support for transactions (COMMIT, ROLLBACK)
--   - Row-level locking (better for concurrency)
--   - Foreign key support
ALTER TABLE customers
    ENGINE = InnoDB;

-- Optional: Verify that the engine has been updated
SHOW TABLE STATUS LIKE 'customers';
