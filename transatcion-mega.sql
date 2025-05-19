-- 실습1 --
-- -----------------------

-- autocommit 환경 변수값 확인
select @@autocommit; 

-- autocommit 변경 가능
-- set @@autocommit = false; -- off는 false(0), on은 true(1)

create database testdb;
use testdb;

create table test(
	testid INT AUTO_INCREMENT primary key,
    name VARCHAR(10)
);
insert into test values (null, 'name1');
select * from test;

-- 실습2 --
-- -----------------------
-- autocommit 변경 가능(off하고 실습, 바로 반영X)
set @@autocommit = false; -- off는 false(0), on은 true(1)
select @@autocommit; 

insert into test values (null, 'name2');

select * from test;

commit; -- 마지막 commit이후의 작업 모두 반영
-- name1, name2 insert작업 모두 반영 

-- 실습3 --
-- -----------------------

insert into test values (null, 'name3'); 
insert into test values (null, 'name4');

select * from test; -- rollback하기전에는 mega에서 보임.

rollback; -- 마지막 commit이후의 작업 모두 취소
-- name3, name4 insert작업 모두 취소 
-- rollback이후에 select하면 보이지 않음.

select * from test; -- rollback후에는 mega에서 보이지 않음.(name3, name4)


