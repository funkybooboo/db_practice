# Select Logical Operators

We can combine multiple conditions using the `AND` and `OR` logical operators.

```sql
SELECT DISTINCT country
FROM cities
WHERE population >= 1000000 AND population <= 10000000;
```

The above query will return all distinct countries from the `cities` table where the population is between 1,000,000 and 10,000,000 inclusive.

We can also use parentheses to group multiple conditions.

```sql
SELECT name
FROM cities
WHERE (country = 'USA' OR country = 'Canada') AND population >= 1000000;
```

The above query will return all names from the `cities` table where the country is either USA or Canada and the population is greater than or equal to 1,000,000.

## Challenge

You are given a table called `cities`. Return all names from the `cities` table where the population is less than 1,000,000 or greater than 10,000,000, and the name of the city does not start with an uppercase C.
