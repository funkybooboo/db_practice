-- Select employees whose salary is above the average salary in their own office
-- For each employee (e1), compare their salary to the average salary in their office (e2)
-- If their salary is greater than the average of their office, include them in the result
SELECT
	*
FROM
	sql_hr.employees e1
WHERE
	salary > (
		SELECT
			AVG(salary)
		FROM
			sql_hr.employees e2
		WHERE
			e1.office_id = e2.office_id  -- Match the office of the current employee
	);

-- Select invoices that are greater than the average invoice total for the same client
-- For each invoice (i1), calculate the average invoice total for that client (i2)
-- Return the invoice if its total is greater than the client's average
SELECT
	*
FROM
	sql_invoicing.invoices i1
WHERE
	i1.invoice_total > (
		SELECT
			AVG(i2.invoice_total)
		FROM
			sql_invoicing.invoices i2
		WHERE
			i1.client_id = i2.client_id  -- Match the client of the current invoice
	);
