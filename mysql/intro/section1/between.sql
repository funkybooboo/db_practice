-- Switch to the `sql_store` database to run the following queries on its tables
USE sql_store;

-- Select all customers who have between 1000 and 3000 points using explicit conditions
SELECT
 	*
FROM
 	customers
WHERE
 	points >= 1000
 	AND points <= 3000;


-- Select all customers who have between 1000 and 3000 points using the BETWEEN operator (inclusive)
SELECT
 	*
FROM
 	customers
WHERE
 	points BETWEEN 1000 AND 3000;


-- Select all customers who were born between January 1, 1990 and January 1, 2000 (inclusive)
SELECT
	*
FROM
	customers
WHERE
	birth_date BETWEEN '1990-01-01' AND '2000-01-01';

