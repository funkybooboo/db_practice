# Alter Table

You can use the `ALTER TABLE` statement to add, modify, or drop columns in an existing table.

```sql
CREATE TABLE users (
    name TEXT
);

-- Add a new column called `age` of type `INTEGER` to the table
ALTER TABLE users ADD COLUMN age INTEGER;

-- Modify the `name` column to be called `full_name` instead
ALTER TABLE users RENAME COLUMN name TO full_name;

-- Remove / drop the `name` column from the table
ALTER TABLE users DROP COLUMN name;
```

In the above example, we:

- Add a new column called `age` of type `INTEGER` to the table
- Modify the `name` column to be called `full_name` instead
- Drop (remove) the `name` column from the table

To drop a column means to remove it from the table.

# Challenge

You are given a table called `books` with the following columns:

- `id` of type `INTEGER`
- `title` of type `TEXT`
- `author` of type `TEXT`

Your task is to:

- Add a new column called `published_year` of type `INTEGER` to the table
- Modify the `id` column to be called `isbn` instead
- Drop the `author` column from the table
