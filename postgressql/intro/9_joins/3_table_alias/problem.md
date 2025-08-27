# Table Alias

When performing a join, you can use an alias for each table to make queries more readable.

```sql
SELECT s.name, c.course_name
FROM students AS s
INNER JOIN course_registrations AS c ON s.id = c.student_id;
```

In the above example, the `students` table is aliased as `s` and the `course_registrations` table is aliased as `c`. We use the `AS` keyword to alias the tables, similar to how we use it to rename columns in the output result.

We can also omit the `AS` keyword and just place the alias directly after the table name.

```sql
SELECT s.name, c.course_name
FROM students s
INNER JOIN course_registrations c ON s.id = c.student_id;
```

The above example is equivalent to the previous example.

# Challenge

You are given a table called `users` with the following columns:

    `id` of type `INTEGER`
    `name` of type `TEXT`
    `email` of type `TEXT`

You are also given a table called `employment_records` with the following columns:

    `id` of type `INTEGER`
    `user_id` of type `INTEGER`
    `company_name` of type `TEXT`
    `job_title` of type `TEXT`

Your task is to return the `name`, `email`, `company_name`, and `job_title` of each user.

Order the results by the `company_name` in ascending order.

    Feel free to use aliases for the tables for practice.
