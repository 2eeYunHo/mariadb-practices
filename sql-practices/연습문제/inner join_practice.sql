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

-- 실습문제 1 : 현재 회사 상황을 반영한 지구언별 근무부서를 사번, 직원 전첼이름, 근무부서 형태로 출력해 보세요.
-- equi join
select c.emp_no as '사번', a.first_name as '이름', b.dept_name as '근무부서'
   from employees a, departments b, dept_emp c
   where a.emp_no = c.emp_no
   and b.dept_no = c.dept_no
   and c.to_date like '9999%';
   
-- 실습문제 2 : 현재 회사에서 지급되고 있는 급여쳬ㄹ계를 반영한 결과를 출력하세요, 사번, 전체이름, 연봉형태 출력
-- equi join
select a.emp_no as '사번', a.first_name as '이름', b.salary as '연봉'
   from employees a, salaries b
   where a.emp_no = b.emp_no
   and b.to_date like '9999%'
   order by salary desc;
   
-- 실습문제 3 : 현재 직책별로 평균 연봉과 인원 수를 구하되 직책별로 인원이 100명 이상인 직책만 줄력하시오.
select avg(b.salary) as '평균연봉', a.title as '직책', count(*)
   from titles a, salaries b
   where a.emp_no = b.emp_no
   and a.to_date like '9999%'
   and b.to_date like '9999%'
   group by a.title
   having count(*) >= 100
   order by count(*) desc;
   
-- 실습문제 4 : 현재 부서별로 현재 직책이 Engineer인 직원들의 대해서만 평균 급여를 구하시오.
select d.dept_name as '각부서', a.title as '현재직책', avg(b.salary) as '평균 급여'
   from titles a, salaries b, dept_emp c, departments d
   where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and c.dept_no = d.dept_no
   and a.to_date like '9999%'
   and b.to_date like '9999%'
   and c.to_date like '9999%'
   and a.title = 'Engineer'
   group by c.dept_no
   order by b.salary desc;-- order by 값이 이상함;;
   