# Check Constraint

A check constraint is a rule that defines valid values for a column. It allows you to specify a condition that each row in a table must satisfy.

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    age INTEGER CHECK (age >= 18)
);
```

In the example above, we added a check constraint to the `age` column, which ensures that the value of the column is greater than or equal to 18. Check constraints are useful for ensuring data integrity and consistency in a database.

Another example of a check constraint is to ensure that a column only accepts values from a specific set.

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    status TEXT CHECK (status IN ('active', 'inactive'))
);
```

In this example, the `status` column can only have the values 'active' or 'inactive'.

# Challenge

Create a table called `products` with the following columns:

- `id` of type `INTEGER` as the primary key
- `name` of type `TEXT`
- `price` of type `INTEGER` with a check constraint that ensures the price is greater than or equal to 0
- `status` of type `TEXT` with a check constraint that ensures the status is either 'available' or 'out of stock'
