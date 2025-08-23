# Select Where Not

We can also filter out rows with inequalities.

```sql
SELECT id, name, difficulty
FROM coding_problems
WHERE difficulty != 'Easy';

SELECT id, name, difficulty
FROM coding_problems
WHERE difficulty <> 'Easy';
```

Both of the above queries will return the rows where the `difficulty` column is not 'Easy'. The `!=` and `<>` operators are equivalent, but it is more common to use `!=`.

## Challenge

You are given a table called `athletes`. Use the `SELECT` statement to select only the `name` column, and return only the rows where the `sport` column is not 'Basketball'.
