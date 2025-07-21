


SELECT 
	    menu_code
	  , menu_name
	  , menu_price
  FROM tbl_menu
 ORDER BY menu_price DESC, menu_name desc;
 
 
 
 
SELECT 
	    menu_name
	  , menu_price
	  ,orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'y';
 
 
SELECT 
		 menu_name
	  , orderable_status
  FROM tbl_menu
 ORDER BY 2;
 
 
 
SELECT 
		 menu_name AS '메뉴명'
	  , orderable_status AS '주문가능상태'
  FROM tbl_menu
 ORDER BY 주문가능상태;
 
 
 SELECT * FROM tbl_category ORDER BY ref_category_code desc;
 
 
 
-- 오름 차순시 null이 나중에 나옴.
SELECT
		 *
  FROM tbl_category
 ORDER BY -ref_category_code desc;
 
 
 
 SELECT * FROM tbl_menu;
 
 
 SELECT 
 		  menu_code
 	   , menu_name
 	   , menu_price
 	   , category_code
 	   , orderable_status
   FROM tbl_menu
  WHERE orderable_status = 'y'
    AND menu_code != 10;
    
    
    
 SELECT 
 		  a.menu_code
 	   , a.menu_name
 	   , a.menu_price
 	   , a.category_code
 	   , a.orderable_status
   FROM tbl_menu AS a
   JOIN ( SELECT *
			   from tbl_category
			  where category_code != 10)AS b
   ON a.category_code = b.category_code
  WHERE a.orderable_status = 'y';
--     AND menu_code != 10;
 
 
 
 DESC tbl_menu;
 
SELECT 
		 *
  FROM tbl_menu
 WHERE category_code IN (
					 			 SELECT DISTINCT 
					  				 	  category_code
					  			   FROM tbl_category
					  			  WHERE category_name != '기타'
							   )
 ORDER BY category_code;
  			 
  			 
  			 
DESC tbl_menu;  			 
  			 
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
  FROM tbl_menu
 WHERE menu_price not BETWEEN 5000 AND 9000;
  			 
  			 
  			 

 
SELECT *
  FROM tbl_category
 WHERE category_code IN (
						 			SELECT 
									 		 DISTINCT category_code
									  FROM tbl_menu
						       );
 
 
SELECT 
		 *
  FROM tbl_menu
 WHERE category_code in (
 								 SELECT category_code
 								   FROM tbl_category
 								  WHERE category_code IN (13,5,10)
 								);
 								
SELECT 
		 *
  FROM tbl_menu AS a
  JOIN tbl_category AS b
  ON a.category_code = b.category_code;
  


SELECT 
       *
  FROM tbl_category
 WHERE ref_category_code IS not NULL;
 
 
desc tbl_menu;
 
 SELECT 
 	     menu_code
 	   , menu_name
 	   , menu_price
   FROM tbl_menu
  ORDER BY menu_price DESC, menu_code desc
  LIMIT 6 , 6;
 
 
 
 
SELECT 
		 DISTINCT category_code, orderable_status
  FROM tbl_menu
  
  ORDER BY menu_price;
  
 

--  DESC tbl_menu;



SELECT 
	    menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
 FROM tbl_menu
WHERE menu_price != 10000
ORDER BY orderable_status;



SELECT *
FROM tbl_category;


SELECT 
	    menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
 FROM tbl_menu
ORDER BY menu_name;





SELECT 
	    menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
 FROM tbl_menu
WHERE category_code IN(
								SELECT
								 		 DISTINCT category_code
								  FROM tbl_category
								 WHERE ref_category_code = 1
						    );
						    
						    
						    
						    
						    

SELECT 
	    menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
  FROM tbl_menu
 WHERE menu_name LIKE '%밥'
; 
 
 
 
SELECT 
	    menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
  FROM tbl_menu
 WHERE menu_name LIKE '_____';
 
 
 SELECT 
	    menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
  FROM tbl_menu
 ORDER BY menu_code ASC
 LIMIT 5;
 
 
 
 
SELECT *
  FROM tbl_category
 WHERE ref_category_code is NULL;
 
 
 
  SELECT DISTINCT category_code 
  FROM tbl_menu;
 


