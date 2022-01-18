USE employees;

SELECT * FROM employees;

SELECT * FROM titles;
SELECT * FROM employees.titles;
SELECT first_name FROM employees;

-- <실습 1> --

SHOW DATABASES;
USE employees;
SHOW TABLE STATUS;
SHOW TABLES;
DESCRIBE employees; -- 또는 desc employees;
SELECT first_name,gender FROM employees;

drop database if exists sqldb;
create database sqldb;
USE sqldb;
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

SELECT * FROM usertbl;
SELECT * FROM buytbl;

USE sqldb;
SELECT * FROM usertbl;
SELECT * FROM usertbl WHERE name = '김경호';
SELECT userID, Name from usertbl where birthYear >=1970 and height >=182;
SELECT name, height FROM usertbl WHERE height >= 180 AND height <= 183;
SELECT name, height FROM usertbl WHERE height BETWEEN 180 AND 183;
SELECT name, addr FROM usertbl WHERE addr='경남' OR  addr='전남' OR addr='경북';

SELECT name, addr FROM usertbl WHERE addr IN ('경남','전남','경북');

SELECT name, height FROM usertbl WHERE name LIKE '김%';

SELECT name, height FROM usertbl WHERE name LIKE '_종신';

SELECT name, height FROM usertbl WHERE height  > 177;

select name,height from usertbl 
	where height>(select height from usertbl where Name='김경호'); -- 김경호보다 키가 큰 사람

select name,height from usertbl
	where height >= (select height from usertbl where addr='경남');
    
SELECT name, height FROM usertbl 
   WHERE height >= ANY (SELECT height FROM usertbl WHERE addr = '경남'); -- any가 둘중 하나라도 포함되면 출력(or의 기능)
   
select name, height from usertbl
	where height >= all(select height from usertbl where addr='경남');
    
SELECT name, height FROM usertbl 
   WHERE height = ANY (SELECT height FROM usertbl WHERE addr = '경남');
   
SELECT name, height FROM usertbl 
  WHERE height IN (SELECT height FROM usertbl WHERE addr = '경남');
  
select name, mDate from usertbl order by mDate;

select name, mDate from usertbl order by mDate desc;

select name, height from usertbl order by height desc, name asc;

SELECT addr FROM usertbl;

SELECT addr FROM usertbl ORDER BY addr;

SELECT DISTINCT addr FROM usertbl;

USE employees;
SELECT emp_no, hire_date FROM employees 
   ORDER BY hire_date ASC;

SELECT emp_no,hire_date FROM employees ORDER BY hire_date ASC LIMIT 5;

SELECT emp_no,hire_date FROM employees ORDER BY hire_date ASC LIMIT 0,5; -- limit 5 offset 0과 동일 (0부터 5개)

use sqldb;
create table buytbl2 (select * from buytbl);
select * from buytbl2;

CREATE TABLE buytbl3 (SELECT userID, prodName FROM buytbl);
SELECT * FROM buytbl3;

SELECT userID, amount FROM buytbl ORDER BY userID;

select userID, SUM(amount) FROM buytbl GROUP BY userID;

select userID as '사용자 아이디', sum(amount) as '총 구매 개수' from buytbl group by userID; -- Alias(별칭) 줘서 출력

SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총 구매액'  
   FROM buytbl GROUP BY userID;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl ;

SELECT userID, AVG(amount) AS '평균 구매 개수' FROM buytbl  GROUP BY userID;

SELECT name, MAX(height), MIN(height) FROM usertbl;

SELECT name, MAX(height), MIN(height) FROM usertbl GROUP BY Name;

SELECT name, height
   FROM usertbl 
   WHERE height = (SELECT MAX(height)FROM usertbl) 
       OR height = (SELECT MIN(height)FROM usertbl);
       
SELECT COUNT(*) FROM usertbl;

SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;

USE sqldb;
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buytbl 
   GROUP BY userID ;
       
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buytbl 
   GROUP BY userID ;
       
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buytbl 
   WHERE SUM(price*amount) > 1000  -- 오류가 나오는 부분 (where절에 나타날 수 없음)
   GROUP BY userID ;
   
   SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buytbl 
   GROUP BY userID
   HAVING SUM(price*amount) > 1000 ;
   
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buytbl 
   GROUP BY userID
   HAVING SUM(price*amount) > 1000 
   ORDER BY SUM(price*amount) ;
   
SELECT num, groupName, SUM(price * amount) AS '비용' 
   FROM buytbl
   GROUP BY  groupName, num
   WITH ROLLUP;
   
SELECT groupName, SUM(price * amount) AS '비용' 
   FROM buytbl
   GROUP BY  groupName
   WITH ROLLUP;
   
USE  sqldb;   
CREATE TABLE testTbl1 (id  int, userName char(3), age int);
INSERT INTO testTbl1 VALUES (1, '홍길동', 25);
INSERT INTO testTbl1(id, userName) VALUES (2, '설현'); -- 특정 열만 입력하기 위해 해당 칼럼 지정
INSERT INTO testTbl1(userName, age, id) VALUES ('하니', 26,  3);

USE  sqldb;
CREATE TABLE testTbl2 
  (id  int AUTO_INCREMENT PRIMARY KEY,  -- AUTO_INCREMENT는 자동으로 1부터 증가, PRIMARY KEY로 지정해야함
   userName char(3), 
   age int );
INSERT INTO testTbl2 VALUES (NULL, '지민', 25);
INSERT INTO testTbl2 VALUES (NULL, '유나', 22);
INSERT INTO testTbl2 VALUES (NULL, '유경', 21);

SELECT * FROM testTbl2;  

SELECT LAST_INSERT_ID(); 

ALTER TABLE testTbl2 AUTO_INCREMENT=100; -- 증가값 100으로 변경

INSERT INTO testTbl2 VALUES (NULL, '찬미', 23);

SELECT * FROM testTbl2;

USE  sqldb;
CREATE TABLE testTbl3 
  (id  int AUTO_INCREMENT PRIMARY KEY, 
   userName char(3), 
   age int );
ALTER TABLE testTbl3 AUTO_INCREMENT=1000;
SET @@auto_increment_increment=3; -- 증가값 지정 (3씩 증가)
INSERT INTO testTbl3 VALUES (NULL, '나연', 20);
INSERT INTO testTbl3 VALUES (NULL, '정연', 18);
INSERT INTO testTbl3 VALUES (NULL, '모모', 19);
SELECT * FROM testTbl3;

USE sqldb;
CREATE TABLE testTbl4 (id int, Fname varchar(50), Lname varchar(50));
INSERT INTO testTbl4 
  SELECT emp_no, first_name, last_name
    FROM employees.employees ;
    
USE sqldb;
CREATE TABLE testTbl5 
   (SELECT emp_no, first_name, last_name  FROM employees.employees) ;
   
UPDATE testTbl4
    SET Lname = '없음'
    WHERE Fname = 'Kyoichi';
    
USE sqldb;
UPDATE buytbl SET price = price * 1.5 ;

USE sqldb;
DELETE FROM testTbl4 WHERE Fname = 'Aamer';

DELETE FROM testTbl4 WHERE Fname = 'Aamer'  LIMIT 5;

-- 실습3 --

USE sqldb;
CREATE TABLE bigTbl1 (SELECT * FROM employees.employees);
CREATE TABLE bigTbl2 (SELECT * FROM employees.employees);
CREATE TABLE bigTbl3 (SELECT * FROM employees.employees);

DELETE FROM bigTbl1;
DROP TABLE bigTbl2;
TRUNCATE TABLE bigTbl3;

-- <실습 4> --

use sqldb;
CREATE TABLE memberTBL (SELECT userID, name, addr FROM usertbl LIMIT 3); -- 3건만 가져옴
ALTER TABLE memberTBL 
	ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID); -- PK를 지정함
SELECT * FROM memberTBL;

INSERT INTO memberTBL VALUES('BBK' , '비비코', '미국');
INSERT INTO memberTBL VALUES('SJH' , '서장훈', '서울');
INSERT INTO memberTBL VALUES('HJY' , '현주엽', '경기');
SELECT * FROM memberTBL;

INSERT IGNORE INTO memberTBL VALUES('BBK' , '비비코', '미국');
INSERT IGNORE INTO memberTBL VALUES('SJH' , '서장훈', '서울');
INSERT IGNORE INTO memberTBL VALUES('HJY' , '현주엽', '경기');
SELECT * FROM memberTBL;

INSERT INTO memberTBL VALUES('BBK' , '비비코', '미국')
	ON DUPLICATE KEY UPDATE name='비비코', addr='미국';
INSERT INTO memberTBL VALUES('DJM' , '동짜몽', '일본')
	ON DUPLICATE KEY UPDATE name='동짜몽', addr='일본';
SELECT * FROM memberTBL;

USE sqldb;
SELECT userid AS '사용자', SUM(price*amount) AS '총구매액'  
  FROM buyTBL GROUP BY userid;
  
WITH abc(userid, total)
AS
(SELECT userid, SUM(price*amount)  
  FROM buyTBL GROUP BY userid )
SELECT * FROM abc ORDER BY total DESC ;

WITH cte_usertbl(addr, maxHeight)
AS
  ( SELECT addr, MAX(height) FROM usertbl GROUP BY addr)
SELECT AVG(maxHeight*1.0) AS '각 지역별 최고키의 평균' FROM cte_usertbl;