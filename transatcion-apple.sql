-- 실습1 --
-- -----------------------
use testdb;
select * from test; -- autocommit이 true인 경우 다른 세션(연결)에서도 확인 가능

-- 실습2 --
-- -----------------------
select * from test; -- autocommit이 false인 경우 반영여부를 결정할 수 있음.
-- commit하여 반영했으므로 바로 확인 가능!

-- 실습3 --
-- -----------------------
select * from test; -- autocommit이 false인 경우 반영여부를 결정할 수 있음.
-- rollback하여 반영했으므로 바로 확인 가능!





