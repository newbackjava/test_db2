create  user  'mega'@'localhost'  identified  by  '1234';
grant  all  privileges  on  *.*   to  'mega'@'localhost';

create  user  'apple'@'localhost'  identified  by  '1234';
grant  all  privileges  on  *.*   to  'apple'@'localhost';

SELECT user, host FROM mysql.user;

SELECT * FROM mysql.user;