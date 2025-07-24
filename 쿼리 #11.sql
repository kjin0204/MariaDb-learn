-- view
-- 가상 테이블


CREATE VIEW v_menu 
AS
SELECT
		 menu_name AS '메뉴명'
	  , menu_price AS '메뉴단가'
  FROM tbl_menu;
  


SELECT *
  FROM v_menu;

DROP VIEW jansik;

-- 기존 view 테이블을 수정. drop을 하지 않아도 됨
CREATE OR REPLACE VIEW hansik
AS
SELECT
       menu_code AS '메뉴번호'
     , menu_name AS '메뉴명'
     , menu_price AS '메뉴가격'
     , category_code AS '카테고리코드'
     , orderable_status AS '주문가능상태'
  FROM tbl_menu
 WHERE category_code = 4;
 
 

SELECT * FROM hansik;

SELECT * FROM tbl_menu;


INSERT 
  INTO hansik
VALUES
(
	99, '바나나맛솜사탕', 20000, 4 , 'Y'
)


UPDATE hansik
   SET 메뉴명 = '딸기맛솜사탕'
     , 메뉴가격 = 2000
 WHERE 메뉴번호 = 99;










