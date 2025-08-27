# Arrays

PostgreSQL also supports arrays, which allow us to store a collection of values of the same type.

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    course_list TEXT[]
);

INSERT INTO users (name, course_list) VALUES
  ('Alice', ARRAY['Math', 'Science', 'History']),
  ('Bob', ARRAY['Math', 'Science']),
  ('Charlie', ARRAY['Math', 'History']),
  ('David', ARRAY['Science', 'History']);
```

Above, we have a table called `users` with a `course_list` column that stores an array of strings. We can insert multiple courses for each user by using the `ARRAY` keyword.

- Arrays in PostgreSQL are 1-indexed, meaning the first element is at index 1, the second at index 2, and so on. PostgreSQL also supports multi-dimensional arrays and more, which you can read more about here.

In most cases, it's more common to normalize data into separate tables rather than using arrays. We will cover this later in the course.

# Challenge

Create a table called `orders` with the following columns:

- `id` of type INTEGER as the primary key
- `items` of type array of TEXT
- `total_price` of type INTEGER
