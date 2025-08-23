# UUID

Another way to generate a unique identifier in SQL is to use the UUID data type. It stands for "Universally Unique Identifier". It is a 16 byte value that is randomly generated and is guaranteed to be unique across all instances of a database, which is useful for distributed databases where global uniqueness is required.

This is what a UUID looks like: 550e8400-e29b-41d4-a716-446655440000.

```sql
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT
);
```

In the above example, the `id` column is of type UUID and is set to be the primary key of the table. The `DEFAULT` value is set to be a randomly generated UUID using the `uuid_generate_v4()` function. There are many versions of the `uuid_generate` function, but `uuid_generate_v4()` is the most common and easiest to use.

## Challenge

Try to run the code on the right just to see what the randomly generated UUIDs look like. Each time you run the code, you should see a different UUID.

After you've seen what the UUIDs look like, remove the `INSERT` statement so you can proceed to the next step.
