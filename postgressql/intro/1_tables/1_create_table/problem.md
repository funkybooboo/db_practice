# SQL Table Creation and Querying

In this course, we will be using PostgreSQL to learn SQL (Structured Query Language). PostgreSQL is the world's most advanced open-source database.

## Relational Databases and Tables

Relational databases store data in tables. A table consists of rows and columns.

### Example: Creating a Table

```sql
CREATE TABLE users (
    name TEXT,
    age INTEGER,
    join_date DATE
);
```

In the example above, we created a table called `users` with three columns:

- The `name` column is of type `TEXT`
- The `age` column is of type `INTEGER`
- The `join_date` column is of type `DATE`

This is the schema of the table. It's analogous to a class definition in object-oriented programming.

### Challenge: Create a `videos` Table

Create a table called `videos` with the following columns:

- `id` of type `INTEGER`
- `name` of type `TEXT`
- `created_at` of type `DATE`
- `published` of type `BOOLEAN`

```sql
CREATE TABLE videos (
    id INTEGER,
    name TEXT,
    created_at DATE,
    published BOOLEAN
);
```

### Explanation of `SELECT .. FROM .. WHERE`

The `SELECT .. FROM .. WHERE` statement within the starter code is being used to get information about the columns in the `videos` table. We are using it to show you the schema of the table you created, and to test the correctness of your code.

Please do not remove or modify it, or your submission may fail.
