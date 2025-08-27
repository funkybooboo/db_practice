# Subqueries in FROM clause

We can use subqueries in the FROM clause.

Using a subquery in the FROM clause is like creating a temporary table that you can use in your query.

We can get all employees with a salary above the average salary in the finance department like this:

```sql
SELECT e.name, e.salary
FROM employees e
JOIN (
  SELECT AVG(salary) AS avg_salary 
  FROM employees 
  WHERE department = 'Finance'
) AS avg
ON e.salary > avg.avg_salary;
```

In the above example, the subquery returns the average salary for the finance department. We rename this temporary table to avg.

Then we join the employees table with the temporary table on the salary of each employee and the average salary.

The join may look like this:

| name  | salary | avg_salary |
|-------|--------|------------|
| Alice | 50000  | 55000      |
| Bob   | 60000  | 55000      |

And after the ON e.salary > avg.avg_salary condition, we get:

| name  | salary | avg_salary |
|-------|--------|------------|
| Bob   | 60000  | 55000      |

# Challenge

You are given a table of employees which contains the following columns:

    id - of type INTEGER
    name - of type TEXT
    salary - of type INTEGER
    department - of type TEXT

Your task is to return all employees in the marketing department who have a salary below the average salary of the marketing department.

Return the name and salary of the employees, in ascending order by the salary.
