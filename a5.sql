


SELECT 
		 category_code
	  , COUNT(*)
  FROM tbl_menu
 GROUP BY category_code;
 
 
 
 
 
SELECT COUNT(category_code)
  FROM tbl_menu;

 
SELECT 
		 COUNT(*) AS '전체'
	  , COUNT(ref_category_code) AS 'null제외'
  FROM tbl_category;
  
 
 
 
SELECT 
	    category_code
	  , COUNT(*)
	  , menu_name
  FROM tbl_menu
 GROUP BY category_code;
 
 
 
SELECT
		 category_code 
	  , ROUND(AVG(menu_price),0)
  FROM tbl_menu
 GROUP BY category_code;
 
 
 SELECT 
 		  category_code
 	   , SUM(menu_price)
   FROM tbl_menu
  GROUP BY category_code
 HAVING SUM(menu_price) >= 20000;
 
 
 

-- 중간합계 
SELECT 
  		 SUM(menu_price) AS '합계'
	  , category_code AS '카테고리코드'
  FROM tbl_menu
 GROUP BY category_code
  WITH ROLLUP;
 
-- 두 개 이상의 컬럼으로도 그룹을 나눌 수 있고, rollup을 할 수도 있다.
SELECT
       SUM(menu_price)
     , menu_price
     , category_code
  FROM tbl_menu
 GROUP BY menu_price,category_code
  WITH ROLLUP;
  
  
  
  SELECT *
  FROM tbl_menu
  ORDER BY menu_price,category_code;
 
 
 
 
 
SELECT 									-- 5
       category_code
     , AVG(menu_price)
  FROM tbl_menu						-- 1
 WHERE menu_price > 10000			-- 2
 GROUP BY category_code				-- 3
HAVING AVG(menu_price) > 12000	-- 4
 ORDER BY 1 DESC; 					-- 6
 
 
 
 
 
 
SELECT 
		   menu_code
		 , menu_name
		 , menu_price
  FROM tbl_menu
 WHERE category_code = (SELECT DISTINCT 
															 category_code
												  FROM tbl_menu
												 WHERE menu_name = '민트미역국'
											 );
  
 
 
 
-- 단일행 다중열 서브쿼리
 
SELECT 
		 *
  FROM tbl_menu
 WHERE (menu_price, category_code) = (SELECT menu_price
 														 , category_code
 													 FROM tbl_menu
 													WHERE menu_name = '아이스가리비관자육수'
 												  );
 												  
 												  
SELECT 
		 *
  FROM tbl_menu a
 WHERE menu_name in (SELECT menu_name
 								FROM tbl_menu b
 								JOIN tbl_category c ON b.category_code = c.category_code
 							  WHERE category_name = '기타'
							);

 
 
 

SELECT 
		 category_code
	  , COUNT(*) AS 개수
  FROM tbl_menu
 GROUP BY category_code
 ORDER BY 개수 DESC
 LIMIT 1;
 
 
 

SELECT 
		 a.category_code
	  , max(a.개수)
  FROM (
			SELECT 
					 category_code
				  , COUNT(*) AS 개수
			  FROM tbl_menu
			 GROUP BY category_code
		  ) a
 GROUP BY category_code;



USE mysql;


CREATE USER 'practice'@'localhost' IDENTIFIED BY 'practice';

SELECT * FROM USER;

CREATE DATABASE employeedb;

SHOW GRANTS FOR 'practice'@'localhost';

GRANT ALL PRIVILEGES ON employeedb.* TO 'practice'@'localhost';

DROP DATABASE employeedb;
 

-- 1. **id: practice**, **pwd: practice**
-- 2. **practice** 계정에 모든 권한 부여
-- 3. 아래 스크립트로 **employeedb** 데이터베이스 세팅
-- 4. 정답은 내일 드릴께요(feat. 안 어려울 꺼예요~ㅎ)
 
 
 