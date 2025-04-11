USE sql_invoicing;

-- Summarize total invoice sales per state and city since July 1, 2019
SELECT 
    state,                             -- State where the client is located
    city,                              -- City where the client is located
    SUM(invoice_total) AS total_sales  -- Total sales amount for each city
FROM
    invoices i
JOIN clients c USING (client_id)       -- Join to get client location info
WHERE
    invoice_date >= '2019-07-01'       -- Only include invoices from July 1, 2019 onwards
GROUP BY
    state, city                        -- Group results by location
ORDER BY
    total_sales DESC;                  -- Show highest sales locations first


-- Show total payments per day and payment method
SELECT
    p.date,                            -- Payment date
    pm.name AS payment_method,         -- Name of the payment method (e.g., Cash, Credit Card)
    SUM(p.amount) AS total_payments    -- Total payment amount for that method on that date
FROM
    payments p
JOIN payment_methods pm ON 
    p.payment_method = pm.payment_method_id  -- Join to get payment method names
GROUP BY
    p.date, p.payment_method           -- Group by both date and payment method
ORDER BY
    p.date;                            -- Sort chronologically by payment date
