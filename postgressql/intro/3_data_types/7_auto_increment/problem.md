# Auto Increment

It's often necessary to assign a unique identifier to each row in a table. Rather than manually assigning a unique value to each row, PostgreSQL provides a way to automatically generate one for each row by auto incrementing.

There are a few different ways to do this in PostgreSQL:

- `SERIAL`: This is a shorthand for creating an auto-incrementing integer column.
- `IDENTITY`: Introduced in PostgreSQL 10, this is the SQL standard way to create auto-incrementing columns.
- `SEQUENCES`: You can define your own sequence, and set the start value and increment value.

```sql
CREATE SEQUENCE example_id_seq START WITH 10 INCREMENT BY 10;

CREATE TABLE example (
    id_0 INTEGER PRIMARY KEY,
    id_1 SERIAL,
    id_2 INTEGER GENERATED ALWAYS AS IDENTITY,
    id_3 INTEGER DEFAULT nextval('example_id_seq')
);

INSERT INTO example (id_0)
  VALUES (1),
        (2),
        (3);

SELECT * FROM example;
```

Notice that we only inserted values into the `id_0` column. The other columns were automatically populated similar to `DEFAULT` values.

The following are the results of the above query:
```
id_0 	id_1 	id_2 	id_3
1 	1 	1 	10
2 	2 	2 	20
3 	3 	3 	30
```

- `SERIAL` is the most common method for creating auto-incrementing columns in PostgreSQL but may not be supported in other SQL databases.
- `IDENTITY` is the SQL standard way to create auto-incrementing columns. `GENERATED ALWAYS AS` means that the column is automatically generated based on the sequence and does not allow explicit insertion, unlike `SERIAL`.
- A `SEQUENCE` can be shared by multiple tables, which means that both tables will have a unique sequence of integers. For example, `table-a` may have 10, 30, 50 and `table-b` may have 20, 40, 60. They won't have any overlap.

To read more about the differences between `SERIAL` and `IDENTITY` see here.

# Challenge

Create a sequence called `gov_id` that starts at 1000 and increments by 3.

Create a table called `gov_employee` with the following columns:

- `id` of type INTEGER that uses the `IDENTITY` keyword to auto increment, and does not allow explicit insertion. It should also be the primary key of the table.
- `gov_id` of type INTEGER where the `DEFAULT` value is the next value from the `gov_id` sequence.
- `name` of type TEXT.
