# ANY and ALL

There is an operator called ANY that is useful when dealing with multiple values.

The below query will return the names of customers who have made an order with a price greater than 150.

```sql
SELECT name
FROM customers
WHERE id = ANY (
    SELECT DISTINCT customer_id
    FROM orders
    WHERE price > 150
);
```

The subquery returns all customer ids that have made an order with a price greater than 150. We then use id = ANY (subquery) in the WHERE clause to filter for customers with ids that are in the subquery.

Another operator called ALL is also useful and works similarly:

```sql
SELECT name
FROM customers c
WHERE c.budget > ALL (
    SELECT o.price
    FROM orders o
    WHERE o.product_name = 'Laptop'
);
```

The subquery returns all prices for orders with the product name Laptop. We then use c.budget > ALL (subquery) in the WHERE clause to filter for customers with a budget greater than all the values in the subquery.

This will return the names of customers who have a budget to buy any given laptop.

# Challenge

You are given a table customers with the following columns:

    id of type INTEGER as the primary key
    name of type TEXT

You are also given a table orders with the following columns:

    id of type INTEGER as the primary key
    customer_id of type INTEGER
    price of type INTEGER

Your task is to return the names of customers who have made an order with a price less than 100. Order the names in ascending order.
