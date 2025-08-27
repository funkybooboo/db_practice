# Enum

PostgreSQL also supports the concept of an ENUM, which is a data type that restricts a column to a set of predefined values. It is similar to using a CHECK constraint, but it is a data type rather than a constraint. This makes it easier to reuse across multiple tables and columns.

```sql
CREATE TYPE status AS ENUM ('active', 'inactive', 'pending');

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    status status
);

INSERT INTO users (id, name, status) VALUES
  (1, 'Alice', 'active'),
  (2, 'Bob', 'inactive'),
  (3, 'Charlie', 'pending');

-- This will cause an error. 'not active' is not a valid status. --
INSERT INTO users (id, name, status) VALUES
  (4, 'David', 'not active');
```

In the above example, we created an ENUM called `status` with values `active`, `inactive`, or `pending`. To create an ENUM, we use the `CREATE TYPE` statement.

The `status` column in the `users` table can only have the values `active`, `inactive`, or `pending`.

# Challenge

Create an ENUM called `account_type` with values 'checking', 'savings', 'cd', 'money_market'.

Then, create a table called `bank_accounts` with the following columns:

- `id` of type INTEGER as the primary key
- `account_type` of type `account_type`
- `balance` of type INTEGER
