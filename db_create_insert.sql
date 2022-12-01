# 테이블을 생성하기
create database sqldb;
use sqldb;
create table usertbl -- 회원 테이블
(
	userID CHAR(8) NOT NULL primary KEY, -- 사용자ID(PK)
    name VARCHAR(10) NOT NULL, -- 이름
    birthYear INT NOT NULL, -- 출생년도 
    addr CHAR(2) NOT NULL, -- 지역(경기, 서울, 경남 식)
    mobile1 CHAR(3), -- 휴대폰 국번(011,016, 017 등)
    mobile2 CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
    height SMALLINT, -- 키
    mDate DATE -- 회원 가입일
);
select* from usertbl;

CREATE TABLE buytbl -- 회원 구매 테이블(buy table의 약자)
(
	num INT auto_increment NOT NULL primary KEY , -- 순번(PK)
    userID CHAR(8) NOT NULL, -- 아이디(FK)
    prodName Char(6) NOT NULL, -- 물품명
    groupName CHAR(4) , -- 분류 
    price INT NOT NULL , -- 단가
    amount SMALLINT NOT NULL, -- 수량
    FOREIGN KEY (userID) REFERENCES usertbl(userID) #외래키를 사용해 다른 테이블의 userID를 참조
);

# 만든 테이블에 내용 삽입하기
-- usertbl에 내용 삽입하기 
# INSERT INTO 테이블명 VAL
INSERT INTO usertbl VALUES('LSG','이승기',1987,'서울','011','11111111',182,'2008-8-8');
INSERT INTO usertbl VALUES('KBS','감범수',1979,'경남','011','22222222',173,'2012-4-4');
INSERT INTO usertbl VALUES('KKH','김경호',1971,'전남','019','33333333',177,'2007-7-7');
INSERT INTO usertbl VALUES('JYP','조용필',1950,'경기','011','44444444',166,'2009-4-4');
INSERT INTO usertbl VALUES('SSK','성시경',1979,'서울',NULL,NULL,186,'2013-12-12');
INSERT INTO usertbl VALUES('LJB','임재범',1963,'서울','016','66666666',182,'2009-9-9');
INSERT INTO usertbl VALUES('YJS','윤종신',1969,'경남',NULL,NULL,170,'2005-5-5');
INSERT INTO usertbl VALUES('EJW','은지원',1972,'경북','011','88888888',174,'2014-3-3');
INSERT INTO usertbl VALUES('JKW','조관우',1965,'경기','018','99999999',172,'2010-10-10');
INSERT INTO usertbl VALUES('BBK','바비킴',1973,'서울','010','00000000',176,'2013-5-5');

INSERT INTO buytbl VALUES(NULL,'KBS','운동화',NULL,30,2);
INSERT INTO buytbl VALUES(NULL,'KBS','노트북','전자',1000,1);
INSERT INTO buytbl VALUES(NULL,'JYP','모니터','전자',200,1);
INSERT INTO buytbl VALUES(NULL,'BBK','모니터','전자',200,5);
INSERT INTO buytbl VALUES(NULL,'KBS','청바지','의류',50,3);
INSERT INTO buytbl VALUES(NULL,'BBK','메모리','전자',80,10);
INSERT INTO buytbl VALUES(NULL,'SSK','책','서적',15,5);
INSERT INTO buytbl VALUES(NULL,'EJW','책','서적',15,2);
INSERT INTO buytbl VALUES(NULL,'EJW','청바지','의류',50,1);
INSERT INTO buytbl VALUES(NULL,'BBK','운동화',NULL,30,2);
INSERT INTO buytbl VALUES(NULL,'EJW','책','서적',15,1);
INSERT INTO buytbl VALUES(NULL,'BBK','운동화', NULL,30,2);

# 결과 정상출력
select * from usertbl;
select * from buytbl;