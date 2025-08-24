# Aggregation Group By Distinct

You may have noticed that the `GROUP BY` clause is similar to the `DISTINCT` keyword, since it also removes duplicate values for specified columns.

```sql
SELECT distinct author
FROM books;

SELECT author
FROM books
GROUP BY author;
```

Both of the above queries will return the same result: a distinct list of authors within the `books` table. Notice that we don't need to use the `DISTINCT` keyword in the second query, nor do we use any aggregate functions. Both are valid ways to deduplicate a list of values.

Remember, `GROUP BY` groups together rows that have the same values for the specified column(s).

In some cases, using `GROUP BY` can be more efficient than using `DISTINCT`. This is not a blanket statement that `GROUP BY` is always faster than `DISTINCT`, but it is good to keep in mind that there are multiple ways to achieve the same result.

# Challenge

You are given a table called `products` with the following columns:

- `product_id` of type INTEGER
- `product_name` of type TEXT
- `store_name` of type TEXT

You task is to return all distinct combinations of `product_name` and `store_name` from the `products` table.

The result should be sorted by `product_name` and `store_name` in ascending order.
