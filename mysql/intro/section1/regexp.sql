-- Use the sql_store database for the following queries
USE sql_store;

-- Get all customers whose last name contains the substring 'field'
SELECT
 	*
FROM
 	customers
WHERE
 	last_name REGEXP 'field';  -- equivalent to LIKE '%field%'

-- Get customers whose last name:
-- ends with 'field' OR contains 'mac' OR starts with 'rose'
SELECT
 	*
FROM
 	customers
WHERE
 	last_name REGEXP 'field$|mac|^rose';

-- Get customers whose last name contains:
-- 'ge', 'ie', or 'me' (i.e., a character from [gim] followed by 'e')
SELECT
 	*
FROM
 	customers
WHERE
 	last_name REGEXP '[gim]e';  -- matches 'ge', 'ie', or 'me'

-- Get customers whose last name contains:
-- a letter from a–h followed by 'e' (e.g., 'ae', 'be', 'ce', ..., 'he')
SELECT
 	*
FROM
 	customers
WHERE
 	last_name REGEXP '[a-h]e';

-- -----------------------------------
-- REGEXP quick reference:
-- ^     = start of string
-- $     = end of string
-- |     = logical OR
-- []    = match any one character in the brackets
-- [a-f] = match any one character from a to f
-- -----------------------------------

-- Get customers whose first name is exactly 'elka' or 'ambur'
-- NOTE: SQL is case-insensitive by default unless configured otherwise
SELECT
	*
FROM
	customers
WHERE
	first_name IN ('elka', 'ambur');

-- Get customers whose last name ends in either 'ey' or 'on'
SELECT
	*
FROM
	customers
WHERE
	last_name REGEXP 'ey$|on$';  -- $ means "ends with"

-- Get customers whose last name:
-- starts with 'my' OR contains 'se' anywhere
SELECT
	*
FROM
	customers
WHERE
	last_name REGEXP '^my|se';  -- ^my = starts with 'my', se = anywhere

-- Get customers whose last name contains 'b' followed by either 'r' or 'u'
-- This will match patterns like 'bru', 'bur', 'br', 'bu'
SELECT
	*
FROM
 	customers
WHERE
	last_name REGEXP 'b[ru]';  -- 'b' followed by either 'r' or 'u'

