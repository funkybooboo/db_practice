# Insert Constraints

When inserting rows, we need to be mindful of the constraints of the table.

```sql
CREATE TYPE status AS ENUM ('active', 'inactive', 'pending');

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER CHECK (age >= 18),
    status status
);
```

For the `users` table above, we have the following constraints:

- The `id` column must be unique and non-empty.
- The `name` column must be non-empty.
- The `age` column must be at least 18.
- The `status` column can only have the values 'active', 'inactive', or 'pending'.

## Challenge

You are given a table `users` with a few rows being inserted into it. Each of the rows violates one of the constraints of the table.

Update the `INSERT` statement to successfully insert the following rows:

| id  | name       | age | status   |
|-----|------------|-----|----------|
| 1   | 'John Doe' | 20  | 'active' |
| 2   | 'Jane Doe' | 27  | 'pending'|
| 3   | 'John Smith'| 28  | 'active' |
| 4   | 'Jane Smith'| 30  | 'inactive'|

Click for hint.

The first row violates the `NOT NULL` constraint.

The second row violates the `PRIMARY KEY` constraint, by using a duplicate id.

The third row violates the `CHECK` constraint, by using an age less than 18.

The fourth row violates the `status` constraint, by using an invalid status.
