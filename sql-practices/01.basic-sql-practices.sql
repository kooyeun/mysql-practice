
-- pets table 생성
create table pets(
name varchar(20),
owner varchar(20),
species varchar(20),
gender char(1),
birth date,
death date
);

-- table schema 확인
desc pets;

-- insert(C)
insert into pets values('성탄이','kickscar','dog','m','2010-12-25',null);
insert into pets(owner,name,species,gender,birth) 
values('kickscar','choco','cat','m','2010-12-25');
insert into pets values('마음이','kickscar','dog','m','2010-12-25','2021-03-30');

-- select(R)
select * from pets;
select name,birth from pets;
select name,birth from pets order by birth asc;
select count(*) from pets; -- null이 있는 row 세지않는다는 것을 주의
select count(*) from pets where death is not null;

-- update(U)
update pets
set species='monkey'
where name='choco';