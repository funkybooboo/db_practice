# CASE Expressions

Postgres provides a powerful conditional expression called CASE. It is similar to if-else statements in other programming languages.

Assume we have a table of employees which includes their salaries. We want to know which employees have a salary greater than 100000. We could determine this with a simple query:

```sql
SELECT name, salary
FROM employees
WHERE salary > 100000;
```

| name    | salary  |
|---------|---------|
| Alice   | 120000  |
| Charlie | 110000  |

But what if we want to return all employees, and have a separate column that shows whether their salary is greater than 100000? We can use the CASE expression to achieve this.

```sql
SELECT name,
       salary,
       CASE
           WHEN salary > 100000 THEN 'High Salary'
           ELSE 'Low Salary'
       END AS salary_level
FROM employees;
```

| name    | salary  | salary_level  |
|---------|---------|---------------|
| Alice   | 120000  | High Salary   |
| Bob     | 90000   | Low Salary    |
| Charlie | 110000  | High Salary   |

We use the CASE keyword to start the expression, and the END keyword to close it. The AS keyword is used to give the result a name.

Within the expression, we use the WHEN keyword to specify the condition, and the THEN keyword to specify the result. The ELSE keyword is used to specify the result if no condition is met.

# Challenge

You are given a table of employees with the following columns:

    id of type INTEGER
    name of type TEXT
    department of type TEXT
    salary of type INTEGER

Your task is to write a query that returns the name of all employees.

You should also add another column to the result named is_engineering which is yes if the employee is in the 'Engineering' department and no otherwise.

Order the results by the name column.
