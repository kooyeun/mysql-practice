-- 현재 근무하고 있는 여직원의 이름과 직책을 직원 이름 순으로 출력하세요
select a.first_name,b.title
from employees a, titles b
where a.emp_no = b.emp_no   -- join condition
and b.to_date='9999-01-01'  -- select condition
and a.gender='F'            -- select condition
order by a.first_name;

-- 부서별로 현재 직책이 Engineer 인 직원들에 대해서만 평균 급여를 구하세요
select a.dept_no, d.dept_name, avg(b.salary) as avg_salary
from dept_emp a, salaries b, titles c, departments d
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and a.dept_no = d.dept_no
and a.to_date='9999-01-01'
and b.to_date='9999-01-01'
and c.to_date='9999-01-01'
and c.title='Engineer'
group by a.dept_no
order by avg_salary desc;

-- 현재 직책별로 급여의 총합을 구하되 Engineer 직책은 제외 하세요
-- 단 총합이 2,000,000,000 이상인 직책만 나타내며
-- 급여의 총합에 대해서는 내림차순(DESC)으로 정렬하세요
select a.title, sum(b.salary)
from titles a, salaries b
where a.emp_no = b.emp_no
and NOT a.title IN('Engineer')
and a.to_date='9999-01-01'
and b.to_date='9999-01-01'
group by a.title
having sum(b.salary) >= 2000000000
order by sum(b.salary) desc;


--
-- ANSI/ISO SQL 1999 JOIN 문법
--
-- join ~ on
-- 현재 근무하고 있는 여직원의 이름과 직책을 직원 이름 순으로 출력하세요
select a.first_name,b.title
from employees a
join titles b
  on a.emp_no = b.emp_no   -- join condition
where b.to_date='9999-01-01'  -- select condition
and a.gender='F'              -- select condition
order by a.first_name;

-- natural join
select a.first_name,b.title
from employees a
natural join titles b
where b.to_date='9999-01-01'  -- select condition
and a.gender='F'              -- select condition
order by a.first_name;

-- natural join 단점
select count(*)
from titles a
join salaries b
on a.emp_no = b.emp_no
where a.to_date='9999-01-01'
and b.to_date='9999-01-01';

select count(*)
from titles a
natural join salaries b
where a.to_date='9999-01-01'
and b.to_date='9999-01-01';


-- join ~ using
select count(*)
from titles a
join salaries b
using (emp_no)
where a.to_date='9999-01-01'
and b.to_date='9999-01-01';


-- outer join

-- 테스트 데이터 넣기
insert into dept values(null,'총무');
insert into dept values(null,'개발');
insert into dept values(null,'영업');
insert into emp values(null,'둘리',2);
insert into emp values(null,'마이콜',3);
insert into emp values(null,'또치',2);
insert into emp values(null,'도우넛',3);
insert into emp values(null,'길동',null);


select * from emp;
select * from dept;

-- 현재 회사의 직원의 이름과 부서이름을 출력하세요
select a.name,b.name
from emp a
join dept b
on a.dept_no=b.no;

-- left join
select a.name,ifnull(b.name,'없음')
from emp a
left join dept b
on a.dept_no=b.no;

-- right join
select ifnull(a.name,'직원없음'),b.name
from emp a
right join dept b
on a.dept_no=b.no;


