# Delete All

While we can use the `UPDATE` statement to set row values to `NULL`, a better approach is to completely remove the rows from the table using the `DELETE` statement.

```sql
DELETE FROM users;
```

The above statement deletes all rows from the `users` table.

Unlike the `SELECT` and `UPDATE` statements, the `DELETE` statement always operates on all columns within a table. This means we can only delete entire rows and not specific columns. We can specify rows to delete using a `WHERE` clause, but if we omit the `WHERE` clause, all rows will be deleted.

## Challenge

You are given a table called `students` with the following columns:

- `id` of type `INTEGER`
- `name` of type `TEXT`
- `age` of type `INTEGER`

Your task is to delete all rows from the `students` table.
