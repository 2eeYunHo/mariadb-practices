-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select  count(salary)
	from salaries
    where to_date like '9999%'
    and (salary >(select avg(salary) from salaries where to_date like '9999%'));
    
-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select a.emp_no, d.first_name, b.dept_no, a.salary
	from salaries a, dept_emp b, employees d 
	where a.emp_no = d.emp_no
    and b.emp_no = a.emp_no
    and a.to_date like '9999%'
    and (select max(a.salary) from salaries a, dept_emp b where a.emp_no = b.emp_no
    and a.to_date like '9999%' group by b.dept_no)
    order by a.salary asc;
-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select  b.emp_no, b.first_name, a.salary as '평균이상연봉'
	from salaries a, employees b, dept_emp c, departments d
    where a.emp_no = b.emp_no
    and c.emp_no = a.emp_no
    and c.dept_no = d.dept_no
    and a.to_date like '9999%'
    and (select avg(salary) from salaries where  to_date  like '9999%' group by dept_name) < a.salary
    order by a.salary desc;
    
-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.

-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.

-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 

-- 문제7.
-- 평균 연봉이 가장 높은 직책?

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

