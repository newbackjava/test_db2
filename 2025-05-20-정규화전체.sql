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

SELECT * FROM total_table;

-- 삽입이상(NULL많이 생김)
INSERT INTO TOTAL_TABLE (고객아이디, 이벤트번호, 당첨여부, 고객이름, 등급)
VALUES ('ice', NULL, NULL, '홍길동', 'gold');

SELECT * FROM TOTAL_TABLE;

-- 갱신이상(정보불일치 현상 생김)
UPDATE TOTAL_TABLE
SET 등급 = 'vip'
WHERE 고객아이디 = 'apple'
  AND 이벤트번호 = 'E010';

SELECT * FROM TOTAL_TABLE;

-- 삭제이상(의도하지 않았던 정보까지 삭제됨)
DELETE FROM TOTAL_TABLE
WHERE 이벤트번호 = 'E004'; -- orange탈퇴

SELECT * FROM TOTAL_TABLE;

-- ------------------------------
use normal;

-- 제2정규형 과정 진행 --
-- pk에 의해서 다른 컬럼들이 전부 결정되어야한다.
-- 완전종속이 되어야한다.(부분종속이 있으면 안된다.)
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

SELECT * FROM CUSTOMER;

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

-- 데이터 불일치 --> 수정이상
UPDATE CUSTOMER
SET 할인율 = '15%'
WHERE 고객아이디 = 'carrot';

SELECT * FROM CUSTOMER;

-- 삭제를 의도하지 않은 VIP 데이터 삭제됨 --> 삭제이상
DELETE FROM CUSTOMER
WHERE 고객아이디 = 'banana'; -- pk설정

-- 외래키가 설정되어있는 경우 외래키로 설정되어있는
-- 외부테이블부터 먼저 지우고 pk를 지워야한다.!
DELETE FROM EVENTS
WHERE 고객아이디 = "banana"; -- fk설정

SELECT * FROM CUSTOMER;


-- ------------------------------
-- 제3정규형
use normal;
CREATE TABLE CUSTOMER2 (
                           고객아이디 VARCHAR(20) PRIMARY KEY,
                           등급 ENUM('gold', 'vip', 'silver')
);

CREATE TABLE CUSTOMER_LEVEL (
                                등급 ENUM('gold', 'vip', 'silver', 'vvip') PRIMARY KEY,
                                할인율 VARCHAR(10)
);

INSERT INTO CUSTOMER2 (고객아이디, 등급)
VALUES
    ('apple', 'gold'),
    ('banana', 'vip'),
    ('carrot', 'gold'),
    ('orange', 'silver');

SELECT * FROM CUSTOMER2;

INSERT INTO CUSTOMER_LEVEL (등급, 할인율)
VALUES
    ('gold', '10%'),
    ('vip', '20%'),
    ('silver', '5%');

SELECT * FROM CUSTOMER_LEVEL;

INSERT INTO CUSTOMER_LEVEL VALUES ('vvip', '30%');

desc CUSTOMER_LEVEL;

DELETE FROM CUSTOMER_LEVEL
WHERE 등급 = 'vvip';

UPDATE CUSTOMER_LEVEL
SET 할인율 = '40%'
WHERE 등급 = 'vip';


