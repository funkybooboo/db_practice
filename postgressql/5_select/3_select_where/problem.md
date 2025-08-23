# Select Where

With `SELECT` statements, we can filter the rows that are returned using the `WHERE` clause.

```sql
SELECT id, name, difficulty
FROM coding_problems
WHERE difficulty = 'Easy';
```

The above query will only return the rows where the `difficulty` column is 'Easy'. The `WHERE` clause acts similar to an `if` statement in other programming languages.

Notice that to check for equality, we use the `=` operator rather than `==`. In SQL, the single `=` is not reserved for assignment as it is in most programming languages, so we can safely use it to check for equality.

## Challenge

You are given a table called `athletes`. Use the `SELECT` statement to select the `name` and `sport` columns, and return only the rows where the `sport` column is 'Basketball'.
