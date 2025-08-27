# Indexes

Databases use indexes to speed up data retrieval. An index is like a table of contents for data stored within each table in a database.

In PostgreSQL, you can create an index on a table using the CREATE INDEX statement.

```sql
CREATE INDEX name_idx ON users (name);
```

We use the CREATE INDEX statement, followed by the name of the new index we are creating name_idx. This index will be created on the name column of the users table.

    It's common to name an index after the column it is indexing, followed by '_idx' or '_index'. 

This means it will speed up queries that filter data based on the name column. For example, the following query will be faster because of the index:

```sql
SELECT * FROM users WHERE name = 'John';
```

Without an index, PostgreSQL would need to scan the entire users table to find rows where the name column is 'John'. This won't matter for small tables, but can speed up queries on large tables.

# Challenge

You are given a table pokemon with the following columns:

    id of type INTEGER
    name of type TEXT
    type_id of type INTEGER

Create an index called name_idx on the name column of this table.
