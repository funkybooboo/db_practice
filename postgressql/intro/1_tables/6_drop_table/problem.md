# Drop Table

You can use the `DROP TABLE` statement to remove a table from a database.

```sql
CREATE TABLE users (
    name TEXT,
    age INTEGER
);

DROP TABLE users;
```

In the example above, we created a table called `users` and then dropped it using the `DROP TABLE` statement.

When a table is dropped, all the data in the table is deleted, and the table itself is removed from the database.

# Challenge

You are given a table called `unused_table`. Your task is to drop this table from the database.
