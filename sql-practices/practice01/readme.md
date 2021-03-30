#문제를 풀면서

##4,6,10
"현재" 에 대해서 표현할 줄 몰랐다
답안에는 
where to_date = '9999-01-01'
전부 이렇게 나와있는데 납득이 잘 가지 않으니 물어봐야겠다



##11
titles 테이블에 대한 이해가 부족해서 활용하지 못했다
(10,11 문제)


## 답안
-- 문제4.
-- 현재 근무하고 있는 직원 수는 몇 명입니까? (salaries 테이블을 사용합니다.) 
select count(*)
  from salaries
 where to_date = '9999-01-01';


-- 문제6.
-- 현재 부서 매니저는 몇 명이나 있나요?(역임 매너저는 제외)
	select count(*) 
      from dept_manager
    where to_date = '9999-01-01';


-- 문제10
-- 현재 Enginner 직책의 사원은 총 몇 명입니까?
select count(*)
  from titles
 where title = 'Engineer'
   and to_date = '9999-01-01';


-- 문제11
-- 사번이 13250(Zeydy)인 지원이 직책 변경 상황을 시간순으로 출력해보세요.
select title, from_date, to_date 
  from titles
 where emp_no = 13250
order by from_date asc; 