# Update Returning

Within an `UPDATE` statement, we can use the `RETURNING` clause to return the rows that were updated. This is useful if we want to see the results of the update.

```sql
UPDATE users
SET username = 'anonymous'
WHERE username IS NULL
RETURNING *;
```

The `RETURNING *` clause returns all columns for the rows that were updated.

We can also specify which columns to return by listing them in the clause.

```sql
UPDATE users
SET username = 'anonymous'
WHERE username IS NULL
RETURNING id, username;
```

## Challenge

You are given a table called `bank_accounts` with the following columns:

- `id` of type `INTEGER`
- `balance` of type `INTEGER`
- `name` of type `TEXT`
- `status` of type `TEXT`

Your task is to update the `status` column to `VIP` for all rows where the `balance` is greater than 10,000 and less than 100,000. Return the `id`, `balance`, and `status` columns for the rows that were updated.
