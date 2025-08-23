# Select Limit

It can be costly and often unnecessary to return all rows from a table. We can use the `LIMIT` keyword to return a subset of rows.

```sql
SELECT name
FROM cities
LIMIT 10;
```

The above query will return the first 10 rows from the `cities` table.

The `LIMIT` clause can also be combined with the `WHERE` and `ORDER BY` clauses.

```sql
SELECT name
FROM cities
WHERE population > 1000000
ORDER BY population DESC
LIMIT 5;
```

The above query will return the first 5 rows from the `cities` table where the population is greater than 1,000,000, ordered by the population in descending order.

You can think of it as a 3-step process:

1. Filter the rows using the `WHERE` clause.
2. Order the rows using the `ORDER BY` clause.
3. Limit the rows using the `LIMIT` clause.

## Challenge

You are given a table called `flights`. Return the 2 cheapest flights, ordered by the `price` column in ascending order, where the origin is 'London' and the destination is 'Paris'. You should return all columns.
