# Read Indexes

You can view the indexes on a table by querying the pg_indexes view.

For example, the following query will return all indexes on the employees table:

```sql
SELECT *
FROM pg_indexes 
WHERE tablename = 'employees';
```

By default, every table with a primary key will have a index created on it when the table is created.

We can create additional indexes ourselves after the table is created. If a lot of data is already inserted into the table, the index creation may take time, for example, seconds, minutes, or even hours.

Imagine we have a table with billions of rows. To create a very large B-tree or Hash index, it will take time & resources so keep that in mind.

    While indexes speed up read queries, they slow down write queries. This is because every time a write query is executed, the index must be updated to reflect the new data. If we have multiple indexes on a table, the write query will be slower. This is a trade-off to consider when designing databases. 

# Challenge

You are given a table pokemon with a primary key on the id column.

Read all the indexes on the pokemon table.
