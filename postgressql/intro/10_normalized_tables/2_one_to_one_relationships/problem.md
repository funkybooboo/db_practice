# One-to-One Relationships

We discussed earlier that foreign keys are used to establish relationships between tables. There are three types of relationships:

    One-to-One
    One-to-Many
    Many-to-Many

Let's start with the first type: One-to-One.

As the name suggests, in a one-to-one relationship, a row in one table corresponds to exactly one row in another table, and vice versa.

For example, we may have two tables: users and user_details. Each user will have one user details row, and each user details row will correspond to one user.

We can establish a one-to-one relationship between the two tables by using the primary key of the users table as the foreign key in the user_details table.

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE user_details (
  id INTEGER PRIMARY KEY,
  user_id INTEGER UNIQUE REFERENCES users(id),
  address TEXT,
  birth_date DATE
);
```

In this example, the user_details table has a foreign key column called user_id, which references the id column in the users table. We guarantee that multiple user_details rows cannot have the same user_id since we added the UNIQUE constraint to the user_id column in the user_details table.

    Technically, this is a one-to-(zero or one) relationship, since not every user may have a user detail. But in most cases this is fine. We mainly want to enforce that a user has at most one user detail. 

# Challenge

Create a table called countries with the following columns:

    id of type INTEGER as the primary key
    name of type TEXT

Create a table called capitals with the following columns:

    id of type INTEGER as the primary key
    name of type TEXT
    country_id of type INTEGER as the foreign key

We also want to establish a one-to-one relationship between the countries and capitals tables.
