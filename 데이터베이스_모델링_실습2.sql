/*
	날짜 : 2025.08.12.
    이름 : 강민철
    내용 : 데이터베이스 모델링 실습2
*/
-- 사용자 추가
CREATE USER 'university'@'%' IDENTIFIED BY '1234';        -- %는 원격 외부에서 접속할 수 있다는 뜻
GRANT ALL PRIVILEGES ON university.* TO 'university'@'%';
FLUSH PRIVILEGES;

insert into department values
	(10,'국어국문학과','051-510-1010'),
    (11,'영어국문학과','051-510-1011'),
    (20,'경영학과','051-510-1020'),
    (21,'경제학과','051-510-1021'),
    (22,'정치외교학과','051-510-1022'),
    (23,'사회복지학과','051-510-1023'),
    (30,'수학과','051-510-1030'),
    (31,'통계학과','051-510-1031'),
    (32,'생명과학과','051-510-1032'),
    (40,'기계공학과','051-510-1040'),
    (41,'전자공학과','051-510-1041'),
    (42,'컴퓨터공학과','051-510-1042');
    
insert into professor values
	('P10101','김유신','750120-1234567','010-1101-1976','kimys@hg.ac.kr','서울',10),
    ('P10102','계백','740610-1234567','010-1102-1975','gaeback@hg.ac.kr','서울',10),
    ('P11101','김관창','880529-1234567','010-1103-1989','kwanch@hg.ac.kr','대전',11),
    ('P11103','김춘추','780412-1234567','010-2101-1979','kimcc@hg.ac.kr',null,11),
    ('P11104','이사부','650911-1234567','010-2104-1966','leesabu@hg.ac.kr','대전',11),
    ('P22110','장보고','780727-1234567','010-3101-1979','jangbg@hg.ac.kr','대구',22),
    ('P23102','선덕여왕','830614-1234567','010-4101-1984','gueen@hg.ac.kr',null,23),
    ('P31101','강감찬','641020-1234567','010-5101-1965','kang@hg.ac.kr','대구',31),
    ('P31104','신사임당','711127-1234567','010-6101-1972','sinsa@hg.ac.kr','부산',31),
    ('P40101','이이','910906-1234567','010-7103-1992','leelee@hg.ac.kr','부산',40),
    ('P40102','이황','881208-1234567','010-7104-1989','hwang@hg.ac.kr',null,40),
    ('P42103','송상현','760313-1234567','010-8101-1977','ssh@hg.ac.kr','광주',42);

insert into student values
	('20101001','정우성','760121-1234567','010-1101-7601',null,'서울','P10101',10),
    ('20101002','이정재','750611-1234567','010-1102-7506',null,'서울','P10101',10),
    ('20111011','전지현','890530-1234567','010-1103-8905','jjh@naver.com',null,'P11103',11),
    ('20111013','이나영','790413-1234567','010-2101-7904','lee@naver.com','대전','P11103',11),
    ('20111014','원빈','660912-1234567','010-2104-6609','one@daum.net','대전','P11104',11),
    ('21221010','장동건','790728-1234567','010-3101-7907','jang@naver.com','대구','P22110',22),
    ('21231002','고소영','840615-1234567','010-4101-8406','goso@daum.net',null,'P23102',23),
    ('22311011','김연아','651021-1234567','010-5101-6510','yuna@daum.net','대구','P31104',31),
    ('22311014','유재석','721128-1234567','010-6101-7211',null,'부산','P31104',31),
    ('22401001','강호동','920907-1234567','010-7103-9209',null,'부산','P40101',40),
    ('22401002','조인성','891209-1234567','010-7104-8912','join@gmail.com','광주','P40101',40),
    ('22421003','강동원','770314-1234567','010-8101-7703','dong@naver.com','광주','P42103',42);

insert into course values
	('101001','P10101','대학 글쓰기',2,100,'본102'),
    ('101002','P10102','한국어음운론',3,300,'본102'),
    ('101003','P10102','한국현대문학사',3,300,'본103'),
    ('111011','P11103','중세영문학',3,200,'본201'),
    ('111012','P11104','영미시',3,200,'본201'),
    ('231110','P23102','사회복지학개론',2,180,'별관103'),
    ('311002','P31101','통계의 이해',2,160,'별관303'),
    ('311003','P31104','기초 통계학',3,600,'별관303'),
    ('401019','P40101','기계역학',3,600,'공학관 102'),
    ('421012','P42103','데이터베이스',3,800,'공학관 103');
    
insert into enrollment values
	('20101001','101001','P10101',null,null,null,null,null),
    ('20101001','101002','P10102',null,null,null,null,null),
    ('20111013','111011','P11103',null,null,null,null,null),
    ('21231002','231110','P23102',null,null,null,null,null),
    ('22401001','401019','P40101',null,null,null,null,null),
    ('22401001','421012','P42103',null,null,null,null,null),
    ('20101001','101003','P10102',null,null,null,null,null),
    ('22421003','311003','P31104',null,null,null,null,null),
    ('22421003','421012','P42103',null,null,null,null,null),
    ('20111013','111012','P11104',null,null,null,null,null);
    
-- 5.SQL
-- 문제 1.
select stdNo as 학생번호,
	stdName as 이름,
    stdHp as 휴대폰,
    s.depNo as 학과번호,
    depName as 학과명
from student s
join department d on s.depNo=d.depNo;

-- 문제 2.
select proNo as 교수번호,
	proName as 이름,
    proHp as 휴대폰,
    p.depNo as 학과번호,
    depName as 학과명
from professor p
join department d on p.depNo=d.depNo;

-- 문제 3.
select csNo as 강좌번호,
	csName as 강좌명,
    proName as 담당교수명,
    proHp as 휴대폰
from course c
join professor p on c.proNo=p.proNo;

-- 문제 4.
select csNo as 강좌번호,
	csName as 강좌명,
    c.proNo as "담당교수 번호",
    proName as 담당교수명,
    proHp as 휴대폰,
    p.depNo as 학과번호,
    depName as 학과명
from course c
join professor p on c.proNo=p.proNo
join department d on p.depNo=d.depNo;

-- 문제 5.
select e.stdNo as 학생번호,
	stdName as 학생명,
    e.csNo as 강좌번호,
    csName as 강좌명,
    e.proNo as 교수번호,
    proName as 교수명
from enrollment e
join student s on e.stdNo=s.stdNo
join course c on e.csNo=c.csNo
join professor p on e.proNo=p.proNo;

-- 문제 6.
update enrollment set scoreAttd=round(rand()*100), scoreMid=round(rand()*100), scoreFinal=round(rand()*100);

-- 문제 7.
update enrollment set scoreTotal=(scoreAttd+scoreMid+scoreFinal)/3;

-- 문제 8.
update enrollment set scoreGrade=
	case
		when scoreTotal >= 90 then 'A'
        when scoreTotal >= 80 then 'B'
        when scoreTotal >= 70 then 'C'
        when scoreTotal >= 60 then 'D'
        else 'F'
	end;

-- 문제 9.
select max(scoreTotal) from enrollment;

-- 문제 10.
select round(avg(scoreTotal)) 
from enrollment e
join student s on e.stdNo=s.stdNo
where stdName='정우성';