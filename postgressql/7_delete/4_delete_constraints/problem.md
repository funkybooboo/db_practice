# Delete Constraints

Table constraints, such as the `UNIQUE`, `NOT NULL`, and `PRIMARY KEY` constraints also apply when we delete rows from a table.

For example, if we had two tables with this structure:

```sql
CREATE TABLE schools (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    school_id INTEGER REFERENCES schools(id)
);
```

users table
| id  | name  | school_id |
|-----|-------|-----------|
| 1   | Alice | 1         |
| 2   | Bob   | 2         |

schools table
| id  | name  |
|-----|-------|
| 1   | MIT   |
| 2   | Stanford |

If we try to delete a row from the `schools` table, we will get an error because the `users` table has a foreign key constraint that references the `schools` table.

In this simple example, the easiest way to fix this would be to delete all rows from the `users` table that reference the `schools` table. Or simply delete all rows from the `users` table and then delete all rows from the `schools` table.

## Challenge

You are given three tables: `students`, `classes`, and `enrollments`.

We are currently trying to delete all of the tables, but currently, we violate a foreign key constraint. Reorder the three `DELETE` statements so that the `DELETE` statements are executed in the correct order.
