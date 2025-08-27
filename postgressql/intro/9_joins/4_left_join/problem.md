# Left Join

We can use the `LEFT JOIN` clause to combine rows from two tables based on a condition, but unlike `INNER JOIN`, it will also include all rows from the left table, even if there is no matching row in the right table.

Suppose we have the following `users` and `employment_records` tables:
```
id 	name
1 	Alice
2 	Bob
3 	Charlie
4 	David
```
```
id 	employee_id 	company_name 	job_title
100 	1 	Google 	Software Engineer
300 	3 	Microsoft 	Data Scientist
500 	4 	Amazon 	Product Manager
```

Notice that Bob has an id of 2, which does not exist in the `employment_records` table.

If we perform an `INNER JOIN` on the `id` column, Bob will be excluded from the results.
```
name 	company_name 	job_title
Alice 	Google 	Software Engineer
Charlie 	Microsoft 	Data Scientist
David 	Amazon 	Product Manager
```

However, we can perform a `LEFT JOIN`:

```sql
SELECT u.name, e.company_name, e.job_title
FROM users u
LEFT JOIN employment_records e ON u.id = e.employee_id
ORDER BY e.company_name;
```

The output will be:
```
name 	company_name 	job_title
Alice 	Google 	Software Engineer
Bob 	NULL 	NULL
Charlie 	Microsoft 	Data Scientist
David 	Amazon 	Product Manager
```

Since Bob does not have an entry in the `employment_records` table, the `company_name` and `job_title` columns are filled with `NULL`.

    A `LEFT JOIN` will include all rows from the left table, even if there is no matching row in the right table.
    If there were rows in the `employment_records` table that did not have a matching row in the `users` table, they would not be included in the results.

# Challenge

You are given a `humans` table with the following columns:

    `id` of type `INTEGER`
    `name` of type `TEXT`

You are also given a `pets` table with the following columns:

    `id` of type `INTEGER`
    `owner_id` of type `INTEGER`
    `name` of type `TEXT`

Your task is to return the names of all humans along with their pet names. If a human does not have a pet, the pet name should be `NULL`.

Rename the `human.name` column to `human_name` and the `pet.name` column to `pet_name`, to avoid column name conflicts.

Order the results by the human's name and their pet name.
