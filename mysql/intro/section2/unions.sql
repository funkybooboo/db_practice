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
	

SELECT
	c.first_name AS name
FROM
	sql_store.customers c
UNION
SELECT
	s.name
FROM
	sql_store.shippers s;


SELECT *
FROM (
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


