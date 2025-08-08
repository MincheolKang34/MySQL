/*
	날짜 : 2025.08.08.
    이름 : 강민철
    내용 : 3장 제약조건 실습
*/
-- 실습 3-1
CREATE TABLE user2 (
	uid		varchar(10) primary key, -- 테이블의 첫번째 컬럼은 거의 무조건 pk
    name	varchar(10),
    birth	char(10),
    addr	varchar(50)
);

INSERT INTO user2 VALUES ('a101','김유신','1999-09-19','김해시');

-- 실습 3-2
CREATE TABLE user3 (
	uid		varchar(10) primary key,
    name	varchar(10),
    birth	char(10),
    hp		char(13) unique, -- 중복된 값을 허용하지 않음
    addr	varchar(100)
);
INSERT INTO user3 VALUES ('a101','김유신','1999-09-19','010-1234-1001','김해시');
INSERT INTO user3 VALUES ('a102','김춘추','1998-01-20','010-1234-1002','김해시');
INSERT INTO user3 VALUES ('a103','장보고','1998-01-20',NULL,'완도시');
INSERT INTO user3 VALUES ('a104','강감찬','1997-01-20',NULL,'서울시');

-- 실습 3-3
CREATE TABLE parent (
	pid		varchar(10) primary key,
    name	varchar(10),
    birth	char(10),
    addr	varchar(100)
);
CREATE TABLE child (
	cid		varchar(10) primary key,
    name	varchar(10),
    hp		char(13) unique,
    parent	varchar(10),
    FOREIGN KEY (parent) REFERENCES Parent (pid) -- 존재하지 않는 Parent의 pid값 입력을 차단
);

INSERT INTO parent VALUES ('p101','홍길동','1999-09-09','부산시');
INSERT INTO child VALUES ('c101','홍아들','010-1234-2001','p101');
INSERT INTO child VALUES ('c102','김아들','010-1234-3001','p110');
SELECT * FROM parent;
SELECT * FROM child;

-- 실습 3-4
CREATE TABLE user4 (
	uid		varchar(10) PRIMARY KEY, -- pk는 not null
    name	varchar(10) NOT NULL, -- 반드시 입력 허용
    gender	char(1), -- 모든 컬럼은 default는 null
    age		int DEFAULT 1,
    hp		char(13) unique, -- UNIQUE는 default는 null
    addr	varchar(100)
);

INSERT INTO user4 VALUES ('a101','김유신','M',23,'010-1223-0001','김해시');
INSERT INTO user4 VALUES ('a102','신사임당','F',21,NULL,'강릉시');
SELECT * FROM user4;

-- 실습 3-9
CREATE TABLE user5 (
	seq		int auto_increment primary key,
	name	varchar(10) not null,
    gender	char(1) check (gender in ('M', 'F')),
    age		int default 1 check (age > 0 and age < 100),
    addr	varchar(20)
);

-- 실습 3-10
INSERT INTO user5 (name,gender,age,addr) VALUES ('김유신','M',23,'김해시');
INSERT INTO user5 (name,gender,age,addr) VALUES ('심사임당','F',21,'강릉시');
DELETE FROM user5 WHERE seq = 2;

INSERT INTO user5 (name,gender,age,addr) VALUES('허난설현','F',21,'광주시');
SELECT * FROM user5;