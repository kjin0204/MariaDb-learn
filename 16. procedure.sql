-- procedure
-- 쿼리를 나열한 절차를 저장해서 쓰는 것.
-- 기능을 정의한 것.!

-- 프로시저 정의
-- delimiter  // -- 문장의 끝을(한 프로시저의 끝) "//"로 하겠다.
CREATE OR REPLACE PROCEDURE getAllEmployees()
BEGIN

SELECT
		 emp_id
	  , emp_name
	  , salary
  FROM employee ;



END //


SELECT case when salary > 200000 then '최저임금' 
				when salary > 400000 then '중간임금'
				ELSE '고임금근로자'
			END case
		FROM employee;
		
		
		
	-- 	SELECT 
-- 		  salary,
-- 		  case when salary > 200000 then '최저임금' 
-- 				when salary > 400000 then '중간임금'
-- 				ELSE '고임금근로자'
-- 			END case
-- 		FROM employee;
-- 


delimiter ; -- 문장의 끝을 다시 ";"로 돌려 놓겠다.



CALL getAllEmployees();


-- -------------------------------------------------------------------
-- in 매겨변수

delimiter //

CREATE OR REPLACE PROCEDURE getEmployeesByDepartment (
    IN dept CHAR(2)
)
BEGIN
		SELECT 
			    emp_id
			  , emp_name
			  , salary
			  , dept_code
		  FROM employee
		 WHERE dept_code = dept;
END //
delimiter ;


CALL getEmployeesByDepartment('D9');





-- -------------------------------------------------------------------
-- out 매겨변수
delimiter //
CREATE OR REPLACE PROCEDURE getEmplyeeSalary(
	IN id VARCHAR(3),
	OUT sal INTEGER
)
BEGIN
	SELECT 
		    salary INTO sal
	  FROM employee
	 WHERE emp_id = id;
END //

delimiter ;

SET @sal = 0;
CALL getEmplyeeSalary('210', @sal);
SELECT @sal;



-- -------------------------------------------------------------------
-- inout 매겨변수
delimiter //
CREATE OR REPLACE PROCEDURE updateAndReturnSalary(
	IN id VARCHAR(3),
	INOUT sal integer
)
BEGIN
	 UPDATE employee
	    SET salary = sal
	  WHERE emp_id = id;
	 
	 SELECT 
	 		  salary + (salary * IFNULL(bonus, 0)) INTo sal
	   FROM employee
	  WHERE emp_id = id;
	 
END //

delimiter ;

SET @sal = 19000000;
CALL updateAndReturnSalary('200', @sal);
SELECT @sal;



-- -------------------------------------------------------------------
-- if - else
delimiter //
CREATE OR REPLACE PROCEDURE checkEmployeeSalary (
	IN id VARCHAR(3),
	IN threshold INTEGER,
	OUT result VARCHAR(50)
)
BEGIN
	 DECLARE sal INTEGER;
	 
	 SELECT salary INTO sal
	   FROM employee
	  WHERE emp_id = id;
	  
	  if sal > threshold then
	  	SET result = '기준치를 넘는 급여입니다.';
	  else
	  	SET result = '기준치와 같거나 기준치 미만의 그여입니다.';
     END if;
	 
END //

delimiter ;

SET @result = '';
CALL checkEmployeeSalary(200, 3000000, @result);
SELECT @result;


-- -------------------------------------------------------------------
-- case 
delimiter //

CREATE OR REPLACE PROCEDURE getDepartmentMessage(
		IN id VARCHAR(3),
		OUT message VARCHAR(100)
)
BEGIN
		DECLARE dept VARCHAR(50);
		
		SELECT 
				 dept_code INTo dept
		  FROM employee
		 WHERE emp_id = id;
		 
		 
		 case 
		 		when dept = 'D1' then
		 				SET message = '인사관리부 직원이시군요!';
		 		when dept = 'D2' then
		 				SET message = '회계부 직원이시군요!';
		 		when dept = 'D3' then
		 				SET message = '마케팅부 직원이시군요!';
		 		ELSE 
		 				SET message = '어디 부서세요 ????????';
		 END case;
END //

delimiter ;

SET @message = '';
CALL getDepartmentMessage( 200,@message);
SELECT @message;



SELECT * FROM employee;