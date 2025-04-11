-- Get all employees along with their manager's name
-- Even employees who don't report to anyone (e.g. top-level managers) will be included
-- Those without a manager will have NULL in the "manager" column
SELECT
	e.employee_id,
	e.first_name,
	m.first_name AS manager
FROM
	sql_hr.employees e
LEFT JOIN sql_hr.employees m ON
	e.reports_to = m.employee_id;

