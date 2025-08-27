# One to Many

One-to-many relationships are a more common type of relationship in databases. A single row in one table can be associated with multiple rows in another table.

For example:

    A row in the countries table can be related to multiple rows in the cities table.
    A row in the users table can be related to multiple rows in the posts table.
    A row in the customers table can be related to multiple rows in the orders table.

The good news is that this relationship can be implemented similarly to a one-to-one relationship.

```sql
CREATE TABLE countries (
  id INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE cities (
  id INTEGER PRIMARY KEY,
  name TEXT,
  country_id INTEGER REFERENCES countries(id)
);
```

The main difference is that we dropped the UNIQUE constraint on the country_id column, which is the foreign key. This means that a single row in the countries table can be related to multiple rows in the cities table.

# Challenge

Create a table called customers with the following columns:

    id of type INTEGER as the primary key
    name of type TEXT

Create a table called orders with the following columns:

    id of type INTEGER as the primary key
    customer_id of type INTEGER as the foreign key
    price of type INTEGER

Ensure there is a one-to-many relationship between the customers and orders tables.
