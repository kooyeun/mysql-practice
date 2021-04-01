desc emaillist;

-- insert
insert into emaillist values(null,'정','구연','jedis13@naver.com');
insert into emaillist values(null,'둘','리','dooly@dooly.com');
insert into emaillist values(null,'마','이콜','micol@naver.com');
insert into emaillist values(null,'둘','리','dooly@naver.com');

-- select
select no,first_name,last_name,email from emaillist order by no desc;

-- delete
delete from emaillist where email='dooly@naver.com';