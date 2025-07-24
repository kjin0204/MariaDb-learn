-- index
-- 사전(클러스터링,고유) 또는 용어 검색(넌클러스터링,비고유)


DROP TABLE if EXISTS phone;
CREATE TABLE phone (
	phone_code INT PRIMARY KEY,
	phone_name VARCHAR(100),
	phone_price INTEGER
);

INSERT
  INTO phone
VALUES
(1, 'galaxyS24', 1200000),
(2, 'iphone17pro', 1430000),
(3, 'galaxyfold8', 1730000);


SELECT * FROM phone;
SHOW INDEX FROM phone; -- index 검색.
-- cardinality : phone_code에 들어있는 값들이 중복되지않는 갯수(종류) 

-- 클러스터 인덱스가 걸린 컬럼으로 조건을 검색 하면 검색이 빠름.
SELECT * FROM phone WHERE phone_code = 1;

-- 실행계획 확인.
explain SELECT * FROM phone WHERE phone_name = 'iphone17pro';


-- 일반 컬럼에 비고유 인덱스 추가(해당 컬럼의 값으로 별도의 공간을 마련해 정렬)
CREATE INDEX idx_name ON phone(phone_name);


-- where 조건에 따른 index 활용 확인
explain SELECT * FROM phone WHERE phone_code = '1';
explain SELECT * FROM phone WHERE phone_name = 'iphone17pro';
explain SELECT * FROM phone WHERE phone_price = 1430000;

-- 인덱스는 필요한 곳에 달아야 한다.
-- 1) 조건으로 자주 활욜할 컬럼(where절, having절, join 사용할 때 쓰는 컬럼들)
-- 2) '='을 사용하는 조건에 쓰는 컬럼일수록 효율적.
-- 3) 데이터가 자주 수정되지 않는 컬럼일 수록 효율적
-- 4) 전체 데이터의 10 ~ 15% 정도 일수록 가장 효율적.
-- 5) 복합속성일 경우(컬럼 두개 이상) 카디널리티가 높은(중복이 적은) 컬럼을 먼저 사용




-- 단점
-- 1) 별도의 저장공간 필요
-- 2) 주기적으로 인덱스를 다시 업데이트 해야 함
.
-- 인덱스 재 배치(인덱스 최적화).
OPTIMIZE TABLE phone;

-- index삭제
DROP INDEX idx_phone ON phone;

