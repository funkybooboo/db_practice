# Full Join

A `FULL JOIN` is like a combination of a `LEFT JOIN` and a `RIGHT JOIN`. It all rows from both tables, matching rows where possible and filling in with `NULLs` where there's no match.

If we have two tables `employees` and `departments`:
```
id 	name 	department_id
1 	Alice 	10
2 	Bob 	20
3 	Charlie 	30
4 	David 	30
5 	Eve 	20
```
```
id 	name
10 	HR
20 	Engineering
40 	Marketing
```

A `FULL JOIN` of these tables would return all employees and all departments, including those without a department or those without employees.

```sql
SELECT e.name as employee_name, d.name as department_name
FROM employees e
FULL JOIN departments d ON e.department_id = d.id;
```

```
employee_name 	department_name
Alice 	HR
Bob 	Engineering
Charlie 	NULL
David 	NULL
NULL 	Marketing
Eve 	Engineering
```

    Since both David and Charlie do not have a valid `department_id`, the result will contain `NULL` for the `department_name` column.
    Since there are no employees in the Marketing department, the result will contain `NULL` for the `employee_name` column.

    If we had a `FOREIGN KEY` constraint on the `department_id` column in the `employees` table, it would not be possible.

# Challenge

You are given a table `pokemon` with the following columns:

    `id` of type `INTEGER`
    `name` of type `TEXT`
    `type_id` of type `INTEGER`

And a table `pokemon_types` with the following columns:

    `id` of type `INTEGER`
    `name` of type `TEXT`
    `weakness` of type `TEXT`

Your task is to return all pokemon types, pokemon names, and the weaknesses of the pokemon types. If a pokemon type does not have any pokemon, the result should contain `NULL` for the pokemon name column. If a pokemon does not have a valid type, the result should contain `NULL` for the pokemon type column and `NULL` for the pokemon weakness column.

Rename the type's `name` to `type` and the pokemon's `name` to `pokemon` to avoid column name conflicts.

Order the results by the `type` column.
