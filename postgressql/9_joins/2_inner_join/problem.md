# Inner Join

The `INNER JOIN` clause is used to combine rows from tables based on matching values in a specified column. By default, it will only return rows where there is a match, so we don't need to specify any additional conditions in the `WHERE` clause.

Using the same `users` and `orders` tables from the previous lesson:
```
user_id 	name
1 	John
2 	Jane
```
```
order_id 	user_id 	total_price
1 	1 	100.00
2 	2 	200.00
```

We can use an `INNER JOIN` to combine these tables based on the `user_id` column.

```sql
SELECT *
FROM users
INNER JOIN orders ON users.user_id = orders.user_id;
```

The `INNER JOIN orders` part combines the `users` and `orders` tables, and the `ON users.user_id = orders.user_id` part specifies that we only want to include rows where the `user_id` column from each table matches.

This will return a table with the following columns:
```
user_id 	name 	order_id 	total_price
1 	John 	1 	100.00
2 	Jane 	2 	200.00
```

In PostgreSQL and most other SQL databases, the `INNER JOIN` clause is equivalent to the `JOIN` clause.

# Challenge

You are given a `students` table with the following columns:

    `id` of type `INTEGER` (student id)
    `name` of type `TEXT`

And a `course_registrations` table with the following columns:

    `id` of type `INTEGER` (course registration id)
    `student_id` of type `INTEGER` (student id)
    `course_name` of type `TEXT`

Your task is to return the name of each student, along with all of the course names they are registered for. Order the results by the student name in ascending order.
