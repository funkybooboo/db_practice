# Aggregation Group By Multiple

We can also use `GROUP BY` with a combination of multiple columns.

If we have a table called `grades` which stores the grades of students in a class, it might look like this:
```
student_id 	course_name 	semester 	grade
1 	Math 	2023-Fall 	85
1 	Science 	2023-Fall 	90
1 	Math 	2024-Spring 	88
1 	Science 	2024-Spring 	92
2 	Math 	2023-Fall 	78
2 	Science 	2023-Fall 	85
2 	Math 	2024-Spring 	80
```

If we want to get the average grade for each course by semester, we must use `GROUP BY` with the `course_name` and `semester` columns.

```sql
SELECT course_name, semester, AVG(grade)
FROM grades
GROUP BY course_name, semester;
```

The output will be something like this:
```
course_name 	semester 	AVG(grade)
Math 	2023-Fall 	81.5
Science 	2023-Fall 	87.5
Math 	2024-Spring 	84.0
Science 	2024-Spring 	92.0
```

By using `GROUP BY` on multiple columns, we group together rows that have the same values for the specified columns. It works similarly to using `DISTINCT` on multiple columns, but `GROUP BY` can also be used with aggregate functions.

- Unlike the `ORDER BY` clause, the `GROUP BY` doesn't consider the order of the columns. With `ORDER BY`, the first column takes the highest priority, and the second column takes the second highest priority, etc.

# Challenge

You are given a table called `olympic_medals` with the following columns:

- `country` of type TEXT
- `year` of type INTEGER
- `category` of type TEXT
- `gold` of type INTEGER (number of gold medals won)
- `silver` of type INTEGER (number of silver medals won)
- `bronze` of type INTEGER (number of bronze medals won)

Your task is to write a query that groups that counts the total number of medals won by each country in each year. Your query should return three columns in this order: `country`, `year`, and `total_medals`.

The `total_medals` column should be the sum of all the medals won by the country in that year.

The results should be sorted in ascending order by the `year` and then by the `country` columns, in that order.

Hint: You can pass in multiple columns into an aggregation function. For example, `SUM(col1 + col2)` is equivalent to `SUM(col1) + SUM(col2)`.
