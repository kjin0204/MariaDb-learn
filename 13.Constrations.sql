-- constrations(제약조건)
-- 1. not null  제약조건
-- 반드시 데이터가 존재해야 함.
-- coulmn 레벨에서만 제약조건 부여 가능.

DROP TABLE if EXISTS user_notnull;
CREATE TABLE if NOT EXISTS user_notnull (

    user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

INSERT
  INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');


SELECT * FROM user_notnull;

-- -------------------------------------------------------------------------
-- 2.unique 제약조건
-- 중복 데이터가 해당 컬럼에 들어가지 않아야 함.
-- 컬럼레벨 + 테이블레벨

-- 컬럼을 두개이상 복수이상으로 unique 제약 조건을 걸때 테이블 레벨에서만 가능하고
-- 같이 건 컬럼들 모두 중복 되었을때 제약 조건 위반 처리 함.
DROP TABLE if EXISTS user_unique;
CREATE TABLE if NOT EXISTS user_unique (
    user_no INT NOT NULL UNIQUE,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    UNIQUE(phone,user_id)
);


INSERT
  INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

SELECT * FROM user_unique;

-- -------------------------------------------------------------------------
-- 3. primary key
-- 모든 테이블에 반드시 하나 존재해야 하며 하는 제약조건
-- not null + unique
-- 클러스터 인덱스.
-- 복합키 : 두개이상의 컬럼을 제약
-- 후보키 : primary key가 될 수 있는 컬럼.

-- 컬럼레벨 + 테이블레벨
DROP TABLE if EXISTS user_primarykey;
CREATE TABLE if NOT EXISTS user_primarykey (
    user_no INT  PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255)
);

INSERT
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');

SELECT * FROM user_primarykey;

-- -------------------------------------------------------------------------
-- 4. FOREIGN key
-- 테이블이 두개 이상 이면서 한쪽 테이블에서 다른쪽 테이블로 넘어간 컬럼에 작성됨
-- 참조하는 컬럼은 반드시 primary key , foreign key는 부모 테이블의 pk 값 또는 null
-- 부모 테이블을 지우려면 자식 테이블을 먼저 지워야 함.

DROP TABLE if EXISTS user_foreignkey;
DROP TABLE if EXISTS user_grade;
CREATE TABLE if NOT EXISTS user_grade (
    grade_code INT NOT NULL UNIQUE,
    grade_name VARCHAR(255) NOT NULL 
);

CREATE TABLE if NOT EXISTS user_foreignkey (
    user_no INT  PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255),
    grade_code INT,
	 FOREIGN KEY(grade_code) REFERENCES user_grade(grade_code) -- 참조하는 테이블에 primary key로 되어 있으면 컬럼명 생략 가능.
);


INSERT 
  INTO user_grade
VALUES 
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원');


SELECT * FROM user_grade;


INSERT
  INTO user_foreignkey
(user_no, user_id, user_pwd, user_name, gender, phone, email,grade_code)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com',10),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com',30),
(3, 'user03', 'pass03', '홍길순', '여', '010-1211-5678', 'hongsun123@gmail.com',20);



INSERT
  INTO user_foreignkey
(user_no, user_id, user_pwd, user_name, gender, phone, email,grade_code)
VALUES
(4, 'user04', 'pass04', '홍길동', '남', '010-1334-5678', 'hong123@gmail.com',NULL);


SELECT * FROM user_foreignkey;



-- ---------------------------------------------------------------------------
-- 삭제룰을 적용해서 부모테이블의 데이터를 삭제하게 해줄 수도 있다.(권장 x)


DROP TABLE if EXISTS user_foreignkey2;
DROP TABLE if EXISTS user_grade2;


CREATE TABLE if NOT EXISTS user_grade2 (
    grade_code INT PRIMARY KEY,
    grade_name VARCHAR(255) NOT NULL 
);

CREATE TABLE if NOT EXISTS user_foreignkey2 (
    user_no INT  PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255),
    grade_code INT,
	 FOREIGN KEY(grade_code) REFERENCES user_grade2
	 ON DELETE SET NULL -- 참조되는 데이터가 사라지면 greade_code를 null로 변경
);



INSERT 
  INTO user_grade2
VALUES 
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원');


-- SELECT * FROM user_grade2;
INSERT
  INTO user_foreignkey2
(user_no, user_id, user_pwd, user_name, gender, phone, email,grade_code)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com',10),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com',30),
(3, 'user03', 'pass03', '홍길순', '여', '010-1211-5678', 'hongsun123@gmail.com',20);

SELECT * FROM user_foreignkey2;


DELETE 
  FROM user_grade2
 WHERE grade_code = 10;




CREATE TABLE test (
    t1 VARCHAR(255) UNIQUE,
    t2 INT
    );
    
    
    INSERT INTO test (t1, t2) VALUES (NULL,1);


SELECT * FROM test;








