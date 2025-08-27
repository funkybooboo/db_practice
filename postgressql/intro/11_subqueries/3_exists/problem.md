# EXISTS

SQL has a special operator called EXISTS. It is used to check if a subquery returns any rows. If the subquery returns any rows, the EXISTS operator returns TRUE. If the subquery returns no rows, the EXISTS operator returns FALSE.

```sql
SELECT name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id
);
```

The above query returns all customers who have made at least one order.

The subquery (SELECT 1 FROM orders o WHERE o.customer_id = c.id) returns a row if there is at least one order for the customer.

The outer query returns the name of each customer where the subquery returns a row. Notice the subquery uses the table from the outer query, c, to filter the rows. This means the subquery is dependent on the outer query, and must be run for each customer in the outer query.

Why do we use SELECT 1 instead of SELECT *?

    The EXISTS operator only checks if a row is returned. We could use SELECT * to check for the existence of a row, but this would be less efficient since it would actually return the row(s) and then check if they exist. Using SELECT 1 is more efficient since it returns a row with a value of 1 if a row is found and otherwise doesn't return anything. 

We could also use a NOT EXISTS operator to check for the non-existence of a row.

```sql
SELECT name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id
);
```

The above query returns all customers who have not made any orders.

# Challenge

You are given a table users with the following columns:

    id of type INTEGER as the primary key
    name of type TEXT

And a table posts with the following columns:

    id of type INTEGER as the primary key
    user_id of type INTEGER
    title of type TEXT
    content of type TEXT

Your task is to return the names of users who have not made any posts. Sort the names in ascending order.
