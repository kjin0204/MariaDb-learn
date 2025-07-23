


-- Inner Join
SELECT 
       a.menu_name
     , a.menu_price
     , b.category_name
     , b.category_code
  FROM tbl_menu AS a
  JOIN tbl_category AS b ON a.category_code = b.category_code;
  
  
  
-- using을 활용
SELECT 
       a.menu_name
     , a.menu_price
  FROM tbl_menu AS a
  JOIN tbl_category AS b USING (category_code);
  
  
  
  SELECT * FROM tbl_menu ;
  
  
  SELECT * FROM tbl_category;





SELECT 
       a.menu_name
     , a.menu_price
     , b.category_name
     , b.category_code
  FROM tbl_menu AS a
  LEFT JOIN tbl_category AS b ON a.category_code = b.category_code;
  

SELECT 
       a.menu_name
     , a.menu_price
     , b.category_name
     , b.category_code
  FROM tbl_menu AS a
 RIGHT JOIN tbl_category AS b ON a.category_code = b.category_code;


SELECT 
		 a.category_name AS '하위 카테고리'
  FROM tbl_category AS a
  JOIN tbl_category AS b ON a.ref_category_code = b.category_code;
  
  
SELECT 
		 *
  FROM tbl_menu
 CROSS JOIN	tbl_category;
 
 
 
 
 
 
 
SELECT 
       a.menu_name
     , a.menu_price
     , b.category_name
     , b.category_code
  FROM tbl_menu AS a
 RIGHT JOIN tbl_category AS b ON a.category_code = b.category_code
 WHERE a.category_code IS  null;
 
 

 SELECT
       a.menu_code
     , a.menu_name
     , a.menu_price
     , a.category_code
     , a.orderable_status
  FROM tbl_menu a
 INNER JOIN (SELECT menu_code
                  , menu_name
                  , menu_price
                  , category_code
                  , orderable_status
               FROM tbl_menu
              WHERE menu_price < 9000) b ON (a.menu_code = b.menu_code)
 WHERE a.category_code = 10;
 
 
 
 SELECT * FROM tbl_menu;
 
 DESC tbl_menu;
 
--  REPLACE INTO tbl_menu VALUES(17,'아이스가리비관자육수', 6000, 10, 'Y')
 
 
 SELECT *
 FROM tbl_menu;
 
 
SELECT *
FROM tbl_category;
 
 SELECT 
 		  *
   FROM tbl_menu AS a
	LEFT JOIN tbl_category AS b ON a.category_code = b.category_code 
	WHERE b.category_code = 1;
 

 