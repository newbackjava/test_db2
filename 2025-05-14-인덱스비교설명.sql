-- ✅ 데이터베이스 생성: test_index_db라는 이름의 데이터베이스를 생성합니다.
-- 이미 존재한다면 생성하지 않습니다.
CREATE DATABASE IF NOT EXISTS test_index_db;

-- 해당 데이터베이스 사용
USE test_index_db;


-- ✅ 인덱스가 없는 테이블 생성
-- 직원 정보 저장용 테이블이며, 'department' 컬럼에 인덱스를 만들지 않습니다.
CREATE TABLE employees_no_index (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- 기본키, 자동 증가 ID
    name VARCHAR(100),                           -- 직원 이름
    department VARCHAR(100),                     -- 부서 이름 (검색 대상)
    age INT,                                     -- 나이
    salary INT                                   -- 급여
);


-- ✅ 인덱스가 있는 테이블 생성
-- 위 테이블과 동일하지만, 'department' 컬럼에 인덱스를 추가합니다.
CREATE TABLE employees_with_index (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- 기본키, 자동 증가 ID
    name VARCHAR(100),                           -- 직원 이름
    department VARCHAR(100),                     -- 부서 이름
    age INT,                                     -- 나이
    salary INT,                                  -- 급여
    INDEX idx_department (department)            -- ✅ department 컬럼에 인덱스 추가
);



-- ✅ 저장 프로시저 정의 시작 (100,000건 더미 데이터를 삽입하기 위한 루프 구조)
DELIMITER $$

CREATE PROCEDURE insert_dummy_data()
BEGIN
    DECLARE i INT DEFAULT 0;  -- 반복용 변수 선언
    WHILE i < 100000 DO
        -- employees_no_index 테이블에 더미 데이터 한 건 삽입
        INSERT INTO employees_no_index (name, department, age, salary)
        VALUES (
            CONCAT('Employee_', i),                                       -- 이름: Employee_0 ~ Employee_99999
            ELT(FLOOR(1 + RAND() * 5), 'HR', 'Sales', 'Engineering',      -- 부서: 무작위 선택
                'Marketing', 'Finance'),
            FLOOR(25 + RAND() * 30),                                      -- 나이: 25 ~ 54
            FLOOR(30000 + RAND() * 20000)                                 -- 급여: 30000 ~ 49999
        );
        SET i = i + 1;  -- 다음 반복을 위한 증가
    END WHILE;
END$$

-- 저장 프로시저 정의 종료
DELIMITER ;


-- ✅ 저장 프로시저 실행 (실제 더미 데이터를 10만 건 삽입)
CALL insert_dummy_data();


-- ✅ 인덱스 테이블에 동일한 데이터를 복사
-- 인덱스 없는 테이블의 데이터를 인덱스 있는 테이블로 복사
INSERT INTO employees_with_index (name, department, age, salary)
SELECT name, department, age, salary FROM employees_no_index;


-- ✅ 인덱스 없는 테이블에서 부서명이 'Engineering'인 데이터를 검색
-- 전체 테이블을 탐색 (Full Table Scan)할 가능성이 높음
EXPLAIN SELECT * FROM employees_no_index 
WHERE department = 'Engineering';


-- ✅ 인덱스 있는 테이블에서 동일한 검색 실행
-- 인덱스를 통해 빠르게 검색됨 (Index Range Scan 또는 Index Ref Scan)
EXPLAIN SELECT * FROM employees_with_index 
WHERE department = 'Engineering';

-- ✅ 실제 인덱스 검색 쿼리 실행 (결과 확인용)
SELECT * FROM employees_with_index 
WHERE department = 'Engineering';
