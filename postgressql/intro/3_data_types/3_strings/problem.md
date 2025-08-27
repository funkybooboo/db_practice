# Strings

There are several ways to store strings in PostgreSQL.

| type        | description                                                                 |
|-------------|-------------------------------------------------------------------------|
| CHAR(n)     | Fixed-length character string with a maximum length of n.                 |
| VARCHAR(n)  | Variable-length character string with a maximum length of n.               |
| TEXT        | Variable-length character string without a maximum length.                |

It's generally preferred to use TEXT for strings, as it can store a variable length of characters. The main reason to use VARCHAR(n) is if you know the maximum length of the string you're storing, which implicitly acts as a constraint on the length of the string.

It's not common to use CHAR(n) for strings, as it is less flexible and can lead to wasted space if the string is shorter than the maximum length. Regardless of the contents of the string, the database will reserve space for the maximum length, which can be inefficient compared to using VARCHAR(n) or TEXT.

```sql
CREATE TABLE users (
    name VARCHAR(255),
    email TEXT,
    country_code CHAR(2)
);

INSERT INTO users (name, email, country_code) VALUES
    ('John Doe', 'john.doe@example.com', 'US');
```

In the above example:

- `name` is a variable-length character string with a maximum length of 255 characters.
- `email` is a variable-length character string without a maximum length.
- `country_code` is a fixed-length character string with a maximum length of 2 characters.

# Challenge

Create a table called `operating_systems` with the following columns:

- `id` of type INTEGER as the primary key
- `name` of type VARCHAR(255)
- `version` of type CHAR(10)
- `market_share` of type NUMERIC(5, 2)
