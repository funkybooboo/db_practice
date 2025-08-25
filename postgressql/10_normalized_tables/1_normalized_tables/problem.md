# Normalized Tables

Relational databases promote the idea of Normalization. This is a process of organizing data in a way that eliminates redundant data and ensures data is consistent.

For example, we may have data that looks like this:
```
user_id 	name 	product_id 	product_name 	order_id
1 	John 	1 	Laptop 	101
2 	Jane 	2 	Phone 	102
1 	John 	3 	Monitor 	103
2 	Jane 	3 	Monitor 	104
```

Notice that we are storing duplicate name values for users and duplicate product_name values for products. While this is convenient for small datasets, it can lead to issues when the dataset grows.

We can normalize this data by creating separate tables for each entity.
## Users Table
```
id 	name
1 	John
2 	Jane
```
## Products Table
```
id 	name
1 	Laptop
2 	Phone
3 	Monitor
```
## Orders Table
```
id 	user_id 	product_id
101 	1 	1
102 	2 	2
103 	1 	3
104 	2 	3
```

Each user and product only needs to be stored once. If we want to get the original table we started with, we can use a JOIN:

```sql
SELECT u.id as user_id, u.name as user_name, p.id as product_id, p.name as product_name, o.id as order_id
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN products p ON o.product_id = p.id;
```

# Challenge

Assume you have a denormalized dataset with this schema:

```sql
CREATE TABLE orders (
    user_id INTEGER,
    user_name TEXT,
    product_id INTEGER,
    product_name TEXT,
    order_id INTEGER
);
```

Your task is to create three different tables that normalize the table above:

    users table
    products table
    orders table

Ensure you create appropriate FOREIGN KEY constraints for the tables above.

You can drop the prefixes from the id and name columns in the new tables, e.g. user_id can just be id, and user_name can just be name.
