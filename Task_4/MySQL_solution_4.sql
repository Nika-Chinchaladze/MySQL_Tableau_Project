/*
Create an SQL stored procedure that will allow you to obtain the average male and female salary per department 
within a certain salary range. Let this range be defined by two values the user can insert when calling the procedure.
*/

USE mysql_tableau;
DROP PROCEDURE IF EXISTS p_task_4;
DELIMITER $$
CREATE PROCEDURE p_task_4(IN start_point FLOAT, IN end_point FLOAT)
BEGIN
	SELECT 
		e.gender,
		d.dept_name,
		ROUND(AVG(s.salary), 2) AS average_salary
	FROM t_employees e
		INNER JOIN t_salaries s ON s.emp_no = e.emp_no
		INNER JOIN t_dept_emp m ON m.emp_no = e.emp_no
		INNER JOIN t_departments d ON d.dept_no = m.dept_no
	WHERE s.salary BETWEEN start_point AND end_point
	GROUP BY e.gender, d.dept_name
	ORDER BY d.dept_no ASC,
			 e.gender ASC,
			 average_salary ASC;
END$$
DELIMITER ;

CALL p_task_4(50000, 90000);
