# Aggregation Count

If we have a table that stores information about likes on tweets, it might look like this:

| tweet_id | liked_by_id |
|----------|-------------|
| 1        | 2           |
| 1        | 3           |
| 1        | 2           |
| 3        | 1           |
| 4        | 2           |

What if we want to count the number of likes for the tweet with id 1? We can use the `COUNT` function to do this.

```sql
SELECT COUNT(*)
FROM likes
WHERE tweet_id = 1;
```

The `COUNT` function counts all rows that match the condition, including duplicates. In this case, the output would be 3.

When we use `COUNT(*)`, it also includes rows that have a `NULL` value.

What if our table has duplicate 'likes', meaning that one user liked the same tweet multiple times? In that case, we can use the `DISTINCT` keyword to count the number of unique likes.

```sql
SELECT COUNT(DISTINCT liked_by_id)
FROM likes
WHERE tweet_id = 1;
```

The above query reads all rows where the `tweet_id` is 1, and then uses the `COUNT` function to aggregate the total number of unique `liked_by_id` values. The output for this example would be 2.

By using `COUNT()` on a column rather than `*`, we are ignoring rows that have a `NULL` value in that column.

We can also count distinct combinations of columns:

```sql
SELECT COUNT(DISTINCT tweet_id, liked_by_id)
FROM likes;
```

This query counts the number of unique combinations of `tweet_id` and `liked_by_id`.

## Challenge

You are given a table called `books` with the following columns:

- `id` of type `INTEGER`
- `title` of type `TEXT`
- `author` of type `TEXT`

Your task is to write a query that counts the number of unique authors in the `books` table, where the length of the `author` column is less than 12 characters. Rename the output column to `unique_authors`.

Hint: Use the `LENGTH()` function to get the length of the `author` column. You will need to use it within the `WHERE` clause.
