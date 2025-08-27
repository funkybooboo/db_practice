# Primary Key

A primary key is a special column within a table. It must be unique for each row and cannot contain a `NULL` value. In addition, there can only be one primary key in a table.

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER
);
```

In general, it's a good practice to have a primary key in every table. It helps to uniquely identify each row and can be used to establish relationships between tables. We usually use an `id` column as the primary key.

# Challenge

Create a table called `users` with the following columns:

- `id` of type `INTEGER` as the primary key
- `username` of type `TEXT`

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT
);
```

Create a table called `videos` with the following columns:

- `id` of type `INTEGER` as the primary key
- `title` of type `TEXT`
- `owner_id` of type `INTEGER`

# What's the difference between a Primary Key & combining the NOT NULL and UNIQUE constraints?

A primary key is a column or a group of columns that uniquely identifies each row in a table. It is a combination of the `NOT NULL` and `UNIQUE` constraints, but with additional properties. There can only be one primary key in a table. Primary keys can also be made up of multiple columns, known as a composite key. Databases also create an index on the primary key column(s) to speed up queries.
