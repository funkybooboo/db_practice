-- Find all products that are more expensive than the product with ID = 3 (which is Lettuce)
SELECT
	*
FROM
	sql_store.products
WHERE
	unit_price > (
		-- Get the unit price of the product with product_id = 3
		SELECT
			unit_price
		FROM
			sql_store.products
		WHERE
			product_id = 3
	);


-- In the sql_hr database:
-- Find all employees whose salary is greater than the average salary of all employees
SELECT
	*
FROM
	sql_hr.employees
WHERE salary > (
	-- Calculate the average salary across all employees
	SELECT 
		AVG(salary)
	FROM
		sql_hr.employees
);
