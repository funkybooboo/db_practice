# Aggregation Sum

If we have a table that stores the products within a customer's cart, it might look like this:

| product_id | customer_id | price |
|------------|-------------|-------|
| 1          | 1           | 70    |
| 2          | 1           | 20    |
| 3          | 1           | 30    |
| 2          | 2           | 20    |
| 3          | 2           | 30    |

What if we want to find the total price of all the products in the cart for a given customer? We can use the `SUM` function to do this.

```sql
SELECT SUM(price) as total_price
FROM cart
WHERE customer_id = 1;
```

The above query reads all rows where the `customer_id` is 1, and then uses the `SUM` function to aggregate the total price of all the products in the customer's cart. The output for this example would be 120.

If the table has an additional column that stores the quantity of each product, then we can pass the product of the price and quantity to the `SUM` function as shown below:

| product_id | customer_id | price | quantity |
|------------|-------------|-------|----------|
| 1          | 1           | 70    | 1        |
| 2          | 1           | 20    | 4        |
| 3          | 1           | 30    | 3        |
| 2          | 2           | 20    | 4        |
| 3          | 2           | 30    | 3        |

```sql
SELECT SUM(price * quantity) as total_price
FROM cart
WHERE customer_id = 1;
```

The output for this example would be 240.

Functions are case-insensitive, so `sum` and `SUM` are equivalent.

## Challenge

You are given a table called `products` with the following columns:

- `id` of type `INTEGER`
- `name` of type `TEXT`
- `price` of type `INTEGER`

Your task is to compute the total price of all discount items. A product is considered a discount item if its price is less than or equal to 10. Please also rename the output column to `total_discount_price`.

It's good practice to always rename the output column when using aggregation functions. Without an alias, the column will be named `sum`. This can lead to naming conflicts if we are using multiple aggregation functions in the same query.
