use sqldb;

CREATE TABLE testTbl1(
	id INT, 
    username CHAR(3), 
    age INT
);

INSERT INTO testTbl1 VALUES(1, '홍길동', 25);

SELECT * FROM sqldb.testtbl1;


UPDATE testTbl1
set age = 100
where id = 1;

DELETE FROM testTbl1
where id = 1;



