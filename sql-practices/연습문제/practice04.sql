-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select  count(salary)
	from salaries
    where to_date like '9999%'
    and (salary >(select avg(salary) from salaries where to_date like '9999%'));
    
-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select a.emp_no,b.salary, concat(a.first_name, ' ' , a.last_name)
	from employees a, salaries b, dept_emp c, departments d,
		(select c.dept_no, max(b.salary) as maxsa
         from salaries b, dept_emp c
         where b.to_date = c.to_date
         and b.to_date = '9999-01-01'
         and c.to_date = '9999-01-01'
         group by c.dept_no) e
	where a.emp_no = b.emp_no
    and c.emp_no = a.emp_no
    and c.dept_no = d.dept_no
    and e.dept_no = c.dept_no
    and b.to_date like '9999%'
    and c.to_date like '9999%'
	and b.salary = e.maxsa
    order by b.salary desc;
-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select a.salary, d.dept_name, a.emp_no, b.first_name
	from salaries a, employees b, dept_emp c, departments d,
    (select avg(a.salary)as ok, d.dept_name
     from  dept_emp c, departments d, employees b ,salaries a
     where a.emp_no=b.emp_no
     and c.dept_no=d.dept_no
     and a.emp_no = c.emp_no
     and a.to_date = '9999-01-01'
     and c.to_date = '9999-01-01'
     group by c.dept_no) e
	 where a.emp_no = b.emp_no
	 and a.to_date = '9999-01-01'
     and c.to_date = '9999-01-01'
     and e.ok < a.salary
     order by a.salary desc;
 
-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
SELECT 
    a.emp_no,
    CONCAT(a.first_name, ' ', a.last_name) AS emp_fullname,
    c.dept_name,
    d.salary
FROM
    employees a,
    dept_emp b,
    departments c,
    salaries d,
    (SELECT 
        a.dept_no, MAX(b.salary) AS max_salary
    FROM
        dept_emp a, salaries b
    WHERE
        a.emp_no = b.emp_no
            AND a.to_date LIKE '9999%'
            AND b.to_date LIKE '9999%'
    GROUP BY a.dept_no) e
WHERE
    a.emp_no = b.emp_no
        AND b.dept_no = c.dept_no
        AND a.emp_no = d.emp_no
        AND b.dept_no = e.dept_no
        AND b.to_date LIKE '9999%'
        AND d.to_date LIKE '9999%'
        AND d.salary = e.max_salary
ORDER BY d.salary DESC;
-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.

-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 

-- 문제7.
-- 평균 연봉이 가장 높은 직책?

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

