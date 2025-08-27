# Common Table Expressions

With PostgreSQL you can temporarily save the results of a query to a Common Table Expression (CTE). This is useful when you want to reuse the results of a query in multiple places in your query.

CTEs are defined using the WITH clause.

```sql
WITH high_value_orders AS (
    SELECT customer_id, SUM(price) as total_spend
    FROM orders
    GROUP BY customer_id
    HAVING SUM(price) > 1000
)

SELECT c.name, hvo.total_spend
FROM customers c
JOIN high_value_orders hvo ON c.id = hvo.customer_id
ORDER BY hvo.total_spend DESC;
```

In this example, we first define a CTE named high_value_orders. This CTE calculates the total spend for each customer who has spent more than 1000. We then use this CTE in the main query to join with the customers table, and retrieve the names of these high-value customers.

    A CTE is not persisted in the database. It is only used for the duration of the query. A CTE should not have a semicolon at the end. 

# Challenge

You are given a table customers with the following columns:

    id of type INTEGER as the primary key
    name of type TEXT

You are also given a table orders with the following columns:

    id of type INTEGER as the primary key
    customer_id of type INTEGER
    price of type INTEGER

Your task is to return the names of customers who have made an order with a max price less than 100. Order the names in ascending order.
