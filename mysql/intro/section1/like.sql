-- Use the sql_store database for the following queries
USE sql_store;

-- Get all customers whose last name starts with the letter 'b'
-- % matches any number of characters after 'b'
SELECT
 	*
FROM
 	customers
WHERE
 	last_name LIKE 'b%'; -- % = any number of characters

-- Get all customers whose last name is exactly 6 characters long
-- and ends with 'y'. Each underscore (_) represents a single character.
SELECT
 	*
FROM
 	customers
WHERE
 	last_name LIKE '_____y'; -- _ = exactly one character

-- Get all customers whose address contains either 'trail' or 'avenue' (case-insensitive)
-- % on both sides means the word can appear anywhere in the address
SELECT
	*
FROM
	customers
WHERE
	address LIKE '%trail%' -- contains "trail"
	OR address LIKE '%avenue%'; -- contains "avenue"

-- Get all customers whose phone numbers end with the digit 9
-- %9 means any characters before the final digit being 9
SELECT
	*
FROM
	customers
WHERE
	phone LIKE '%9';

-- Get all customers whose phone numbers do NOT end with the digit 9
SELECT
	*
FROM
	customers
WHERE
	phone NOT LIKE '%9';

