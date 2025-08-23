# Select Order By

We can use the `ORDER BY` clause to sort the results of a query in ascending or descending order.

```sql
SELECT name, population, country
FROM cities
WHERE population > 19000000
ORDER BY population DESC;
```

This would return the rows sorted by the `population` column in descending order. The `ORDER BY` clause is applied after the `WHERE` clause. If we had not included the `WHERE` clause, all rows would be sorted by the `population` column in descending order.

| name       | population | country |
|------------|------------|---------|
| Tokyo      | 37400068   | Japan   |
| Mumbai     | 20660000   | India   |
| Cairo      | 20010000   | Egypt   |
| New Delhi  | 19640000   | India   |

If we want to sort the results in ascending order, we can use the `ASC` keyword or simply omit it.

```sql
SELECT name, population, country
FROM cities
WHERE population > 19000000
ORDER BY population;
```

-- Above is same as below using `ASC` keyword --
```sql
SELECT name, population, country
FROM cities
WHERE population > 19000000
ORDER BY population ASC;
```

The output might look like this:

| name       | population | country |
|------------|------------|---------|
| New Delhi  | 19640000   | India   |
| Cairo      | 20010000   | Egypt   |
| Mumbai     | 20660000   | India   |
| Tokyo      | 37400068   | Japan   |

## Challenge

You are given a table called `comments`. Return all `author`, `body`, and `created_at` columns sorted by the `created_at` column in descending order.
