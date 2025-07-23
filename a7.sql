



DESC department;

DESC employee;

DESC job;

DESC location;

DESC national;

DESC sal_grade;



SELECT 
		 a.emp_id
	  , a.emp_name
	  , a.dept_code
	  , b.dept_title
  FROM employee AS a
  left JOIN department AS b ON a.DEPT_CODE = b.dept_id
  ORDER BY dept_code asc;
  


SELECT 
		 a.emp_id
	  , a.emp_name
	  , a.dept_code
	  , b.dept_title
  FROM employee AS a
  RIGHT JOIN department AS b ON a.DEPT_CODE = b.dept_id
  ORDER BY dept_code asc;
  
  
SELECT 
		 a.emp_id
	  , a.emp_name
	  , a.dept_code
	  , b.dept_title
  FROM employee AS a
  CROSS JOIN department AS b 
  ORDER BY dept_code asc;  


SELECT 
		 a.emp_id
	  , a.emp_name
	  , a.dept_code
	  , b.dept_title
  FROM employee AS a
  JOIN department AS b ON a.DEPT_CODE = b.dept_id
 ORDER BY dept_code asc;
 
 SELECT 
		 a.emp_id
	  , a.emp_name
	  , a.dept_code
	  , b.dept_title
  FROM employee AS a
  JOIN department AS b ON a.DEPT_CODE = b.dept_id
 ORDER BY dept_code asc;
  