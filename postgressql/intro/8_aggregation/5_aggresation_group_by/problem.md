# Aggregation Group By

If we have a table of books, we could get the number of books for a specific author like this:

```sql
SELECT COUNT(*)
FROM books
WHERE author = 'John Doe';
```

But what if we want to get the number of books for every author? We can use the `GROUP BY` clause to do this.

```sql
SELECT author, COUNT(*)
FROM books
GROUP BY author;
```

The above query reads all rows from the `books` table, groups them by the `author` column. This means there will be one row for each author in the result set. In the result, we get the `author` column and the `COUNT(*)` column, which represents the number of books for that author.

For example, if we had the following books in the `books` table:
```
id 	title 	author
1 	"Book 1" 	"Alice"
2 	"Book 2" 	"Bob"
3 	"Book 3" 	"Alice"
4 	"Book 4" 	"Bob"
5 	"Book 5" 	"Alice"
```

The result of the query would be:
```
author 	COUNT(*)
Alice 	3
Bob 	2
```

We can also use other aggregate functions like `SUM`, `AVG`, `MIN`, and `MAX` with the `GROUP BY` clause.

- The `GROUP BY` clause typically goes after the `WHERE` clause and before the `ORDER BY` clause.

# Challenge

You are given a table called `olympic_medals` with the following columns:

- `country` of type TEXT
- `athlete_name` of type TEXT
- `gold` of type INTEGER (number of gold medals won)
- `silver` of type INTEGER (number of silver medals won)
- `bronze` of type INTEGER (number of bronze medals won)

Your task is to write a query that groups the medals by country and sums the number of gold, silver, and bronze medals for each country. Rename the output columns to `gold_medals`, `silver_medals`, and `bronze_medals`.
