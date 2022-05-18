-- select 연습
  select * 
   from departments 
order by dept_no ;
select dept_no, dept_name 
   from departments;
-- alias
-- 예제1 : employees 테이블에서 직원의 이름, 성별, 입사일을 출력
-- 명시적으로 as는 생략이 가능함
select first_name as '이름', gender as '성 별', hire_date  as '입사일'
   from employees;
   
-- 예제2 : employees 테이블에서 직원의 이름(Full name|성+이름),성별, 입사일
select concat(first_name,' ', last_name) as 'Fullname', gender as '성 별', hire_date  as '입사일'
   from employees;
   
-- distict
-- 예제 : titles 테이블에서 모든 직급의 이름을 출력 
select distinct(title)
   from titles;
   
-- where 절 #1
-- 예제 : 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
select first_name as '이름', gender as '성 별', hire_date  as '입사일'
   from employees
   where hire_date < '1991-01-01'
   order by hire_date desc;

-- where 절 #2 : 논리 연산자 
-- 예제 : 1989년 이전에 입사한 여직원의 이름, 성별, 입사일을 출력
select first_name as '이름', gender as '성 별', hire_date  as '입사일'
   from employees
   where hire_date < '1990-01-01'
    and gender = 'F'
   order by hire_date desc; -- order by 에서 desc는 내림차순
   
-- where 절 #3 : in 연산자 
-- 예제 : dept_emp테이블 에서 부서번호 d005 또한 d009에 속한 사원의 사번, 부서번호를 출력
select *
   from dept_emp 
   where dept_no in ( 'd005' , 'd009');
    
    select *
   from dept_emp 
   where dept_no = 'd005'
     or dept_no = 'd009';
     
-- where 절 #4 : like 검색
-- 예제 : 1989년에 입사한 직원의 이름, 성별, 입사일을 출력 
select first_name as '이름', gender as '성 별', hire_date  as '입사일'
   from employees
   where hire_date <= '1989-12-31'
   and '1989-01-01' <= hire_date;

select first_name as '이름', gender as '성 별', hire_date  as '입사일'
   from employees
   where hire_date between '1989-01-01' and  '1989-12-31';

select first_name as '이름', gender as '성 별', hire_date  as '입사일'
   from employees
   where hire_date like '1989-%';

-- order by 절 | 정렬 가장 마지막에 연산
-- 예제1 : 남자직원의 이름 성별 입사일을 입사일 순으로
select first_name as '이름', gender as '성별', hire_date as '입사일'
   from employees
   where gender = 'M'
   order by hire_date desc;

   
-- 예제2 : 직원들의 사번, 월급을 사번과 월급순으로
select emp_no, salary, from_date, to_date
   from salaries
   order by emp_no desc, salary;