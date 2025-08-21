# Table Rows

Tables in a relational database store data in rows. Each row represents a single record in the table. Below is an example of a table called `users`:

| name    | age | join_date   |
|---------|-----|-------------|
| Alice   | 25  | 2024-01-01  |
| Bob     | 30  | 2024-02-01  |
| Charlie | 35  | 2024-03-01  |

In this example, the table has three rows, each representing a user. The columns are `name`, `age`, and `join_date`.

Columns have a data type that defines the kind of data they can store. For example, the column `age` is of type `INTEGER`, and the column `join_date` is of type `DATE`.

By default, columns of a table are ordered the same as the order in the `CREATE TABLE` statement.

# Challenge

Create a table called `cities` with the following columns:

- `name` of type `TEXT`
- `population` of type `INTEGER`
- `country` of type `TEXT`
- `is_capital` of type `BOOLEAN`
- `founded_date` of type `DATE`

Note: The test code will insert some rows into the table to test your schema. Make sure to create the table with the correct columns and data types.
