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