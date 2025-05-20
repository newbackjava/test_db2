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

