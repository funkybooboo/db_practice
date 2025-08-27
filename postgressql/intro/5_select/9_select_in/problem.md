# Select In

We can use the `IN` operator to filter rows based on a list of values.

```sql
SELECT *
FROM cities
WHERE name IN ('New York', 'London', 'Paris');
```

The above query will return all rows where the `name` column is either New York, London, or Paris. We use the parentheses to specify the list of values.

## Challenge

You are given a table called `cities`. Return only the names of the cities that are in the following countries: USA, Canada, and Mexico.
