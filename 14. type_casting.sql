-- type casting 데이터 형태 변환
-- 명시적 형변환

-- 1) 숫자 -> 숫자

SELECT 
       AVG(menu_price) AS 평균-- FLOAT
     , CAST(AVG(menu_price)  AS  UNSIGNED INTEGER ) AS  '실수 평균' -- 정수로 변경
     , CONVERT(AVG(menu_price), DOUBLE) AS '가격 평균2' -- duble로 변경
  FROM tbl_menu;


-- 2) 문자-> 날짜


SELECT
		 '20250723' AS 문자형 
     , CAST('20250723' AS DATE) AS 데이트;

-- 3) 숫자 -> 문자
SELECT CAST(1000 AS CHAR);

SELECT CONCAT(CAST(1000 AS CHAR), '원',' 이요'); -- 명시적 형변환
SELECT CONCAT(1000, '원',' 이요'); -- 묵시적 형변환

-- 묵시적 형변환






