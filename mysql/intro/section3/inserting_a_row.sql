-- Use the `sql_store` database
USE sql_store;

-- Insert a new customer with all fields provided
-- Assumes the table structure is:
-- customers (customer_id, first_name, last_name, birth_date, phone, address, city, state, points)
INSERT INTO customers
VALUES (
    DEFAULT,          -- customer_id: auto-incremented
    'Nate',           -- first_name
    'Stott',          -- last_name
    '2001-11-14',     -- birth_date
    NULL,             -- phone (NULL indicates no phone provided)
    'my address',     -- address
    'my city',        -- city
    'PA',             -- state
    5000              -- points
);

-- Insert a new customer by specifying only selected columns
-- The unspecified columns (like customer_id, phone, and points) will use default values
INSERT INTO customers (
    last_name, 
    first_name, 
    birth_date, 
    address, 
    city, 
    state
)
VALUES (
    'Stott',
    'Nate',
    '2001-11-14',
    'my address',
    'my city',
    'PA'
);
