
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

-- 값 넣을 때 외래키가 연결되어있지 않은 것부터 넣어야함.
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
-- --> insert문 결과: int값(row수)

use tabledb;
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);

-- 외래키로 설정된 항목에 JYP값이 없으므로 에러(참조 무결성 에러)
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1); 
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`tabledb`.`buytbl`, CONSTRAINT `buytbl_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `usertbl` (`userID`))	0.015 sec

SELECT * FROM usertbl;

SELECT * FROM buytbl;

-- ✅ 기본키 제약조건

DROP TABLE IF EXISTS usertbl2;

CREATE TABLE usertbl2 (
  userID CHAR(8) NOT NULL,
  name VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL,
  CONSTRAINT PRIMARY KEY PK_userTBL_userID(userID)
);

-- ✅ 기본키(복합키) 제약조건
-- 두 컬럼의 조합이 유일해야 함

DROP TABLE IF EXISTS prodtbl;

CREATE TABLE prodTbl (
  prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4) NOT NULL,
  prodDate DATETIME NOT NULL,
  prodCur  CHAR(10) NULL,
  CONSTRAINT PK_prodtbl_proCode_prodID
             PRIMARY KEY (prodCode, prodID)
);

INSERT INTO prodTbl VALUES ('A01', 'P100', '2023-01-01 10:00:00', 'USD');
INSERT INTO prodTbl VALUES ('A01', 'P101', '2023-01-02 11:00:00', 'EUR');
INSERT INTO prodTbl VALUES ('B02', 'P100', '2023-01-03 12:00:00', 'KRW');
INSERT INTO prodTbl VALUES ('A01', 'P100', '2023-02-01 13:00:00', 'JPY'); -- X

SELECT * FROM prodTbl;

DESC prodTbl;

-- ✅ 외래키 제약조건

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

DESC buyTBL;

-- userTBL에 사용자 먼저 등록
INSERT INTO userTBL VALUES ('USER001', '김', 1990);
INSERT INTO userTBL VALUES ('USER002', '이', 1992);

-- buyTBL에 구매정보 등록 (존재하는 userID 사용)
-- userId는 pk가 설정되어있어서 중복X(unique), not null 자동체크해줌.
-- 엔터티(대상)에 문제가 없는 데이터가 들어가게 됨.
-- 개체 무결성(pk설정해서 not null, unique설정함) 
INSERT INTO buyTBL (userID, prodName) VALUES ('USER001', '운동화');
INSERT INTO buyTBL (userID, prodName) VALUES ('USER002', '노트북');
INSERT INTO buyTBL (userID, prodName) VALUES ('USER002', '마우스');

SELECT * FROM buyTBL;

-- userId가 fk가 설정되어있어서 원본테이블의 값과 동일한 값들이 들어가는지 자동체크해줌.
-- 레퍼런스(참조, 연결)가 문제가 없는 데이터가 들어가게 됨.
-- 참조 무결성(fk설정해서 원본과 일치하는 데이터가 들어가게 설정함.)
-- 존재하지 않는 사용자 ID
INSERT INTO buyTBL (userID, prodName) VALUES ('USER999', '키보드'); -- X
-- ERROR 1452 (23000): Cannot add or update a child row: 
-- a foreign key constraint fails (`yourdb`.`buyTBL`, CONSTRAINT `buyTBL_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userTBL` (`userID`))



-- ✅ 외래키 제약조건(테이블 생성 후, 나중에 제약조건 추가 --> alt table을 사용)

DROP TABLE IF EXISTS buyTBL;

-- AUTO_INCREMENT는 MySQL에서 숫자형 기본 키를 자동으로 증가시키는 기능
CREATE TABLE buyTBL (
  num  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  userID CHAR(8) NOT NULL,
  prodName CHAR(6) NOT NULL
);

-- pk인 경우, autoincrement설정시 not null생략 가능
-- autoincrement는 int(다른 정수타입도)타입인 경우만 가능
-- primary key에 not null을 포함하므로 생략 가능
-- MySQL은 AUTO_INCREMENT가 붙은 컬럼에 대해 자동으로 NOT NULL 속성을 강제 적용
-- unique인 경우 null, not null 여부와 관련없이 auto_increment unique하면
-- not null로 동작함. 아래 1,2,3은 동일하게 동작
-- 1)userID INT AUTO_INCREMENT UNIQUE
-- 2)userID INT NULL AUTO_INCREMENT UNIQUE(비추천)
-- 3)userID INT NOT NULL AUTO_INCREMENT UNIQUE

-- CREATE TABLE test (
--   id INT NULL AUTO_INCREMENT UNIQUE,
--   name VARCHAR(50)
-- );

-- INSERT INTO test (name) VALUES ('홍길동');
-- INSERT INTO test (id, name) VALUES (NULL, '이몽룡');
-- INSERT INTO test (id, name) VALUES (3, '성춘향');  -- 직접 지정도 가능

select * from test;
-- CREATE TABLE buyTBL_auto
-- (
--   num      INT AUTO_INCREMENT PRIMARY KEY,
--   userID   CHAR(8) NOT NULL,
--   prodName CHAR(6) NOT NULL,
--   FOREIGN KEY(userID) REFERENCES userTBL2(userID)
-- );

DROP TABLE IF EXISTS buyTBL;

-- AUTO_INCREMENT는 MySQL에서 숫자형 기본 키를 자동으로 증가시키는 기능
CREATE TABLE buyTBL (
  num  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  userID CHAR(8) NOT NULL,
  prodName CHAR(6) NOT NULL
);

ALTER TABLE buyTBL
  ADD CONSTRAINT FK_userTBL_buyTBL
  FOREIGN KEY(userID)
  REFERENCES userTBL(userID);
  
desc buyTBL;

-- CONSTRAINT FK_userTBL_buyTBL생략 가능
-- 생략하면 MySQL이 자동으로 외래 키 이름을 생성됨
-- 자동 생성된 이름은 보통 다음과 같은 형식
-- buytbl은 테이블 이름이고, ibfk는 InnoDB Foreign Key의 약자
-- buytbl_ibfk_1
-- buytbl_ibfk_2
-- --> 제약조건의 상세내용을 알 수 없음. 
-- --> 정확한 이름을 명시하고자 하는 경우 제약조건이름을 써주세요.!

-- ALTER TABLE buyTBL
-- ADD FOREIGN KEY(userID)
-- REFERENCES userTBL(userID);
-- 제약조건 목록 알고 싶은 경우

SELECT 
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE,
    TABLE_NAME
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE 
    TABLE_SCHEMA =  'tabledb' -- 예: '데이터베이스이름'
    AND TABLE_NAME = 'buyTBL';     -- 예: '테이블이름';

-- 결과 테이블에서 확인 후 이름으로 삭제 가능
ALTER TABLE buytbl
DROP 
FOREIGN KEY FK_userTBL_buyTBL;


-- autoincrement test!
INSERT INTO buyTBL (userID, prodName) VALUES ('USER001', '운동화');
INSERT INTO buyTBL (userID, prodName) VALUES ('USER002', '노트북');
INSERT INTO buyTBL (userID, prodName) VALUES ('USER001', '키보드');

SELECT * FROM buyTBL; 
-- num이 자동으로 1부터 증가됨 ✅
-- | num | userID  | prodName |
-- | --- | ------- | -------- |
-- | 1   | USER001 | 운동화      |
-- | 2   | USER002 | 노트북      |
-- | 3   | USER001 | 키보드      |

-- 값지정하여 insert가능
-- 이후 자동 증가 값은 11부터 시작됨
INSERT INTO buyTBL VALUES (10, 'USER003', '마우스');
INSERT INTO buyTBL (userID, prodName) VALUES ('USER003', '모니터');
SELECT * FROM buyTBL; 
-- | num | userID  | prodName |
-- | --- | ------- | -------- |
-- | 11  | USER003 | 모니터     |



-- ✅ unique 제약조건

USE tableDB;

DROP TABLE IF EXISTS buyTBL, userTBL;

CREATE TABLE userTBL (
  userID    CHAR(8) NOT NULL PRIMARY KEY,
  name      VARCHAR(10) NOT NULL,
  birthYear INT NOT NULL,
  email     CHAR(30) NULL UNIQUE
);

INSERT INTO userTBL VALUES ('USER001', '홍길동', 1990, 'hong@example.com');
INSERT INTO userTBL VALUES ('USER002', '김철수', 1992, 'kim@example.com');
INSERT INTO userTBL VALUES ('USER003', '이영희', 1995, 'hong@example.com'); -- X


-- ✅ check 제약조건

DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL( 
  userID    CHAR(8) PRIMARY KEY,
  name      VARCHAR(10),
  birthYear INT CHECK (birthYear >= 1900 AND birthyear <= 2023),
  mobile1   CHAR(3) NULL,
  CONSTRAINT CK_name CHECK ( name IS NOT NULL)
);

INSERT INTO userTBL VALUES ('ABCD1234', '홍길동', 1995, '010');
SELECT * FROM userTBL;
INSERT INTO userTBL VALUES ('EFGH5678', NULL, 1980, '011'); -- X


-- ✅ default 제약조건

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

desc usertbl;

-- default문은 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO usertbl VALUES ('LHL', '이혜리', default, default,'011', '1234567', 
                            default, '2023.12.12');
select * from usertbl;

-- 열 이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO usertbl(userID, name) VALUES('KAY', '김아영');

-- 값이 직접 명기되면 DEFAULT로 설정된 값은 무시된다.
INSERT INTO usertbl VALUES ('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2020.5.5');
INSERT INTO usertbl VALUES ('WB3', '원빈2', 1990, null, '019', '9876543', null, '2020.5.5');
INSERT INTO usertbl VALUES ('A', '원빈', 1982, '대전', '019', '9876543', 176, '2020.5.5');

-- default "111"
-- - null : default로 명시, 컬럼명시, 다른 값 --> 111, null도 가능
-- 		insert into table명 values(1, null); --> null을 쓴 경우 자동으로 default들어가지 않고
-- 		null로 들어감.
-- - not null : dafult로 명시, 컬럼명시, 다른 값 --> 111, null불가능
-- 		insert into table명 values(2, null); --> 불가능

SELECT * FROM usertbl;



-- ✅ 테이블이 이미 만들어져있는 상태에서 제약조건 추가
USE tabledb;

ALTER TABLE usertbl
ADD homepage VARCHAR(30) -- 열 추가
	DEFAULT 'http://www.hanbit.co.kr' -- 디폴트 값
	NULL;  -- NULL 허용함

-- 스키마 확인
desc usertbl;

-- 컬럼 삭제
ALTER TABLE usertbl
DROP COLUMN mobile1;

desc usertbl;

-- 컬럼 데이타타입 변경
ALTER TABLE usertbl
CHANGE COLUMN name uName VARCHAR(20) NULL;

desc usertbl;

-- 제약조건 삭제
ALTER TABLE usertbl
DROP PRIMARY KEY;

desc usertbl;

-- DROP 테이블명;

-- CREATE, ALTER, DROP --> DDL
-- ALTER(ADD, CHANGE, DROP)








