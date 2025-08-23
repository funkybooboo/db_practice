# Delete Returning

Just like with `UPDATE` statements, we can also use the `RETURNING` clause to return the rows that were deleted.

```sql
DELETE FROM users
WHERE username = NULL;
RETURNING *;
```

The above statement deletes all rows from the `users` table where the `username` column is `NULL` and returns all rows that were deleted.

We can also return specific columns rather than all columns.

```sql
DELETE FROM users
WHERE username = NULL;
RETURNING id, username, email;
```

The above will return only the `id`, `username`, and `email` columns for all rows that were deleted.

## Challenge

You are given a table called `bank_accounts` with the following columns:

- `id` of type `INTEGER`
- `name` of type `TEXT`
- `balance` of type `INTEGER`
- `last_transaction_date` of type `DATE`

Your task is to delete all rows from the `bank_accounts` table where the `balance` column is less than 0 and the `last_transaction_date` column is before '2024-01-01'. Return the `id` and `name` columns for all rows that were deleted.
