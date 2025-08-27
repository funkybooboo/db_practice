# Select Everything

We can read data from a table using the `SELECT` statement. To select all columns from a table, we can use the asterisk (`*`) wildcard.

```sql
SELECT *
FROM users;

-- Equivalent to: --
SELECT * FROM users;
```

We use the `SELECT *` portion to select all columns and the `FROM` clause to specify the table we want to select from.

> Similar to `CREATE TABLE` and `INSERT INTO` we can place this statement in the same line or separate them.

## Challenge

You are given a table called `coding_problems`. Use the `SELECT` statement to select all columns from the table.
