/*
Query should return average salary through gender, through each department and through each year less than 2002
*/

USE mysql_tableau;
SELECT
	e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(m.from_date) AS calendar_year
FROM t_employees e
	INNER JOIN t_salaries s ON s.emp_no = e.emp_no
    INNER JOIN t_dept_emp m ON m.emp_no = e.emp_no
    INNER JOIN t_departments d ON d.dept_no = m.dept_no
WHERE YEAR(m.from_date) <= 2002
GROUP BY e.gender, d.dept_name, YEAR(m.from_date)
ORDER BY d.dept_no ASC,
		 e.gender ASC,
         calendar_year ASC;