create database joindb;

use joindb; -- 사용할 기본 db선택!

CREATE TABLE COMPANY (
    ID VARCHAR(50) PRIMARY KEY,
    NAME VARCHAR(100),
    ADDR VARCHAR(200),
    TEL VARCHAR(20)
);

CREATE TABLE PRODUCT (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    CONTENT VARCHAR(100),
    PRICE INT,
    COMPANY VARCHAR(50),
    IMG VARCHAR(50),
    FOREIGN KEY (COMPANY) REFERENCES COMPANY(ID)
);

INSERT INTO company (ID, NAME, ADDR, TEL) VALUES
('c100', 'good', 'seoul', '011'),
('c200', 'joa', 'busan', '012'),
('c300', 'maria', 'ulsan', '013'),
('c400', 'my', 'kwangju', '014');

INSERT INTO PRODUCT (ID, NAME, CONTENT, PRICE, COMPANY, IMG) VALUES
(110, 'food11', 'fun food11', 11000, NULL, '11.png'),
(111, 'food12', 'fun food12', 12000, NULL, '12.png'),
(100, 'food1', 'fun food1', 1000, 'c100', '1.png'),
(101, 'food2', 'fun food2', 2000, 'c200', '2.png'),
(102, 'food3', 'fun food3', 3000, 'c300', '3.png'),
(103, 'food4', 'fun food4', 4000, 'c300', '4.png'),
(104, 'food5', 'fun food5', 5000, 'c100', '5.png'),
(105, 'food6', 'fun food6', 6000, 'c100', '6.png'),
(106, 'food7', 'fun food7', 7000, 'c200', '7.png'),
(107, 'food8', 'fun food8', 8000, 'c300', '8.png'),
(108, 'food9', 'fun food9', 9000, 'c100', '9.png'),
(109, 'food10', 'fun food10', 10000, 'c100', '10.png');

SELECT * FROM PRODUCT;

SELECT * FROM company;

SELECT max(PRICE) FROM PRODUCT; -- 12000

SELECT ID, NAME, PRICE 
FROM PRODUCT
WHERE PRICE = (SELECT max(PRICE) FROM PRODUCT); -- PRICE = 12000





-- 서브쿼리의 결과가 여러개가 나올 가능성이 있는 경우 --> IN, NOT IN
SELECT NAME, PRICE
FROM PRODUCT
WHERE COMPANY IN (SELECT ID FROM COMPANY WHERE NAME = 'maria'); -- c300, c500


SELECT NAME, PRICE
FROM PRODUCT
WHERE PRICE > ANY (
    SELECT PRICE FROM PRODUCT WHERE COMPANY = 'c100'
);

SELECT NAME, PRICE
FROM PRODUCT
WHERE PRICE > ALL (
    SELECT PRICE FROM PRODUCT WHERE COMPANY = 'c100' -- 10000, 9000, 8000
);

-- ---------------조인 테스트---------------
use joindb;

SELECT
	C.ID AS CID,
    C.NAME AS CNAME,
    P.NAME AS PNAME
FROM PRODUCT P
INNER JOIN COMPANY C
ON P.COMPANY = C.ID;

-- left outer join
-- 모든 제품과 그 제품을 만든 회사의 이름을 조회하세요. 회사 정보가 없는 제품도 포함합니다.

SELECT 
	C.ID AS CID,
	P.ID AS Product_ID, 
	P.NAME AS Product_Name, 
	C.NAME AS Company_Name
FROM PRODUCT P
LEFT OUTER JOIN COMPANY C 
ON P.COMPANY = C.ID;

SELECT 
	C.ID AS CID,
	P.ID AS Product_ID, 
	P.NAME AS Product_Name, 
	C.NAME AS Company_Name
FROM PRODUCT P
RIGHT OUTER JOIN COMPANY C 
ON P.COMPANY = C.ID;

-- 셀프조인
CREATE TABLE emptbl(emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));

INSERT INTO empTbl (emp, manager, empTel) VALUES
('나사장', NULL, '0000'),
('김재무', '나사장', '2222'),
('김부장', '김재무', '2222-1'),
('이부장', '김재무', '2222-2'),
('우대리', '이부장', '2222-2-1'),
('지사원', '이부장', '2222-2-2'),
('이영업', '나사장', '1111'),
('한과장', '이영업', '1111-1'),
('최정보', '나사장', '5355'),
('윤차장', '최정보', '3355-1'),
('이주임', '윤자장', '5335-1-1');

select * from empTbl;

delete from empTbl;

SELECT 
	A.EMP AS '찾을사람이름',
    B.EMP AS '상관이름',
    B.EMPTEL AS '상관연락처'
FROM empTbl A
INNER JOIN empTbl B
ON A.MANAGER = B.EMP
WHERE A.EMP = '우대리';

CREATE TABLE `company` (
  `ID` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ADDR` varchar(200) DEFAULT NULL,
  `TEL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;














