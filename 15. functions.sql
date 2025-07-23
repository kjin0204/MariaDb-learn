-- functions

-- 1. 문자열 관련 함수

SELECT ASCII('a'), CHAR(97); -- 출력 결과 97, a

-- 48(사용비트수) , 2(문자길이) , 6(바이트수)
SELECT BIT_LENGTH('한굴') ,CHAR_LENGTH('한글'),LENGTH('한글');


-- 문자열 결합
SELECT CONCAT('nice','to','meet','you!');

-- 구분자를 넣어줌, 연결되는 문자열 사이사이 구분자 들어감.
SELECT CONCAT_WS(' ','nice','to','meet','you!'); -- 구분자를 넣어줌.
SELECT CONCAT(CAST(menu_price AS CHAR), '원') FROM tbl_menu;

SELECT 
	    ELT(2,'축구','야구','농구')
	  , FIELD('축구','야구','농구','축구')
	  , find_in_set('축구','야구,농구,축구')
	  , INSTR('축구농구야구','농구')
	  , LOCATE('야구','축구농구야구');


-- 문자열, 시작 문자열 위치, 갯수, 입력할 내용)
SELECT INSERT('나와라 피카츄!' ,5,3, '꼬부기');

-- 문자열 왼쪽, 오른쪽 부터 자르기
SELECT LEFT('Hello World!' ,5) , RIGHT ('Nice shot!',5);


-- 소문자로 변경, 대문자로 변경.
SELECT LOWER('Hello'), UPPER('Hello');

-- 총 문자열 갯수만큼 부족한 문자를 채워줌.
SELECT LPAD('왼쪽' ,10 ,'#'), RPAD('오른쪽',10,'#');

-- 공백 지우기
SELECT LTRIM('    왼쪽  '), RTRIM ( '  오른쪽          ')
		, TRIM('  다자름   ')
		, TRIM(BOTH '@' FROM '@@@MariaDB@@@') -- @를 양쪽다 제거
		, TRIM(LEADING  '@' FROM '@@@MariaDB@@@') -- @ 을 왼쪽만 제거 lTRIM
		, TRIM(TRAILING  '@' FROM '@@@MariaDB@@@'); -- RTRIM


-- 두번째 인자의 수만큼 구분자로 구분
SELECT FORMAT(1234561234,3);


-- 진수 변환
SELECT BIN(65), OCT(65), HEX(65);

-- 반복 
SELECT repeat('재미져',5);

-- 문자 뒤짚기
SELECT REVERSE('happiness');

-- 두번째 인자값을 찾아 3번째 인자로 바꿈.
SELECT REPLACE('마리아DB', '마리아','Maria');


-- 문자열 자르기 5번째부터 4개.
SELECT SUBSTRING('열심히 DB공부를 해 봅시다.!',5,4)
		, SUBSTRING('열심히 DB공부를 해 봅시다.!',2); -- 두번째 부터 끝까지


-- 2. 숫자 관련 함수.

SELECT ABS(-123);

SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

SELECT CONV('A',16,10),CONV('A',16,2);


SELECT MOD(10,3), 10 % 3;

-- pow 제곱, sqrt 루트
SELECT POW(3,2) , SQRT(81);


-- 생성할 난수의 갯수  + 시작값 만큼 더한다.
-- 5 ~ * 까지의 난수 생성.
SELECT FLOOR(RAND() * 4 + 5), FLOOR(RAND() * 4 ) + 5;

-- 양수 : 1, 0 : 0 , 음수 : -1
SELECT SIGN(10.1) , SIGN(0), SIGN(-1.1);

-- 원하는 자리수까지 표현하고 이하는 버림.
SELECT TRUNCATE(12345.12345, 2) ,TRUNCATE(1234.12345, -2);


-- 3. 날짜 및 시간  관련
SELECT ADDDATE('2021-02-01' ,INTERVAL 28 DAY ), ADDDATE('2021-02-01' ,28 );
SELECT SUBDATE('2021-02-01' ,INTERVAL 1 YEAR);

SELECT SUBDATE('2020-02-01' , '1:0:10')
	  , ADDDATE('2020-02-01' , '1:0:10');


SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();

SELECT YEAR(CURDATE()), MONTH(CURDATE()) , DAY(CURDATE());
SELECT HOUR(CURTIME()), MINUTE(CURTIME()), SECOND(CURTIME()), MICROSECOND(CURTIME(6));





























-- field를 활용한 order by
-- SELECT
-- 	    orderable_status
-- 	  , FIELD(orderable_status, 'Y','N') AS 가능여부
--   FROM tbl_menu
--  ORDER BY FIELD(orderable_status, 'Y','N') DESC;


