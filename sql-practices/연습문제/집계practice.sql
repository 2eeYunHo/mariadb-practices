-- 집계 Qurey : select에 그룹함수가 적용된 경우
-- avg, max, min, count, sum, ...

select avg(salary)
   from  salaries;
   
-- select 절에 그룹함수가 있는 경우, 어떤 컬럼도 select 절에 올 수 없다
select emp_no, avg(salary)
   from salaries;

-- query 순서
-- 1) from : 접근 테이블 확인
-- 2) where : 조건에 맞는 row를 선택
-- 3) 조건에 맞는 row를 가지고 집계를 한다.
-- 4) projection
-- 사원 10060의 급여의 평균은?
select avg(salary)
   from salaries
   where emp_no ='10060';

-- group by 에 참여하고 있는 컬럼은 projection 이 가능하다(select 절에 올 수 있다)
select emp_no, avg(salary) as avg_salary-- , sum(salary)
   from salaries
   group by emp_no;
  -- // order by sum(salary) desc, avg(salary) desc;
-- having
-- 집계결과(결과임시테이블)에서 row를 선택해야 되는 경우
-- 이미 where 절은 실행이 되었기 떄문에 having절에서 이 조건을  주어야한다.
-- having 절은 group by절 밑에 있어야한다.
select emp_no, avg(salary)
   from salaries
   group by emp_no
   having avg(salary) > 60000;
   
-- order by
select emp_no, avg(salary)
   from salaries
   group by emp_no
   having avg(salary) > 60000
   order by avg(salary) asc;
   
