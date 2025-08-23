# Update Constraints

Earlier in the course, we learned about constraints, such as the `UNIQUE`, `NOT NULL`, and `PRIMARY KEY` constraints.

These constraints apply not only when we insert new rows, but also when we update existing rows.

For example, if we had a table with this structure:

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL
);
```

We would not be able to run the following update:

```sql
UPDATE users
SET name = NULL;
```

We can not set the `name` column to `NULL` because the `NOT NULL` constraint prevents it.

## Challenge

You are given a table called `bank_accounts` with the following columns:

- `id` of type `INTEGER`
- `balance` of type `INTEGER`
- `name` of type `TEXT`
- `account_status` of enum type `status`

There is an existing `UPDATE` statement, but it has a bug. It currently updates 3 columns, but it violates a constraint for one of them. Fix the bug by changing the statement so that it only updates 2 columns, and does not violate any constraints.

Hint: You can run the code to see the error message. It may help you understand what the bug is.
