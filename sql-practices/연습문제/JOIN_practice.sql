-- inner join 
-- ex1) 현재 근무하고 있는 직원의 이름과 직책을 출력하세요.
select a.emp_no, a.first_name, b.title
   from employees a, titles b
   where a.emp_no = b.emp_no -- join 조건(n-1)개가 있어야함
    and b.to_date = '9999-01-01'; -- row 선택 조건
    
-- ex2) 현재 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력
select a.emp_no, a.first_name, b.title, a.gender
   from employees a, titles b
   where a.emp_no = b.emp_no -- join 조건(n-1)개가 있어야함
    and a.gender = 'F'
    and b.title = 'ENGINEER'
    order by a.emp_no asc; -- row 선택 조건
    
-- ANSI/ISO SQL1999 JOIN 표준문법

-- ex1) natural join
-- 두 테이블에 이름이 가은 공통 컬럼이 있으면 조인 조건을 명시하지 않아도 암묵적으로 조인이됨
select a.emp_no, a.first_name, b.title
   from employees a natural join titles b -- natural은 기본적으로 두 DB에 같은이름의 테이블이 필히 존재하여야한다.
-- join 조건(n-1)개가 있어야함
	where b.to_date = '9999-01-01'; -- row 선택 조건
-- ex2) join ~ using
select count(*)
   from salaries a natural join titles b -- 같은 레이블이 필히 있어야하지만 2개이상있으면 오류가 발생해서 알 수 없는 값이 발생한다.
   where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';
select count(*)
   from salaries a join titles b using (emp_no) -- 같은레이블을 using으로 명시하여 natural의 오류를 제거함
   where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';
   
-- ex3) join ~ on
select avg(a.salary), b.title
   from salaries a join titles b 
   on a.emp_no = b.emp_no
   where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
   group by b.title
   order by avg(a.salary) desc;
