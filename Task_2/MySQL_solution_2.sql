/*
Query should return active status of female and male employees through year from 1990 and through each department
*/
USE mysql_tableau;
SELECT
	d.dept_name,
    e.gender,
    m.emp_no,
    m.from_date,
    m.to_date,
    a.calendar_year,
    CASE
		WHEN YEAR(m.to_date) >= a.calendar_year AND YEAR(m.from_date) <= a.calendar_year THEN 1
        ELSE 0
	END AS Active_Status
FROM (
	SELECT 
		YEAR(hire_date) AS calendar_year
    FROM t_employees
    GROUP BY calendar_year
) a
	CROSS JOIN t_dept_manager m
    INNER JOIN t_departments d ON d.dept_no = m.dept_no
    INNER JOIN t_employees e ON e.emp_no = m.emp_no
ORDER BY m.emp_no ASC,
		 a.calendar_year ASC;