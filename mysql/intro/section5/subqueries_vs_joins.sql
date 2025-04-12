-- ========================================
-- Find clients who have never received an invoice
-- ========================================

-- Using Subquery:
-- Select clients whose client_id does NOT appear in the invoices table
SELECT
    *
FROM
    sql_invoicing.clients c
WHERE
    c.client_id NOT IN (
        SELECT DISTINCT
            i.client_id
        FROM
            sql_invoicing.invoices i
    );

-- Using LEFT JOIN:
-- Select clients that have no matching invoice (i.invoice_id will be NULL)
SELECT
    *
FROM
    sql_invoicing.clients c
LEFT JOIN sql_invoicing.invoices i
    USING (client_id)
WHERE
    i.invoice_id IS NULL;



-- ========================================
-- Find customers who have ordered lettuce (product_id = 3)
-- ========================================

-- Using Subquery:
-- Select customers whose orders contain an order item with product_id = 3
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM
    sql_store.customers c
WHERE
    c.customer_id IN (
        SELECT
            o.customer_id
        FROM
            sql_store.orders o
        WHERE
            o.order_id IN (
                SELECT
                    oi.order_id
                FROM
                    sql_store.order_items oi
                WHERE
                    oi.product_id = 3
            )
    );

-- Using JOIN:
-- Join through orders -> order_items -> products, and filter by product_id = 3
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM
    sql_store.customers c
JOIN sql_store.orders o
    USING (customer_id)
JOIN sql_store.order_items oi
    USING (order_id)
JOIN sql_store.products p
    USING (product_id)
WHERE
    p.product_id = 3;
