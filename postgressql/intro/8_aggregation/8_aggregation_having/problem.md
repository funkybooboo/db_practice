# Aggregation Having

Consider we have a table of `book_sales` that looks like this:
```
book_id 	book_name 	copies_sold 	month
1 	"Harry Potter" 	100 	"January"
2 	"Percy Jackson" 	150 	"January"
1 	"Harry Potter" 	200 	"February"
2 	"Percy Jackson" 	50 	"February"
1 	"Harry Potter" 	250 	"March"
2 	"Percy Jackson" 	150 	"March"
```

What if we want to return only the books that have sold more than 500 copies in total? Of course, we could use an aggregation to get the total copies sold for each book, but how do we filter for books that have sold more than 500 copies in total? The `WHERE` clause won't work since it runs before the aggregation.

We can use the convenient `HAVING` clause to filter for books that have sold more than 500 copies in total.

```sql
SELECT book_name
FROM book_sales
GROUP BY book_name
HAVING SUM(copies_sold) > 500;
```

The `HAVING` clause is used to filter the results after an aggregation. It is used to filter the results of a `GROUP BY` clause.

The output of the above query will be:
```
book_name
Harry Potter
```

since "Harry Potter" has sold a total of 550 copies and "Percy Jackson" has sold a total of 350 copies.

# Challenge

You are given a table called `olympic_medals` with the following columns:

- `country` of type TEXT
- `year` of type INTEGER
- `total_medals` of type INTEGER

Your task is to return only the names of the countries that have won more than 100 medals in total, across all years.

The result should be sorted by the countries in descending order.
