/*
Query should return information about male and female employees quantity through each year from 1990 to 2002
*/

USE mysql_tableau;
SELECT 
	YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS Quantity
FROM t_employees e
	INNER JOIN t_dept_emp d ON d.emp_no = e.emp_no
WHERE YEAR(d.from_date) >= 1990 
  AND YEAR(d.from_date) <= 2002
GROUP BY e.gender, YEAR(d.from_date)
ORDER BY calendar_year ASC,
         e.gender ASC;
	