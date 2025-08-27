# Subqueries in WHERE clause

SQL supports subqueries which are queries within a query.

For example, if we want to return all employees who have a salary greater than the average salary, we can use the following query:

```sql
SELECT *
FROM employees
WHERE salary > (
  SELECT AVG(salary) FROM employees
);
```

In the above example, the subquery (SELECT AVG(salary) FROM employees) is used in the WHERE clause to return the average salary of all employees.

We use parentheses to group the subquery. Since the subquery is executed first and it returns a single value, we can then compare the salary of each employee to this value.

We could also perform multiple subqueries in the WHERE clause.

```sql
SELECT *
FROM employees
WHERE salary IN (
  (SELECT MIN(salary) FROM employees),
  (SELECT MAX(salary) FROM employees)
);
```

In the above example, we have two subqueries, one which returns the minimum salary and one which returns the maximum salary.

We use the IN operator to compare the salary of each employee to the salaries returned by the subqueries.

The above query returns all employees who have a salary that is either the minimum salary or the maximum salary.

# Challenge

You are given a table of sports which contains the following columns:

    id - of type INTEGER
    name - of type TEXT
    total_viewers - of type INTEGER

Your task is to return sports that have less than the average number of viewers among all sports.

Return the name of each sport, along with the total_viewers of each sport.

Order the results by the number of viewers in descending order.
