use sqldb;

-- 데이터 형식 변환 함수
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl ;
-- 또는
SELECT CONVERT(AVG(amount) , SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl ;

-- 암시적인 형 변환
SELECT '100' + '200';        -- 문자와 문자를 더함(정수로 변환되서 연산됨)
SELECT CONCAT('100', '200'); -- 문자와 문자를 연결(문자로 처리)
SELECT CONCAT(100, '200');   -- 정수와 문자를 연결(정수가 문자로 변환되서 처리)

SELECT 1 > '2mega';    -- 정수인 2로 변환되어서 비교
SELECT 3 > '2MEGA';    -- 정수인 2로 변환되어서 비교
SELECT 0 = 'mega2';    -- 문자는 0으로 변환됨

-- 제어 흐름 함수
SELECT IF (100>200, '참이다', '거짓이다');


SELECT CASE 10
       WHEN 1 THEN '일'
       WHEN 5 THEN '오'
       WHEN 10 THEN '십'
       END AS 'CASE연습';

-- 문자열 함수
SELECT ASCII('A'), CHAR(65);

SELECT CONCAT_WS('/', '2025', '01', '01');

SELECT u.userID, u.name, GROUP_CONCAT(b.prodName SEPARATOR ',') AS '상품목록'
FROM usertbl u
   LEFT OUTER JOIN buytbl b
   ON u.userID = b.userID
GROUP BY u.userID, u.name
ORDER BY u.userID;

SELECT INSERT('abcdefghi', 3, 4, '@@@@'), INSERT('abcdefghi', 3, 2, '@@@@');

SELECT LEFT('abcdefghi' , 3), RIGHT('abcdefghi' , 3);

SELECT TRIM('    이것이    '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋㅋ');

SELECT REPLACE('이것이 MySQL이다', '이것이', 'This is');

SELECT SUBSTRING('대한민국만세', 3, 2);

-- 조인
USE sqldb;


-- INNEER JOIN
SELECT *
  FROM buytbl
    INNER JOIN usertbl
      ON buytbl.userID = usertbl.userID
WHERE buytbl.userID = 'JYP';


-- OUTER JOIN
SELECT U.userID, U.name, B.prodName, U.addr,
       CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl U
  LEFT OUTER JOIN buytbl B
    ON U.userID = B.userID
ORDER BY U.userID;

-- 3개의 테이블 조인
CREATE TABLE stdtbl (
  stdName VARCHAR(10) NOT NULL PRIMARY KEY,
  addr CHAR(4) NOT NULL
);

CREATE TABLE clubtbl (
  clubName VARCHAR(10) NOT NULL PRIMARY KEY,
  roomNo CHAR(4) NOT NULL
);

CREATE TABLE stdclubtbl(
  num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
  stdName VARCHAR(10) NOT NULL,
  clubName VARCHAR(10) NOT NULL,
  FOREIGN KEY(stdName) REFERENCES stdtbl(stdName),
  FOREIGN KEY(clubName) REFERENCES clubtbl(clubName)
);


SELECT S.stdName, S.addr, SC.clubName, C.roomNo
FROM stdtbl S
  INNER JOIN stdclubtbl SC
     ON S.stdName = SC.stdName
  INNER JOIN clubtbl C
     ON SC.clubName = C.clubName
ORDER BY S.stdName;


SELECT C.clubName, C.roomNo, S.stdName, S.addr
FROM stdtbl S
  INNER JOIN stdclubtbl SC
    ON SC.stdName = S.stdName
  INNER JOIN clubtbl C
    ON SC.clubName = C.clubName
ORDER BY C.clubName;

-- CROSS JOIN
USE employees;

SELECT COUNT(*) AS '데이터개수'
FROM employees
  CROSS JOIN titles;

-- SELF JOIN
USE sqldb;

CREATE TABLE emptbl(emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));
INSERT INTO empTbl VALUES('나사장', NULL, '0000');
INSERT INTO empTbl VALUES('김재무', '나사장', '2222');
INSERT INTO empTbl VALUES('김부장', '김재무', '2222-1');
INSERT INTO empTbl VALUES('이부장', '김재무', '2222-2');
INSERT INTO empTbl VALUES('우대리', '이부장', '2222-2-1');
INSERT INTO empTbl VALUES('지사원', '이부장', '2222-2-2');
INSERT INTO empTbl VALUES('이영업', '나사장', '1111');
INSERT INTO emptbl VALUES('한과장', '이영업', '1111-1');
INSERT INTO empTbl VALUES('최정보', '나사장', '5355');
INSERT INTO empTbl VALUES('윤차장', '최정보','3355-1');
INSERT INTO empTbl VALUES('이주임', '윤자장', '5335-1-1');

SELECT * FROM empTbl;

SELECT A.emp AS '부하직원', B.emp AS '직속상관', B.empTel AS '직속상관연락처'
FROM empTbl A
  INNER JOIN empTbl B
  ON A.manager = B.emp
WHERE A.emp = '우대리';


USE sqldb;

SELECT stdName, addr FROM stdtbl
  UNION ALL
SELECT clubName, roomNo FROM clubtbl;

-- NOT IN / IN
SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' FROM usertbl
WHERE name NOT IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);



SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' FROM usertbl
WHERE name IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);


