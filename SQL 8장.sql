-- <실습 1> --

DROP DATABASE IF EXISTS ShopDB;
DROP DATABASE IF EXISTS ModelDB;
DROP DATABASE IF EXISTS sqldb;
DROP DATABASE IF EXISTS tabledb;

CREATE DATABASE tabledb;

CREATE TABLE `tabledb`.`buytbl` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `userid` CHAR(8) NOT NULL,
  `prodName` CHAR(6) NOT NULL,
  `groupName` CHAR(4) NULL,
  `price` INT NOT NULL,
  `amount` SMALLINT NOT NULL,
  PRIMARY KEY (`num`),
  FOREIGN KEY (userid) REFERENCES usertbl(userID)  
);

-- </실습 1> --

CREATE TABLE test (num INT);

-- <실습 2> --

DROP DATABASE tabledb;
CREATE DATABASE tabledb;

USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl -- 회원 테이블
( userID  CHAR(8), -- 사용자 아이디
  name    VARCHAR(10), -- 이름
  birthYear   INT,  -- 출생년도
  addr	  CHAR(2), -- 지역(경기,서울,경남 등으로 글자만 입력)
  mobile1  CHAR(3), -- 휴대폰의국번(011, 016, 017, 018, 019, 010 등)
  mobile2  CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈 제외)
  height    SMALLINT,  -- 키
  mDate    DATE  -- 회원 가입일
);
CREATE TABLE buytbl -- 구매 테이블
(  num INT, -- 순번(PK)
   userid  CHAR(8),-- 아이디(FK)
   prodName CHAR(6), -- 물품명
   groupName CHAR(4) , -- 분류
   price     INT , -- 단가
   amount SMALLINT -- 수량
);

USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) NOT NULL , 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  addr	  CHAR(2) NOT NULL,
  mobile1	CHAR(3) NULL, 
  mobile2   CHAR(8) NULL, 
  height    SMALLINT NULL, 
  mDate    DATE NULL 
);
CREATE TABLE buytbl 
(  num INT NOT NULL , 
   userid  CHAR(8) NOT NULL ,
   prodName CHAR(6) NOT NULL,
   groupName CHAR(4) NULL , 
   price     INT  NOT NULL,
   amount    SMALLINT  NOT NULL 
);

USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) NOT NULL PRIMARY KEY, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  addr	  CHAR(2) NOT NULL,
  mobile1	CHAR(3) NULL, 
  mobile2   CHAR(8) NULL, 
  height    SMALLINT NULL, 
  mDate    DATE NULL 
);
CREATE TABLE buytbl 
(  num INT NOT NULL PRIMARY KEY, 
   userid  CHAR(8) NOT NULL ,
   prodName CHAR(6) NOT NULL,
   groupName CHAR(4) NULL , 
   price     INT  NOT NULL,
   amount    SMALLINT  NOT NULL 
);


DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl 
(  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 기본키 지정
   userid  CHAR(8) NOT NULL ,
   prodName CHAR(6) NOT NULL,
   groupName CHAR(4) NULL , 
   price     INT  NOT NULL,
   amount    SMALLINT  NOT NULL 
);


DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl 
(  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
   userid  CHAR(8) NOT NULL ,
   prodName CHAR(6) NOT NULL,
   groupName CHAR(4) NULL , 
   price     INT  NOT NULL,
   amount    SMALLINT  NOT NULL 
   , FOREIGN KEY(userid) REFERENCES usertbl(userID)
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);

-- 추가 입력 
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);


-- </실습 2> --

USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) NOT NULL PRIMARY KEY, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL
);

DESCRIBE usertbl; -- 테이블의 구조 확인

DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) NOT NULL, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  CONSTRAINT PRIMARY KEY PK_usertbl_userID (userID) -- 예약 문장(기본키 지정)
);

DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
(   userID  CHAR(8) NOT NULL, 
    name    VARCHAR(10) NOT NULL, 
    birthYear   INT NOT NULL
);
ALTER TABLE usertbl	-- alter table : 테이블 구조를 수정하는 코드, usertbl 변경
     ADD CONSTRAINT PK_usertbl_userID -- 제약조건 추가, 추가할 제약 조건 이름 설정
     PRIMARY KEY (userID); -- 기본 키 제약조건, 제약 조건을 설정할 열 지정

DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
( prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4)  NOT NULL,
  prodDate DATETIME  NOT NULL,
  prodCur  CHAR(10) NULL
);
ALTER TABLE prodTbl
	ADD CONSTRAINT PK_prodTbl_proCode_prodID  -- 2개의 열을 합쳐 하나의 pk로 지정
	PRIMARY KEY (prodCode, prodID) ;

-- 위의 조건을 create table문에서 수행할 때
DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
( prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4)  NOT NULL,
  prodDate DATETIME  NOT NULL,
  prodCur  CHAR(10) NULL,
  CONSTRAINT PK_prodTbl_proCode_prodID 
	PRIMARY KEY (prodCode, prodID) 
);

SHOW INDEX FROM prodTbl; -- 위 코드로 테이블의 정보 확인 시 두 열이 합쳐저 하나의 기본키 제약조건 설정

DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) NOT NULL PRIMARY KEY, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL 
);
CREATE TABLE buytbl 
(  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY , 
   userID  CHAR(8) NOT NULL, 
   prodName CHAR(6) NOT NULL,
   FOREIGN KEY(userID) REFERENCES usertbl(userID) -- 외래키 지정
);

-- 위의 코드와 같지만 직접 키의 조건을 설정하고 싶을 때
DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl 
(  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY , 
   userID  CHAR(8) NOT NULL, 
   prodName CHAR(6) NOT NULL,
   CONSTRAINT FK_usertbl_buytbl FOREIGN KEY(userID) REFERENCES usertbl(userID)
);

DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl 
(  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   userID  CHAR(8) NOT NULL, 
   prodName CHAR(6) NOT NULL 
);
ALTER TABLE buytbl -- buytbl 수정
    ADD CONSTRAINT FK_usertbl_buytbl -- 제약조건 더함. 제약 조건 이름 명명
    FOREIGN KEY (userID) -- 외래키 제약 조건을 buytbl의 userid에 설정
    REFERENCES usertbl(userID); -- 참조할 기준 테이블을 usertbl 테이블의 userid열

SHOW INDEX FROM buytbl ;

ALTER TABLE buytbl
	DROP FOREIGN KEY FK_usertbl_buytbl; -- 외래 키 제거
ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
	FOREIGN KEY (userID)
	REFERENCES usertbl (userID)
	ON UPDATE CASCADE; -- 기준테이블의 id가 바뀌면 구매 테이블의 id도 따라서 바뀜
    
    
-----------------------------------
--- UNIQUE : 중복되지 않는 유일한 값 입력 (PRIMARY KEY와 유사, NULL값 허용한다는 차이점이 있음)
USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) NOT NULL PRIMARY KEY, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  email   CHAR(30) NULL  UNIQUE
);
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) NOT NULL PRIMARY KEY,
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  email   CHAR(30) NULL ,  
  CONSTRAINT AK_email  UNIQUE (email)
);

-- CHECK 제약조건 : 입력되는 데이터 점검
-- 출생연도가 1900년 이후 그리고 2023년 이전, 이름은 반드시 넣어야 함.
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) PRIMARY KEY,
  name    VARCHAR(10) , 
  birthYear  INT CHECK  (birthYear >= 1900 AND birthYear <= 2023),
  mobile1	char(3) NULL, 
  CONSTRAINT CK_name CHECK ( name IS NOT NULL)  
);

-- 휴대폰 국번 체크
ALTER TABLE usertbl
	ADD CONSTRAINT CK_mobile1
	CHECK  (mobile1 IN ('010','011','016','017','018','019')) ;
    
-- DEFAULT문 적용
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
( userID  	CHAR(8) NOT NULL PRIMARY KEY,  
  name    	VARCHAR(10) NOT NULL, 
  birthYear	INT NOT NULL DEFAULT -1,
  addr	  	CHAR(2) NOT NULL DEFAULT '서울',
  mobile1	CHAR(3) NULL, 
  mobile2	CHAR(8) NULL, 
  height	SMALLINT NULL DEFAULT 170, 
  mDate    	DATE NULL
);


DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
( userID  	CHAR(8) NOT NULL PRIMARY KEY,  
  name    	VARCHAR(10) NOT NULL, 
  birthYear	INT NOT NULL,
  addr	  	CHAR(2) NOT NULL,
  mobile1	CHAR(3) NULL, 
  mobile2	CHAR(8) NULL, 
  height	SMALLINT NULL, 
  mDate    	DATE NULL
);
ALTER TABLE usertbl
	ALTER COLUMN birthYear SET DEFAULT -1;
ALTER TABLE usertbl
	ALTER COLUMN addr SET DEFAULT '서울';
ALTER TABLE usertbl
	ALTER COLUMN height SET DEFAULT 170;

-- default 문은 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO usertbl VALUES ('LHL', '이혜리', default, default, '011', '1234567', default, '2023.12.12');
-- 열이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력한다
INSERT INTO usertbl(userID, name) VALUES('KAY', '김아영');
-- 값이 직접 명기되면 DEFAULT로 설정된 값은 무시된다.
INSERT INTO usertbl VALUES ('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2020.5.5');
SELECT * FROM usertbl;


-- <실습 3> --

CREATE DATABASE IF NOT EXISTS compressDB;
USE compressDB;
CREATE TABLE normalTBL( emp_no int , first_name varchar(14));
CREATE TABLE compressTBL( emp_no int , first_name varchar(14))
	ROW_FORMAT=COMPRESSED ; -- 앞으로 ROW 테이블에 입력되는 데이터는 내부적으로 압축
							-- 사용자 입장에서 부담X

INSERT INTO normalTbl 
     SELECT emp_no, first_name FROM employees.employees;   
INSERT INTO compressTBL 
     SELECT emp_no, first_name FROM employees.employees;

SHOW TABLE STATUS FROM compressDB;

DROP DATABASE IF EXISTS compressDB;

-- </실습 3> --



-- <실습 4> --


-- Workbench 1
USE employees;
CREATE TEMPORARY TABLE  IF NOT EXISTS  temptbl (id INT, name CHAR(5));
CREATE TEMPORARY TABLE  IF NOT EXISTS employees (id INT, name CHAR(5));
DESCRIBE temptbl;
DESCRIBE employees;

INSERT INTO temptbl VALUES (1, 'This');
INSERT INTO employees VALUES (2, 'MySQL');
SELECT * FROM temptbl;
SELECT * FROM employees;

-- Workbench 2
USE employees;
SELECT * FROM temptbl;
SELECT * FROM employees;

-- Workbench 1
DROP TABLE temptbl; 

USE employees;
SELECT * FROM employees;

-- </실습 4> --

USE tabledb;
ALTER TABLE usertbl
	ADD homepage VARCHAR(30)  -- 열추가
		DEFAULT 'http://www.hanbit.co.kr' -- 디폴트값
		NULL; -- Null 허용함

ALTER TABLE usertbl
	DROP COLUMN mobile1;

ALTER TABLE usertbl
	CHANGE COLUMN name uName VARCHAR(20) NULL ;

ALTER TABLE usertbl
	DROP PRIMARY KEY; 

ALTER TABLE buytbl
	DROP FOREIGN KEY buytbl_ibfk_1;


-- <실습 5> --

USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8), 
  name    VARCHAR(10),
  birthYear   INT,  
  addr	  CHAR(2), 
  mobile1	CHAR(3), 
  mobile2   CHAR(8), 
  height    SMALLINT, 
  mDate    DATE 
);
CREATE TABLE buytbl 
(  num int AUTO_INCREMENT PRIMARY KEY,
   userid  CHAR(8),
   prodName CHAR(6),
   groupName CHAR(4),
   price     INT ,
   amount   SMALLINT
);


INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', NULL, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1871, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL,'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL,'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL,'BBK', '모니터', '전자', 200,  5);

-- 기본키 지정
ALTER TABLE usertbl
	ADD CONSTRAINT PK_usertbl_userID
	PRIMARY KEY (userID);

-- 테이블 확인
DESC usertbl;

-- 외래키 설정 (기준 : USERTBL의 USERID)
ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
	FOREIGN KEY (userID)
	REFERENCES usertbl (userID);

-- 문제가 되는 BUYTBL의 BBK행 삭제, 다시 외래키 설정
DELETE FROM buytbl WHERE userid = 'BBK';
ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
	FOREIGN KEY (userID)
	REFERENCES usertbl (userID);

-- 데이터 재입력
INSERT INTO buytbl VALUES(NULL,'BBK', '모니터', '전자', 200,  5);

-- 잠시 외래키 제약조건 비활성화하고 데이터 입력 후 재활성화
SET foreign_key_checks = 0; -- 외래키 제약조건 비활성화(외래키 체크여부 OFF)
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
SET foreign_key_checks = 1; -- 외래키 제약조건 활성화(외래키 체크여부 ON)

/* CHECK 제약조건 설정
USERTBL의 출생년도를 1900~2023까지만 입력, NULL 값 허용하지 않고 출생년도는 반드시 입력하도록*/
ALTER TABLE userTBL
	ADD CONSTRAINT CK_birthYear
	CHECK ( (birthYear >= 1900 AND birthYear <= 2023) AND (birthYear IS NOT NULL) );

-- 출생년도 수정
UPDATE usertbl SET birthYear=1979 WHERE userID='KBS';
UPDATE usertbl SET birthYear=1971 WHERE userID='KKH';

-- CHECK 제약조건 다시 설정
ALTER TABLE userTBL
	ADD CONSTRAINT CK_birthYear
	CHECK ( (birthYear >= 1900 AND birthYear <= 2023) AND (birthYear IS NOT NULL) );

-- 오류가 발생하여 입력되지 않는 데이터
INSERT INTO usertbl VALUES('TKV', '태권뷔', 2999, '우주', NULL  , NULL , 186, '2023-12-12');

-- 나머지 정상적인 데이터 입력
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');

-- 바비킴 회원이 자신의 ID를 변경해달라는 요청, VVK로 변경
UPDATE usertbl SET userID = 'VVK' WHERE userID='BBK';
-- 결과 : 외래키와 관련된 오류

-- 외래키 제약조건 비활성화 후 변경
SET foreign_key_checks = 0;
UPDATE usertbl SET userID = 'VVK' WHERE userID='BBK';
SET foreign_key_checks = 1;

-- 구매 테이블의 사용자에게 물품 배송을 위해, 회원 테이블과 조인
-- vvk로 바꾸었기 때문에 조인이 안됨
SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM buytbl B
     INNER JOIN usertbl U
        ON B.userid = U.userid ;
-- 결과 : 12건이 나와야 하는데 8건밖에 나오지 않음

-- 혹시 구매 테이블에 8건만 입력된 것인지 확인
SELECT COUNT(*) FROM buytbl;

-- 외부 조인으로 구매 테이블의 내용 모두 출력, USERID로 정렬
SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
   FROM buytbl B
     LEFT OUTER JOIN usertbl U
        ON B.userid = U.userid
   ORDER BY B.userid ;
-- 확인 결과 BBK아이디 가진 회원의 이름, 주소 등이 없음. 즉 USERTBL에 존재하지 않음

-- 바비킴의 아이디를 원래대로 돌려놓기
SET foreign_key_checks = 0;
UPDATE usertbl SET userID = 'BBK' WHERE userID='VVK';
SET foreign_key_checks = 1;

-- 회원 테이블의 USERID가 바뀌면 구매 테이블의 USERID가 자동으로 바뀍게끔
-- 외래키 제약조건 삭제하고 수행
ALTER TABLE buytbl
	DROP FOREIGN KEY FK_usertbl_buytbl;
ALTER TABLE buytbl 
	ADD CONSTRAINT FK_usertbl_buytbl
		FOREIGN KEY (userID)
		REFERENCES usertbl (userID)
		ON UPDATE CASCADE;

-- 바비킴의 ID 다시 변경하고 구매 테이블에도 반영되었는지 확인
UPDATE usertbl SET userID = 'VVK' WHERE userID='BBK';
SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
   FROM buytbl B
     INNER JOIN usertbl U
        ON B.userid = U.userid
  ORDER BY B.userid;

-- 바비킴이 회원 탈퇴하면 구매 기록도 삭제되는지 확인
DELETE FROM usertbl WHERE userID = 'VVK';
/* 외래 키 제약조건으로 인해 삭제되지 않음. 이런 경우에는 기존 테이블의 행 데이터 삭제시 
외래키 테이블의 연관 행데이터도 함께 삭제되도록*/

-- ON DELETE CASCADE 설정
ALTER TABLE buytbl
	DROP FOREIGN KEY FK_usertbl_buytbl;
ALTER TABLE buytbl 
	ADD CONSTRAINT FK_usertbl_buytbl
		FOREIGN KEY (userID)
		REFERENCES usertbl (userID)
		ON UPDATE CASCADE
		ON DELETE CASCADE;

-- 다시 삭제한 후 BUYTBL에도 따라 삭제되었는지 확인
DELETE FROM usertbl WHERE userID = 'VVK';
SELECT * FROM buytbl ;
-- 전체 8건만 남아 있는 것을 확인할 수 있음

-- ALTER TABLE로 출생년도 삭제
ALTER TABLE usertbl
	DROP COLUMN birthYear ;

-- </실습 5> --

USE tabledb;
SELECT userID, name, addr FROM usertbl;

USE tabledb;
CREATE VIEW v_usertbl
AS
	SELECT userid, name, addr FROM usertbl;

SELECT * FROM v_usertbl;  -- 뷰를 테이블이라고 생각해도 무방

SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
FROM usertbl U
  INNER JOIN buytbl B
     ON U.userid = B.userid ;

CREATE VIEW v_userbuytbl
AS
SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
FROM usertbl U
	INNER JOIN buytbl B
	 ON U.userid = B.userid ;

SELECT * FROM v_userbuytbl WHERE name = '김범수';


-- <실습 6> --

-- 6장의 실습2에서 sqldb 데이터 생성 코드를 그대로 갖고옴
drop database if exists sqldb;
create database sqldb;
 use sqldb;
CREATE TABLE usertbl -- 회원 테이블
( userID  	CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  name    	VARCHAR(10) NOT NULL, -- 이름
  birthYear   INT NOT NULL,  -- 출생년도
  addr	  	CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1	CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2	CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  -- 키
  mDate    	DATE  -- 회원 가입일
);
CREATE TABLE buytbl -- 회원 구매 테이블(Buy Table의 약자)
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   userID  	CHAR(8) NOT NULL, -- 아이디(FK)
   prodName 	CHAR(6) NOT NULL, --  물품명
   groupName 	CHAR(4)  , -- 분류
   price     	INT  NOT NULL, -- 단가
   amount    	SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (userID) REFERENCES usertbl(userID)
);
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);

-- 기본적인 뷰 생성
USE sqlDB;
CREATE VIEW v_userbuytbl
AS
   SELECT U.userid AS 'USER ID', U.name AS 'USER NAME', B.prodName AS 'PRODUCT NAME', 
		U.addr, CONCAT(U.mobile1, U.mobile2) AS 'MOBILE PHONE'
      FROM usertbl U
	INNER JOIN buytbl B
	 ON U.userid = B.userid;

SELECT `USER ID`, `USER NAME` FROM v_userbuytbl; -- 주의! 백틱을 사용한다.

-- 뷰 수정 : ALTER VIEW 구문 사용
ALTER VIEW v_userbuytbl
AS
   SELECT U.userid AS '사용자 아이디', U.name AS '이름', B.prodName AS '제품 이름', 
		U.addr, CONCAT(U.mobile1, U.mobile2)  AS '전화 번호'
      FROM usertbl U
          INNER JOIN buytbl B
             ON U.userid = B.userid ;

SELECT `이름`,`전화 번호` FROM v_userbuytbl;

-- 뷰 삭제
DROP VIEW v_userbuytbl;

-- 간단한 뷰 다시 생성
USE sqlDB;
CREATE OR REPLACE VIEW v_usertbl
AS
	SELECT userid, name, addr FROM usertbl;

-- 뷰의 정보 확인
DESCRIBE v_usertbl; 

-- 뷰의 소스코드 확인
-- 결과 출력 후 FORM EDITOR 클릭
SHOW CREATE VIEW v_usertbl;

-- V_USERTBL 뷰를 통해 데이터 수정
UPDATE v_usertbl SET addr = '부산' WHERE userid='JKW' ;

-- 데이터 입력
INSERT INTO v_usertbl(userid, name, addr) VALUES('KBM','김병만','충북') ;
-- BIRTHYEAR 값을 설정하지 않아서 값이 입력이 되지 않음
-- 이를 위해서는 BIRTHYEAR을 참조하고 있지 않으므로 값을 입력할 수 없다.

-- 그룹 함수를 포함하는 뷰 정의
-- SUM() 함수를 사용하는 뷰를 간단히 정의
CREATE VIEW v_sum
AS
	SELECT userid AS 'userid', SUM(price*amount) AS 'total'  
	   FROM buytbl GROUP BY userid;

SELECT * FROM v_sum;
-- V_SUM 뷰를 통해 데이터의 수정이 안됨
-- INFORMATION_SCHEMA의 VIEWS 테이블에서 전체 시스템에 저장된 뷰에 대한 다양한 정보 가지고 있음
SELECT * FROM INFORMATION_SCHEMA.VIEWS
     WHERE TABLE_SCHEMA = 'sqldb' AND TABLE_NAME = 'v_sum';

-- 지정한 범위로 뷰를 생성하고 데이터 입력
CREATE VIEW v_height177
AS
	SELECT * FROM usertbl WHERE height >= 177 ;

SELECT * FROM v_height177 ;

-- V_HEIGHT177 뷰에서 키가 177 이하인 데이터를 삭제
DELETE FROM v_height177 WHERE height < 177 ;

-- 키가 177 미만인 데이터 입력
INSERT INTO v_height177 VALUES('KBM', '김병만', 1977 , '경기', '010', '5555555', 158, '2023-01-01') ;
-- 조건이 맞지 않기 때문에 결과가 입력되지 않을 것임

/* 예상치 못한 데이터가 입력된 경우 대처하는 방법
키가 177 이상인 데이터만 입력되게 하는 조건 " WITH CHECK OPTION" 사용*/
ALTER VIEW v_height177
AS
	SELECT * FROM usertbl WHERE height >= 177
	    WITH CHECK OPTION ; -- 조건에 해당하는지 확인한 다음 입력

INSERT INTO v_height177 VALUES('WDT', '서장훈', 2006 , '서울', '010', '3333333', 155, '2023-3-3') ; -- 키가 177이 넘지 않기 때문에 입력이 되지 않음

CREATE VIEW v_userbuytbl
AS
  SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS mobile
   FROM usertbl U
      INNER JOIN buytbl B
         ON U.userid = B.userid ;

INSERT INTO v_userbuytbl VALUES('PKL','박경리','운동화','경기','00000000000','2023-2-2');
-- 2개 이상의 테이블로 조회하는 것은, insert, update가 안됨

-- 뷰가 참조하는 두 테이블 삭제
DROP TABLE IF EXISTS buytbl, usertbl;

-- 뷰 다시 조회해보기 : 참조하는 테이블이 없으면 조회할 수 없음
SELECT * FROM v_userbuytbl;

-- 뷰의 상태 체크
CHECK TABLE v_userbuytbl;

-- </실습 6> --


SHOW VARIABLES LIKE 'innodb_file_per_table';

SHOW VARIABLES LIKE 'innodb_data_file_path';

-- <실습 7> --

CREATE TABLESPACE ts_a ADD DATAFILE 'ts_a.ibd';
CREATE TABLESPACE ts_b ADD DATAFILE 'ts_b.ibd';
CREATE TABLESPACE ts_c ADD DATAFILE 'ts_c.ibd';

-- 간단히 CREATE TABLE문으로 테이블문 생성시 제일 뒤에 TABLESPACE문으로 저장하고자 하는 테이블스페이스를 지정하기만 하면 됨
USE sqldb;
CREATE TABLE table_a (id INT) TABLESPACE ts_a;

-- 테이블을 만든 후에 ALTER TABLE문으로 테이블스페이스를 변경할 수 있음
CREATE TABLE table_b (id INT);
ALTER TABLE table_b TABLESPACE ts_b;

CREATE TABLE table_c (SELECT * FROM employees.salaries);
ALTER TABLE table_c TABLESPACE ts_c;

DROP TABLE  table_c ;
CREATE TABLE table_c (SELECT * FROM employees.salaries);
ALTER TABLE table_c TABLESPACE ts_c;

-- </실습 7> --





