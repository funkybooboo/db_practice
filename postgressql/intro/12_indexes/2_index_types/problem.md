# Index Types

There are different types of indexes in PostgreSQL, each with its own characteristics and use cases. A couple common types are B-Tree and Hash indexes.

**B-Tree Index:**

    The most common type of index, suitable for most data types.
    Useful for range queries and equality checks.

    A range query filters data within a certain range, for example finding all users with an age between 20 and 30. 

**Hash Index:**

    Uses a hash function to quickly locate data.
    Efficient for equality checks on small data types.

B-Trees are similar to Binary Search Trees, so they can perform lookups in O(h)O(h) time and also perform range queries.

Hash indexes are similar to hash tables, so they can perform lookups in O(1)O(1) time.

    A lookup is when you are searching for a specific value in a table, for example finding all users with an age of 20. 

In theory, hash indexes are faster than B-Trees for lookups, but in most cases B-Trees perform about the same for lookups, and better for range queries.

This is why B-Trees are the default index type in PostgreSQL. The following will both create a B-Tree index on the name column.

```sql
CREATE INDEX idx_name ON pokemon (name); -- btree by default

CREATE INDEX idx_name ON pokemon USING btree (name);
```

We can create a hash index on the name column like this:

```sql
CREATE INDEX idx_name ON pokemon USING hash (name);
```

# Challenge

You are given a table users with the following columns:

    id of type INTEGER
    name of type TEXT
    email of type TEXT

Create a hash index on the email column of this table called so we can quickly find users by their email. You can name it email_idx.
