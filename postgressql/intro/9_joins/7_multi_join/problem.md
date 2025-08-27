# Multi Join

We can also join more than two tables at once. In fact, this is very common in real-world applications.

Suppose we have three tables: `users`, `movies`, and `ratings`.
```
id 	name
1 	John
2 	Jane
```
```
id 	title
1 	The Matrix
2 	The Godfather
3 	The Dark Knight
```
```
id 	user_id 	movie_id 	rating
1 	1 	1 	4
2 	1 	2 	5
3 	2 	1 	3
4 	2 	3 	2
```

If we want to get the names of the users who have rated movies, and the corresponding movie titles and ratings, we can do multiple `JOINs`.

```sql
SELECT u.name, m.title, r.rating
FROM users u
JOIN ratings r ON u.id = r.user_id
JOIN movies m ON r.movie_id = m.id;
```

We first join the `users` table with the `ratings` table on the `user_id` column, then we join the resulting table with the `movies` table so we can include the movie titles in our results.

    Remember a normal `JOIN` is an `INNER JOIN`. It only returns the rows where there is a match.

This will return:
```
name 	title 	rating
John 	The Matrix 	4
John 	The Godfather 	5
Jane 	The Matrix 	3
Jane 	The Dark Knight 	2
```

# Challenge

You are given a table `players` with the following columns:

    `id` of type `INTEGER`
    `name` of type `TEXT`
    `team_id` of type `INTEGER`

You are also given a table `teams` with the following columns:

    `id` of type `INTEGER`
    `name` of type `TEXT`

And a table `contracts` with the following columns:

    `id` of type `INTEGER`
    `player_id` of type `INTEGER`
    `salary` of type `INTEGER`

Your task is to return the following columns in the order given:

    the player name renamed as `player_name`
    the team name renamed as `team_name`
    the salary of the player

Order the results by the salary in descending order.
