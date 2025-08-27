# Many-to-Many Relationships

Many-to-many relationships are also very common in databases. A single row in one table can be associated with multiple rows in another table, and vice versa.

For example:

    A row in the students table can be related to multiple rows in the classes table, and a row in the classes table can be related to multiple rows in the students table.

To implement a many-to-many relationship, we need to create an intermediate table that stores the relationship between the two tables. This intermediate table will have two foreign keys, one from each table.

```sql
CREATE TABLE students (
  id INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE classes (
  id INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE student_classes (
  student_id INTEGER REFERENCES students(id),
  class_id INTEGER REFERENCES classes(id)
);
```

Here is some sample data illustrating the relationship between the tables:

**Students**

| id | name    |
|----|---------|
| 1  | Alice   |
| 2  | Bob     |
| 3  | Charlie |

**Classes**

| id | name    |
|----|---------|
| 1  | Math    |
| 2  | Science |

**Student Classes**

| student_id | class_id |
|------------|----------|
| 1          | 1        |
| 1          | 2        |
| 2          | 1        |
| 3          | 2        |

    Alice is enrolled in both Math and Science classes.
    Bob is enrolled in the Math class.
    Charlie is enrolled in the Science class.

# Challenge

Create a table called customers with the following columns:

    id of type INTEGER as the primary key
    name of type TEXT

Create a table called products with the following columns:

    id of type INTEGER as the primary key
    name of type TEXT
    price of type INTEGER

Create a table called orders with the following columns:

    id of type INTEGER as the primary key
    customer_id of type INTEGER as the foreign key
    product_id of type INTEGER as the foreign key
    order_date of type TIMESTAMP

The orders table will store the many-to-many relationship between the customers and products tables.

    Note: This assumes that each order is for a single product.
