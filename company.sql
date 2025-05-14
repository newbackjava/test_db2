-- 데이터베이스 생성
CREATE DATABASE company;
USE company;

-- departments 테이블 생성
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location_id INT
);

-- employees 테이블 생성
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    job_id VARCHAR(20),
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- departments 테이블에 데이터 삽입
INSERT INTO departments (department_id, department_name, location_id) VALUES
(1, 'Sales', 1700),
(2, 'Engineering', 1800),
(3, 'HR', 1700),
(4, 'Finance', 1900);

-- employees 테이블에 데이터 삽입
INSERT INTO employees (employee_id, first_name, last_name, department_id, job_id, salary) VALUES
(101, 'John', 'Doe', 1, 'Salesman', 60000),
(102, 'Jane', 'Smith', 2, 'Engineer', 80000),
(103, 'Sam', 'Brown', 1, 'Salesman', 62000),
(104, 'Sue', 'Wilson', 3, 'HR Specialist', 55000),
(105, 'Jim', 'Taylor', 2, 'Engineer', 78000),
(106, 'Amy', 'Adams', 4, 'Accountant', 70000);

-- UNION 사용 예시 – 중복 제거
SELECT job_id FROM employees WHERE department_id = 1
UNION
SELECT job_id FROM employees WHERE department_id = 2;

-- UNION ALL 사용 예시 – 중복 포함
SELECT job_id FROM employees WHERE department_id = 1
UNION ALL
SELECT job_id FROM employees WHERE department_id = 2;
