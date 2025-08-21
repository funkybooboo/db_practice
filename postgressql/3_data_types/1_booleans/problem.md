# Booleans

There are many data types supported in SQL. For a full list, check out the PostgreSQL documentation.

We will be covering the most common data types in this course.

Booleans are a type of data that can only be true or false, similar to most programming languages.

```sql
CREATE TABLE users (
    is_active BOOLEAN
);

-- Insert true values --
INSERT INTO users (is_active) VALUES
  (TRUE),
  (true),
  ('t'),
  ('y'),
  ('YES'),
  ('on'),
  ('1');

-- Insert false values --
INSERT INTO users (is_active) VALUES
  (FALSE),
  (false),
  ('f'),
  ('N'),
  ('no'),
  ('OFF'),
  ('0');
```

In the above example, the `is_active` column can only have the values true or false. We use `INSERT INTO` to insert the values into the table. We will learn more about `INSERT INTO` later, but for now it's enough to know that each row is represented by `()`, and the values inside correspond to the columns in the table.

Notice that there are many different ways to represent a boolean value in SQL.

- For example, true can be represented as `TRUE`, `true`, `t`, `y`, or `1`.
- Similarly, false can be represented as `FALSE`, `false`, `f`, `n`, or `0`.

For consistency, it's best to stick to a single representation of a boolean value in SQL, using either `TRUE` or `FALSE`, or `true` or `false`.

# Challenge

Create a table called `three_column_table` with the following columns:

- `id` of type `INTEGER` as the primary key
- `is_active` of type `BOOLEAN`
- `is_admin` of type `BOOLEAN`
