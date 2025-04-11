-- Combine two sets of orders:
-- - Orders from 2019 or later are labeled 'Active'
-- - Orders before 2019 are labeled 'Archived'
-- UNION merges the two result sets into one
SELECT
	o.order_id,
	o.order_date,
	'Active' AS status
FROM
	sql_store.orders o
WHERE
	order_date >= '2019-01-01'

UNION

SELECT
	o.order_id,
	o.order_date,
	'Archived' AS status
FROM
	sql_store.orders o
WHERE
	order_date < '2019-01-01';


-- Combine names from two different sources:
-- - Customers' first names
-- - Shippers' company names
-- Useful when both represent "parties" involved in orders
SELECT
	c.first_name AS name
FROM
	sql_store.customers c

UNION

SELECT
	s.name
FROM
	sql_store.shippers s;


-- Categorize customers into Gold, Silver, or Bronze tiers based on points
-- Wrap the entire UNION in a subquery for easier sorting and filtering
SELECT *
FROM (
    -- Gold: > 3000 points
    SELECT
        c.customer_id,
        c.first_name,
        c.points,
        'Gold' AS type
    FROM
        sql_store.customers c
    WHERE
        c.points > 3000

    UNION 

    -- Silver: between 2000 and 3000 points
    SELECT
        c.customer_id,
        c.first_name,
        c.points,
        'Silver' AS type
    FROM
        sql_store.customers c
    WHERE
        c.points BETWEEN 2000 AND 3000

    UNION 

    -- Bronze: < 2000 points
    SELECT
        c.customer_id,
        c.first_name,
        c.points,
        'Bronze' AS type
    FROM
        sql_store.customers c
    WHERE
        c.points < 2000
) AS categorized_customers
ORDER BY first_name;

