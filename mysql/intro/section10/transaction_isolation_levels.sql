-- View the current transaction isolation level setting
SHOW VARIABLES LIKE 'tx_isolation';  -- Deprecated alias for 'transaction_isolation' in newer versions

-- Isolation Levels:

-- 1. READ UNCOMMITTED:
--    - Allows reading uncommitted changes (dirty reads)
--    - Lowest level of isolation, highest concurrency
--    - Allows dirty reads, non-repeatable reads, and phantom reads
--    - Rarely used due to potential data inconsistencies

-- 2. READ COMMITTED:
--    - Only reads committed data (no dirty reads)
--    - Non-repeatable reads and phantom reads still possible
--    - Default in some databases like SQL Server, not in MySQL/MariaDB

-- 3. REPEATABLE READ:
--    - Prevents dirty reads and non-repeatable reads
--    - Phantom reads are still possible
--    - Default in MySQL/MariaDB

-- 4. SERIALIZABLE:
--    - Highest level of isolation
--    - Prevents dirty reads, non-repeatable reads, and phantom reads
--    - Executes transactions as if they were run sequentially (one at a time)
--    - Ensures full consistency, but reduces concurrency

-- Set the isolation level for the next transaction only
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Set the isolation level for all transactions in the current session
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Set the isolation level globally for all sessions (including the current one)
SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE;
