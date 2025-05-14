-- 설명(comment, 주석), 한 칸 반드시 띄워주세요.!!!

-- 현재 스키마(db)는 shopdb로 설정되어있음.

show tables; -- 테이블 목록 보여주세요.!

desc membertbl; -- 테이블 설정 자세하게 보여줘! DESCRIBE(설명하다.)

select * from membertbl; -- membertbl테이블로 부터 모든 필드(항목, item, 속성, 컬럼)을 선택해서 보여줘(검색)

-- dml중 하나 crud중에서 read에 속하는 select문 실행해 보았음.
-- dml은 crud작업을 하게 되는데 실무에서 제일 많이 사용하는 것은 select임.

select memberID from membertbl;

select memberID, memberName from membertbl;

INSERT INTO membertbl values ('summer','박길동', null); -- sql문은 char쓸 때 ", '써도 됨!

select * from membertbl;

select * from membertbl where memberID = 'apple';
-- not null이면서 중복X 컬럼을 가지고 조건을 주어야지만 해당 사람에 대한 정보를 검색가능!
-- 컬럼중에서 중요한 역할을 하는 컬럼을 중요키(primary key, pk, 기본키/우선키)

