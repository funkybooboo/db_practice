# Not Null Constraint

We learned that columns can have default values, and if they don't, the default value is `NULL`. However, sometimes we want to enforce that a column must have a value. This is where the `NOT NULL` constraint comes in.

```sql
CREATE TABLE users (
    name TEXT NOT NULL,
    age INTEGER
);
```

In the example above, the `name` column is set to `NOT NULL`. This means that every row in the table must have a value for the `name` column.

Columns can have both a default value and the `NOT NULL` constraint.

```sql
CREATE TABLE users (
    name TEXT NOT NULL DEFAULT 'Anonymous',
    age INTEGER DEFAULT 0 NOT NULL
);
```

Above, we have added both a default value and the `NOT NULL` constraint to the columns. The order we place the default value and the `NOT NULL` constraint for a column does not matter.

A constraint in SQL is a rule that is enforced on a column. `NOT NULL` is only one of many constraints we will learn about.

# Challenge

Create a table called `products` with the following columns:

- `name` of type `TEXT` and must not be `NULL`, with a default value of 'Unknown'
- `price` of type `INTEGER` and must not be `NULL`
- `quantity` of type `INTEGER` which has a default value of 0
