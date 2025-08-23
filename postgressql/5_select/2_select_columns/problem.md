# Select Columns

If we don't need all of the columns from a table, it's more efficient to select only the columns we need. We can do this by specifying the column names in the `SELECT` statement.

```sql
CREATE TABLE coding_problems (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    difficulty TEXT,
    description TEXT
);

SELECT id, name, difficulty
FROM coding_problems;
```

The above query might return:

| id  | name               | difficulty |
|-----|-------------------|------------|
| 1   | Dynamic Array     | Easy       |
| 2   | Binary Search Tree| Medium     |
| 3   | Graph Traversal   | Hard       |

We can also rename the columns in the result set using the `AS` keyword.

```sql
SELECT id AS problem_id, name AS problem_name, difficulty AS problem_difficulty
FROM coding_problems;
```

This will return:

| problem_id | problem_name       | problem_difficulty |
|------------|-------------------|-------------------|
| 1          | Dynamic Array     | Easy              |
| 2          | Binary Search Tree| Medium            |
| 3          | Graph Traversal   | Hard              |

## Challenge

You are given a table called `comments`. Use the `SELECT` statement to select the `author` and `body` columns, and rename them to `comment_author` and `comment_body`.
