-- Use the sql_hr database for this query
USE sql_hr;

-- Get each employee and the name of their manager
-- This is a self-join on the employees table:
-- - 'e' represents the employee
-- - 'm' represents the manager (who is also an employee)
SELECT
	e.employee_id,
	e.first_name AS employee,
	m.first_name AS manager
FROM
	employees e
JOIN employees m ON
	e.reports_to = m.employee_id;

