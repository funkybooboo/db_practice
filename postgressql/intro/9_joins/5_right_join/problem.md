# Right Join

We can use a `RIGHT JOIN` to join two tables, similar to a `LEFT JOIN`. The result will include all rows from the right table, and the matching rows from the left table. If there is no match, the result will include `NULL` for the columns from the left table.

That means it's equivalent to a `LEFT JOIN` with the order of the tables swapped.

For example, the following `LEFT JOIN`:
```sql
SELECT u.name, e.company_name, e.job_title
FROM users u
LEFT JOIN employment_records e ON u.id = e.employee_id
```

is equivalent to the following `RIGHT JOIN`:
```sql
SELECT e.company_name, e.job_title, u.name
FROM employment_records e
RIGHT JOIN users u ON e.employee_id = u.id
```

# Challenge

You are given a table called `pokemon` with the following columns:

    `id` of type `INTEGER`
    `name` of type `TEXT`
    `type_id` of type `INTEGER`

And a table called `pokemon_types` with the following columns:

    `id` of type `INTEGER`
    `name` of type `TEXT`
    `weakness` of type `TEXT`

Your task is to return all the following columns in the given order: pokemon types, pokemon names, and the weaknesses of the pokemon types. If a pokemon type does not have any pokemon, the result should contain `NULL` for the pokemon name column.

Rename the type's `name` to `type` and the pokemon's `name` to `pokemon` to avoid column name conflicts.

Order the results by the `type` column.

    Try to solve this problem using a `RIGHT JOIN`.
