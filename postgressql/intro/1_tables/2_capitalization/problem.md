# Capitalization in SQL

In SQL, keywords are not case-sensitive. This means that you can write SQL keywords in uppercase, lowercase, or a mix of both. For example, the following statements are equivalent:

```sql
CREATE TABLE users ();

create table users ();

cReAtE taBlE users ();
```

The same is true for table and column names. For example, the following statements are equivalent:

```sql
CREATE TABLE users (
    name TEXT
);

CREATE TABLE USERS (
    NAME TEXT
);
```

Generally, SQL keywords are written in uppercase, and table and column names are written in lowercase. This is a common convention that makes SQL code easier to read.

## Challenge

The SQL statement in the editor is currently broken. It's missing a few keywords. Fix it so that it creates the table `users` with a column called `name` of type `TEXT`.
