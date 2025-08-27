# Join Basics

We can combine rows from two tables using a JOIN.

Suppose we have two tables `users` and `orders`:
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

We can combine these tables using a `CROSS JOIN`.

```sql
SELECT *
FROM users
CROSS JOIN orders;
```

In the `FROM` clause, we specify the `users` table and after that we use the `CROSS JOIN` clause to join the `orders` table.

    The `JOIN` keyword is commonly placed on a new line, but it is still part of the `FROM` clause.

This will create a new table by creating a cartesian product of the two tables. This means that each row from the `users` table will be combined with each row from the `orders` table, similar to how nested for-loops work.

The table may look like this:
```
user_id 	name 	order_id 	user_id 	total_price
1 	John 	1 	1 	100.00
1 	John 	2 	2 	200.00
2 	Jane 	1 	1 	100.00
2 	Jane 	2 	2 	200.00
```

Notice two things that we probably don't want:

    We have two `user_id` columns in the result.
    Each user is combined with every order.

We could select only one `user_id` column and add a `WHERE` clause to fix these issues, but there is a more idiomatic way to do this in SQL.

# Challenge

You are given two tables `users` and `orders` from the example above.

Your task is to write a query that will return the following table:
```
user_id 	name 	order_id 	total_price
1 	John 	1 	100.00
2 	Jane 	2 	200.00
```

This means you must select only one `user_id` column. You must also only select rows where the `users.user_id` column matches the `orders.user_id` column.

    Hint: When there are duplicate columns, you can specify which column you want using the table name. For example, `users.user_id` refers to the `user_id` column from the `users` table. The same applies within the `WHERE` clause.
