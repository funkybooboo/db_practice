# Aggregation Min Max

We can use the `MIN()` and `MAX()` functions to find the minimum and maximum values in a column.

```sql
SELECT MIN(price) FROM products;

SELECT MAX(price) FROM products;
```

It's also possible to use multiple aggregate functions in the same query.

```sql
SELECT MIN(price), MAX(price), COUNT(price)
FROM products;
```

The above query will return the minimum, maximum, and count of non-null values in the `price` column.

For the following table:
```
id 	name 	price
1 	Product A 	100
2 	Product B 	NULL
3 	Product C 	300
```

The output of the previous query will be:
```
min(price) 	max(price) 	count(price)
100 	300 	2
```

# Challenge

You are given a table called `scores` with the following columns:

- `id` of type INTEGER
- `score` of type INTEGER
- `region` of type TEXT

Your task is to write a query that returns the minimum, maximum, and average score for the `score` column, where the `region` is `EU`. For the average, you should round the result to the nearest integer.

Rename the output columns to `min_score`, `max_score`, and `avg_score` respectively.

Hint: Use the `ROUND()` function to round the average score to the nearest integer. One function can be used within another function.
