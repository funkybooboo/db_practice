# Unique Constraint

We may want to ensure that a column or a group of columns have unique values in a table. This is where the `UNIQUE` constraint comes in. For example, we may want to ensure that no two users have the same email address.

```sql
CREATE TABLE users (
    email TEXT UNIQUE NOT NULL,
    name TEXT
);
```

Above, the `email` column has the `UNIQUE` constraint. This means that every row in the table must have a unique value for the `email` column. We also added the `NOT NULL` constraint to ensure that the `email` column must have a value.

# Challenge

Create a table called `students` with the following columns:

- `id` of type `INTEGER` which must be unique and not be `NULL`
- `name` of type `TEXT` which must not be `NULL`
- `age` of type `INTEGER` which must not be `NULL`
