USE sql_store;


-- bad way
EXPLAIN SELECT
	customer_id
FROM
	customers
WHERE
	state = 'CA'
	OR points > 1000;

-- good way
CREATE INDEX IF NOT EXISTS idx_points ON customers (points);

EXPLAIN
SELECT
	customer_id
FROM
	customers
WHERE
	state = 'CA'
UNION
SELECT
	customer_id
FROM
	customers
WHERE
	points > 1000;


-- mysql cant use indexes if we use expressions
-- bad way
EXPLAIN
SELECT
	customer_id
FROM
	customers
WHERE
	points + 10 > 2010;

-- good way
EXPLAIN
SELECT
	customer_id
FROM
	customers
WHERE
	points > 2000;
