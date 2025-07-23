
-- 오토 커밋 상태 확인.
SELECT @@autocommit;

-- 일련의 동작이 전체 완료 되거나 전체 미완료 되어야 함.
START TRANSACTION;

INSERT 
  INTO tbl_menu
VALUES 
(
  NULL , '바나나해장국', 8500
, 4 , 'Y'
);

-- 뒤에서 롤백을 해도 이전 작업은 commit 함.
SAVEPOINT sp1; 

UPDATE tbl_menu
   SET menu_name = '수정된 메뉴'
 WHERE menu_code = 5;
 
 
DELETE FROM tbl_menu WHERE menu_code = 10;


-- ROLLBACK; -- 전체 돌아감.


-- rollback to 중간저장지점 까지 돌아가 저장 지점 이전은 commit 반영
ROLLBACK TO sp1; -- sp1까지 돌아가서 sp1 전에 작업은 commit;


SELECT * FROM tbl_menu;
-- COMMIT;


SET AUTOCOMMIT = 0;



-- auto_increment를 다시 초기화
ALTER TABLE tbl_menu AUTO_INCREMENT = 23; -- 다음 번호 발생을 23번으로 변경.
