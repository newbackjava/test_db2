
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

