DROP DATABASE tabledb;
CREATE DATABASE tabledb;

USE tabledb;

DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl(
    userID     CHAR(8) NOT NULL PRIMARY KEY,
    name       VARCHAR(10) NOT NULL,
    birthYear  INT NOT NULL,
    addr       CHAR(2) NOT NULL,
    mobile1    CHAR(3) NULL,
    mobile2    CHAR(8) NULL,
    height     SMALLINT NULL,
    mDate      DATE NULL
);

DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl(
  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  userid CHAR(8) NOT NULL,
  prodName CHAR(6) NOT NULL,
  groupName CHAR(4) NULL,
  price INT NOT NULL,
  amount SMALLINT NOT NULL,
  FOREIGN KEY(userid) REFERENCES usertbl(userID)
);

-- 회원 테이블 데이터 입력
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

-- 구매 테이블 데이터 입력
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화' , NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);


-- 기본키 제약조건

DROP TABLE IF EXISTS usertbl2;

CREATE TABLE usertbl2 (
  userID CHAR(8) NOT NULL,
  name VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL,
  CONSTRAINT PRIMARY KEY PK_userTBL_userID(userID)
);



-- 복합키 제약조건
DROP TABLE IF EXISTS prodtbl;

CREATE TABLE prodTbl (
  prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4) NOT NULL,
  prodDate DATETIME NOT NULL,
  prodCur  CHAR(10) NULL,
  CONSTRAINT PK_prodtbl_proCode_prodID
             PRIMARY KEY (prodCode, prodID)
);



-- 외례키 제약 조건
DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL(
  userID    CHAR(8) NOT NULL PRIMARY KEY,
  name      VARCHAR(1) NOT NULL,
  birthYear INT NOT NULL
);

CREATE TABLE buyTBL
(
  num      INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  userID   CHAR(8) NOT NULL,
  prodName CHAR(6) NOT NULL,
  FOREIGN KEY(userID) REFERENCES userTBL(userID)
);

-- 외래 키 생성 방법 2 ALTER TABLE 구문 이용 
DROP TABLE IF EXISTS buyTBL;

CREATE TABLE buyTBL (
  num  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  userID CHAR(8) NOT NULL,
  prodName CHAR(6) NOT NULL
);

ALTER TABLE buyTBL
  ADD CONSTRAINT FK_userTBL_buyTBL
  FOREIGN KEY(userID)
  REFERENCES userTBL(userID);
  
--  UNIQUE 제약 조건  
  
USE tableDB;

DROP TABLE IF EXISTS buyTBL, userTBL;

CREATE TABLE userTBL (
  userID    CHAR(8) NOT NULL PRIMARY KEY,
  name      VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL,
  email     CHAR(30) NULL UNIQUE
);
  
-- CHECK 제약 조건
DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL( 
  userID    CHAR(8) PRIMARY KEY,
  name      VARCHAR(10),
  birthYear INT CHECK (birthYear >= 1900 AND birthyear <= 2023),
  mobile1   CHAR(3) NULL,
  CONSTRAINT CK_name CHECK ( name IS NOT NULL)
);


-- DEFAULT
DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL(
  userID    CHAR(8) NOT NULL PRIMARY KEY,
  name      VARCHAR(10) NOT NULL,
  birthyear INT NOT NULL DEFAULT -1,
  addr      CHAR(2) NOT NULL DEFAULT '서울',
  mobile1   CHAR(3) NULL,
  mobi1e2   CHAR(8) NULL,
  height    SMALLINT NULL DEFAULT 170,
  mDate     DATE NULL
);

-- default문은 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO usertbl VALUES ('LHL', '이혜리', default, default,'011', '1234567', 
                            default, '2023.12.12');

-- 열 이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO usertbl(userID, name) VALUES('KAY', '김아영');

-- 값이 직접 명기되면 DEFAULT로 설정된 값은 무시된다.
INSERT INTO usertbl VALUES ('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2020.5.5');

SELECT * FROM usertbl;


-- ALTER
USE tabledb;

ALTER TABLE usertbl
ADD homepage VARCHAR(30) -- 열 추가
    DEFAULT 'http://www.hanbit.co.kr' -- 디폴트 값
    NULL;  -- NULL 허용함


ALTER TABLE usertbl
DROP COLUMN mobile1;

ALTER TABLE usertbl
CHANGE COLUMN name uName VARCHAR(20) NULL;

ALTER TABLE usertbl
DROP PRIMARY KEY;


-- 뷰
USE sqldb;

CREATE VIEW v_usertbl
AS
SELECT userid, name, addr FROM usertbl;


SELECT * FROM v_usertbl;  -- 뷰를 테이블이라고 생각해도 무방


CREATE VIEW v_userbuytbl
AS
SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl U
  INNER JOIN buytbl B
     ON U.userid = B.userid;

SELECT * FROM v_userbuytbl WHERE name = '김범수';

SHOW VARIABLES LIKE 'innodb_data_file_path';

