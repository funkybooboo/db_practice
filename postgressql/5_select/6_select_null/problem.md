# Select Null

We can also return rows where a column value is `NULL` or `NOT NULL`.

```sql
SELECT *
FROM coding_problems
WHERE difficulty IS NULL;

SELECT *
FROM coding_problems
WHERE difficulty IS NOT NULL;
```

The first query will return all rows where the `difficulty` column is `NULL`, meaning it is empty.

The second query will return all rows where the `difficulty` column is `NOT NULL`, meaning it is not empty.

Important: To compare a column to `NULL`, we cannot use the `=` or `!=` operators. It won't behave as expected. We must use the `IS NULL` or `IS NOT NULL` operator.

## Challenge

You are given a table called `comments`. Return all rows where the `author` column is not `NULL`.
