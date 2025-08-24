# Aggregation Avg

If we have a table that stores student test scores, it might look like this:

| student_id | score |
|------------|-------|
| 1          | 70    |
| 2          | NULL  |
| 3          | 75    |
| 4          | 65    |

We can use the `AVG` function to find the average score of all the students.

```sql
SELECT AVG(score) as average_score
FROM students;
```

Most aggregation functions, including the `AVG` function, will ignore `NULL` values, so we don't need a `WHERE` clause to filter out the `NULL` values. The output for this example would be (70 + 75 + 65) / 3 = 70.

By default, the `AVG` function will return a floating-point number. If we want to round the result to the nearest integer, we can use the `ROUND` function.

```sql
SELECT ROUND(AVG(score)) as average_score
FROM students;
```

## Challenge

You are given a table called `scores` with the following columns:

- `id` of type `INTEGER`
- `score` of type `INTEGER`
- `subject` of type `TEXT`

Your task is to find the average score for the subject called 'math'. Rename the output column to `average_math_score` and round the result to the nearest integer.
