CREATE DATABASE IF NOT EXISTS NORMAL;
USE NORMAL;
CREATE TABLE TOTAL_TABLE (
    고객아이디 VARCHAR(20),
    이벤트번호 VARCHAR(10),
    당첨여부 CHAR(1),
    고객이름 VARCHAR(50),
    등급 ENUM('gold', 'vip', 'silver')
);

INSERT INTO TOTAL_TABLE (고객아이디, 이벤트번호, 당첨여부, 고객이름, 등급)
VALUES 
('apple', 'E001', 'Y', '정소화', 'gold'),
('apple', 'E005', 'N', '정소화', 'gold'),
('apple', 'E010', 'Y', '정소화', 'gold'),
('banana', 'E002', 'N', '김선우', 'vip'),
('banana', 'E005', 'Y', '김선우', 'vip'),
('carrot', 'E003', 'Y', '고명석', 'gold'),
('carrot', 'E007', 'Y', '고명석', 'gold'),
('orange', 'E004', 'N', '김용욱', 'silver');

INSERT INTO TOTAL_TABLE (고객아이디, 이벤트번호, 당첨여부, 고객이름, 등급)
VALUES ('melon', NULL, NULL, '성원용', 'gold');

UPDATE TOTAL_TABLE
SET 등급 = 'gold'
WHERE 고객아이디 = 'apple'
  AND 이벤트번호 = 'E010';

DELETE FROM TOTAL_TABLE
WHERE 고객아이디 = 'orange'
  AND 이벤트번호 = 'E004';
  
-- 원자값만 들어있으므로 제1정규형에는 맞음. ----------------

-- 제2정규형 과정 진행 --
CREATE TABLE CUSTOMER (
    고객아이디 VARCHAR(20) PRIMARY KEY,
    등급 ENUM('gold', 'vip', 'silver'),
    할인율 VARCHAR(10)
);

CREATE TABLE EVENTS (
    고객아이디 VARCHAR(20),
    이벤트번호 VARCHAR(10),
    당첨여부 CHAR(1),
    PRIMARY KEY (고객아이디, 이벤트번호),
    FOREIGN KEY (고객아이디) REFERENCES CUSTOMER(고객아이디)
);

INSERT INTO CUSTOMER (고객아이디, 등급, 할인율)
VALUES 
('apple', 'gold', '10%'),
('banana', 'vip', '20%'),
('carrot', 'gold', '10%'),
('orange', 'silver', '5%');

INSERT INTO EVENTS (고객아이디, 이벤트번호, 당첨여부)
VALUES
('apple', 'E001', 'Y'),
('apple', 'E005', 'N'),
('apple', 'E010', 'Y'),
('banana', 'E002', 'N'),
('banana', 'E005', 'Y'),
('carrot', 'E003', 'Y'),
('carrot', 'E007', 'Y'),
('orange', 'E004', 'N');

SELECT * FROM CUSTOMER;

SELECT * FROM EVENTS;


-- ⚠ 실행 오류 발생 가능 --> 삽입이상
INSERT INTO CUSTOMER (고객아이디, 등급, 할인율)
VALUES (NULL, 'bronze', '1%');

-- 데이터불일치 --> 수정이상
UPDATE CUSTOMER
SET 할인율 = '10%'
WHERE 고객아이디 = 'carrot';

SELECT * FROM CUSTOMER;

-- 삭제를 의도하지 않은 VIP 데이터 삭제됨 --> 삭제이상
DELETE FROM CUSTOMER
WHERE 고객아이디 = 'banana';

SELECT * FROM CUSTOMER;

-- 제3정규형

CREATE TABLE CUSTOMER2 (
    고객아이디 VARCHAR(20) PRIMARY KEY,
    등급 ENUM('gold', 'vip', 'silver')
);

CREATE TABLE CUSTOMER_LEVEL (
    등급 ENUM('gold', 'vip', 'silver') PRIMARY KEY,
    할인율 VARCHAR(10)
);

INSERT INTO CUSTOMER2 (고객아이디, 등급)
VALUES 
('apple', 'gold'),
('banana', 'vip'),
('carrot', 'gold'),
('orange', 'silver');

INSERT INTO CUSTOMER_LEVEL (등급, 할인율)
VALUES 
('gold', '10%'),
('vip', '20%'),
('silver', '5%');

-- JOIN으로 3개의 테이블 모두 검색
SELECT 
    e.고객아이디,
    e.이벤트번호,
    e.당첨여부,
    c.등급,
    cl.할인율
FROM EVENTS e
INNER JOIN CUSTOMER2 c ON e.고객아이디 = c.고객아이디
INNER JOIN CUSTOMER_LEVEL cl ON c.등급 = cl.등급;







