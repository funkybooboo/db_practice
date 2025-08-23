# Update All

In addition to reading and adding data to a table, we can also update existing rows in a table using the `UPDATE` statement.

```sql
UPDATE users
SET username = 'anonymous';
```

The above statement updates all rows in the `users` table, setting the `username` column to `anonymous`.

We can also update multiple columns at once.

```sql
UPDATE users
SET username = 'anonymous', email = 'unavailable', last_login = CURRENT_TIMESTAMP;
```

The above statement updates all rows in the `users` table, setting the `username` column to `anonymous`, the `email` column to `unavailable`, and the `last_login` column to the current timestamp.

What if we only want to update certain rows? We will learn about this soon!

## Challenge

You are given a table called `students` with the following columns:

- `id` of type `INTEGER`
- `name` of type `TEXT`
- `age` of type `INTEGER`

Your task is to update all rows in the `students` table, setting the `age` column to `NULL`. You may assume that there is no constraint that would prevent updating the `age` column.
