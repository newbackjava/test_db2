USE employees;

SELECT * FROM employees.titles;
SELECT * FROM titles;

SELECT first_name FROM employees;

SELECT first_name, last_name, gender FROM employees;


SHOW DATABASES;

SHOW TABLES;

DESCRIBE employees; 
-- 또는 
DESC employees;


SELECT first_name AS 이름, gender AS 성별, hire_date '회사 입사일'
FROM employees;


-- sqlDB.sql 실행 후 
use sqldb;

SELECT * FROM usertbl
WHERE name = '김경호';


SELECT userid, name FROM usertbl
WHERE birthyear >= 1970 AND height >= 182;


SELECT name, height FROM usertbl
WHERE height BETWEEN 180 AND 183;


SELECT name, addr FROM usertbl
WHERE addr IN ('경남', '전남', '경북');


SELECT name, height FROM usertbl
WHERE name LIKE '김%';


SELECT name, height FROM usertbl WHERE height > 177;

SELECT name, height FROM usertbl 
WHERE height > (SELECT height FROM usertbl WHERE name = '김경호');

-- 에러 발생
SELECT name, height FROM usertbl
WHERE height >= (SELECT height FROM usertbl WHERE addr = '경남');

SELECT name, height FROM usertbl
WHERE height >= ANY (SELECT height FROM usertbl WHERE addr = '경남');

SELECT name, height FROM usertbl
WHERE height = ANY (SELECT height FROM usertbl WHERE addr = '경남');

SELECT name, height FROM usertbl
WHERE height IN (SELECT height FROM usertbl WHERE addr = '경남');


SELECT name, height FROM usertbl
WHERE height > ALL (SELECT height FROM usertbl WHERE addr = '경남');

SELECT name, mDate FROM usertbl ORDER BY mDate ASC;


SELECT name, mDate FROM usertbl ORDER BY mDate;

SELECT name, mDate FROM usertbl ORDER BY mDate DESC;

SELECT name, height FROM usertbl ORDER BY height DESC, name ASC;

SELECT name, height FROM usertbl ORDER BY height DESC, name;


SELECT addr FROM usertbl;

SELECT addr FROM usertbl ORDER BY addr;

SELECT DISTINCT addr FROM usertbl;



USE employees;

SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC;


SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 5;


SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 0, 5; -- LIMIT 5 OFFSET 0과 동일


USE sqldb;

CREATE TABLE buytbl2 (SELECT * FROM buytbl);

SELECT * FROM buytbl2;

CREATE TABLE buytbl3 (SELECT userID, prodName FROM buytbl);

SELECT * FROM buytbl3;


SELECT userID, SUM(amount) FROM buytbl GROUP BY userID;


SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수'
FROM buytbl
GROUP BY userID;

SELECT userID AS '사용자 아이디', SUM(amount*price) AS '총 구매액'
FROM buytbl
GROUP BY userID;


SELECT AVG(amount) AS '평균 구매 개수'
FROM buytbl;


SELECT userID, AVG(amount) AS '평균 구매 개수'
FROM buytbl
GROUP BY userID;


-- 에러 
SELECT name, MAX(height), MIN(height)
FROM usertbl;

SELECT name, MAX(height), MIN(height)
FROM usertbl
GROUP BY name;



SELECT name, height
FROM usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
   OR height = (SELECT MIN(height) FROM usertbl);


-- COUNT 함수
SELECT COUNT(*) FROM usertbl;

SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자'
FROM usertbl;


-- HAVING 절

-- 사용자별 총 구매액
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'
FROM buytbl
GROUP BY userID;

-- Having 절 사용
SELECT userID AS '사용자', SUM(price*amount) AS '종구매액'
FROM buytbl
GROUP BY userID
HAVING SUM(price * amount) > 1000;


-- ROLLUP
SELECT num, groupName, SUM(price * amount) AS '비용'
FROM buytbl
GROUP BY groupName, num
WITH ROLLUP;

SELECT groupName, SUM(price * amount) AS '비용'
FROM buytbl
GROUP BY groupName
WITH ROLLUP;


-- 2. 데이터의 변경을 위한 SQL문
-- INSERT

USE sqldb;
CREATE TABLE testTbl1(id INT, username CHAR(3), age INT);

INSERT INTO testTbl1 VALUES(1, '홍길동', 25);

INSERT INTO testTbl1(id, userName) VALUES(2, '설현');

INSERT INTO testTbl1(username, age, id) VALUES('하나', 26, 3);


USE sqldb;
CREATE TABLE testTbl2(
  id INT AUTO_INCREMENT PRIMARY KEY,
  userName CHAR(3),
  age INT
);

INSERT INTO testTbl2 VALUES (NULL, '지인', 25);
INSERT INTO testTbl2 VALUES (NULL, '유나', 22);
INSERT INTO testTbl2 VALUES (NULL, '유경' , 21);
SELECT * FROM testTbl2;


USE sqldb;
CREATE TABLE testTbl4(id INT, Fname VARCHAR(50), Lname VARCHAR(50));
INSERT INTO testTbl4
SELECT emp_no, first_name, last_name
FROM employees.employees;

SELECT * FROM testTbl4;

-- UPDATE문

UPDATE testTbl4
SET Lname = '없음'
WHERE Fname = 'Kyoichi';

UPDATE buytbl
SET price = price * 1.5;


-- DELETE 문
DELETE FROM testTbl4
WHERE Fname = 'Aamer';

DELETE FROM testTbl4
WHERE Fname = 'Aamer' LIMIT 5;



