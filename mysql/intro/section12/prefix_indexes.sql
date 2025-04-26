USE sql_store;

-- Create an index on the first 5 characters of the last_name column
CREATE INDEX idx_lastname ON
	customers (last_name(5));

-- Prefix index explanation:
-- - Index only the first 5 characters of last_name.
-- - Saves space compared to indexing the full column.
-- - Good when:
--   - The column is a long VARCHAR (like 255 characters).
--   - Queries often search by the beginning of the string.
-- - Important:
--   - Prefix indexes may not fully support ORDER BY or UNIQUE constraints.

-- Check how many unique values we have at different prefix lengths
SELECT
	COUNT(DISTINCT LEFT(last_name, 1)),
	-- 25 distinct first letters
	COUNT(DISTINCT LEFT(last_name, 5)),
	-- 966 distinct first 5 characters
	COUNT(DISTINCT LEFT(last_name, 10)),
	-- 996 distinct first 10 characters
	COUNT(DISTINCT LEFT(last_name, 20))
	-- 996 distinct first 20 characters
FROM
	customers;

-- Interpretation:
-- - LEFT(last_name, 1): only 25 unique starting letters (A-Z).
-- - LEFT(last_name, 5): 966 unique combinations.
-- - LEFT(last_name, 10) and LEFT(last_name, 20): about 996 unique (almost all customers).
-- 
-- Conclusion:
-- - Using 5 characters captures most of the uniqueness.
-- - Index is much smaller than indexing the full column.
-- - Better performance and smaller storage.
