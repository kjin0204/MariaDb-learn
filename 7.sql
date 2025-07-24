
DROP TABLE tb4;

TRUNCATE TABLE tb4;

-- tb4 스키마
create table tb4
(
   pk int auto_increment primary key,
  name VARCHAR(255),
   status varchar(255) check(status in('Y','N')) 
)

DELETE FROM tb4 WHERE true;


start transaction; -- autocommit이 설정되어 있어도 트랜젝션으로 작업을 묶을수 있음.

insert 
  into tb4
values
( null, '홍길동', 'Y'),
( null, '홍길순', 'Y'),
( null, '홍길삼', 'Y');

SAVEPOINT sp1;

delete 
  from tb4
 where pk = 1;
 
 
update tb4
   set name = '홍기사'
 where pk = 3;

SELECT * FROM tb4;
-- 해당 지점에서 Pk 제약 조건 위반으로 에러 발생.
insert 
  into tb4
values
(3, '홍길수', 'N');


ROLLBACK TO sp1;

ROLLBACK;


select * from tb4; -- 수정 사항 조회2