# Insert Basics

The `INSERT` statement is used to insert one or more new rows into a table.

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    status TEXT
);

INSERT INTO users (id, name, status)
  VALUES (1, 'Alice', 'active'),
    (2, 'Bob', 'inactive'),
    (3, 'Charlie', 'pending');
```

After the `INSERT INTO` statement, we specify the name of the table, followed by a comma-separated list of columns to insert into. The order of the columns must match the order of the values in the `VALUES` clause.

We could have reordered the columns by placing the `id` column at the end, for example:

```sql
INSERT INTO users (name, status, id)
  VALUES ('Alice', 'active', 1),
    ('Bob', 'inactive', 2),
    ('Charlie', 'pending', 3);
```

This is equivalent to the first example. The resulting table will still be the same:

| id  | name    | status   |
|-----|---------|----------|
| 1   | Alice   | active   |
| 2   | Bob     | inactive |
| 3   | Charlie | pending  |

## Challenge

You are given a table `bank_accounts` with the following columns:

- `id` of type `INTEGER` as the primary key
- `account_type` of type `account_type`
- `balance` of type `INTEGER`

Where `account_type` is an `ENUM` with values 'checking', 'savings', 'cd', 'money_market'.

Insert the following rows into the table in the order given:

| id  | account_type  | balance |
|-----|---------------|---------|
| 1   | checking      | 1000    |
| 2   | savings       | 2000    |
| 3   | cd            | 3000    |
| 4   | money_market  | 4000    |
