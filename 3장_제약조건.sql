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