-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select  count(salary)
	from salaries
    where to_date like '9999%'
    and (salary >(select avg(salary) from salaries where to_date like '9999%'));
    
-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
SELECT 
    a.emp_no, b.salary, CONCAT(a.first_name, ' ', a.last_name)
FROM
    employees a,
    salaries b,
    dept_emp c,
    departments d,
    (SELECT 
        c.dept_no, MAX(b.salary) AS maxsa
    FROM
        salaries b, dept_emp c
    WHERE
        b.emp_no = c.emp_no
            AND b.to_date = '9999-01-01'
            AND c.to_date = '9999-01-01'
    GROUP BY c.dept_no) e
WHERE
    a.emp_no = b.emp_no
        AND c.emp_no = a.emp_no
        AND c.dept_no = d.dept_no
        AND e.dept_no = c.dept_no
        AND b.to_date LIKE '9999%'
        AND c.to_date LIKE '9999%'
        AND b.salary = e.maxsa
ORDER BY b.salary DESC;
-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
SELECT 
    a.salary, d.dept_name, a.emp_no, b.first_name
FROM
    salaries a,
    employees b,
    dept_emp c,
    departments d,
    (SELECT 
        AVG(a.salary) AS ok, d.dept_name, c.dept_no
    FROM
        dept_emp c, departments d, employees b, salaries a
    WHERE
        a.emp_no = b.emp_no
            AND c.dept_no = d.dept_no
            AND a.emp_no = c.emp_no
            AND a.to_date = '9999-01-01'
            AND c.to_date = '9999-01-01'
    GROUP BY c.dept_no) e
WHERE
    a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and c.dept_no = d.dept_no
and e.dept_no = c.dept_no
        AND a.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND e.ok < a.salary
ORDER BY a.salary DESC;
-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select concat(a.first_name,' ',a.last_name) as 사원이름, b.emp_no as 사번, e.first_name as 매니저, d.dept_name as 부서
	from employees a, dept_emp b, dept_manager c, departments d, employees e 
    where c.dept_no = d.dept_no
	and a.emp_no = b.emp_no
    and b.dept_no = d.dept_no
    and e.emp_no = c.emp_no
    and c.to_date = '9999-01-01'
    and b.to_date = '9999-01-01';

    -- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select a.emp_no , a.first_name, c.title, b.salary
	from employees a,salaries b, titles c, dept_emp d,
(select avg(salary) as avgsa, d.dept_no
	from salaries a, dept_emp d
    where a.emp_no = d.emp_no
    and d.to_date ='9999-01-01'
    and a.to_date ='9999-01-01'
    group by d.dept_no) h
    where a.emp_no = b.emp_no
    and a.emp_no = c.emp_no
    and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and a.emp_no = d.emp_no
    group by a.emp_no
    order by b.salary desc;
-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
select  dept_name
	from departments a,
(select avg(salary) as avgsa, d.dept_no
	from salaries a, dept_emp d
    where a.emp_no = d.emp_no
    and d.to_date ='9999-01-01'
    and a.to_date ='9999-01-01'
    group by d.dept_no) h
    where a.dept_no = h.dept_no
    order by h.avgsa desc
    limit 1;
    
-- 문제7.
-- 평균 연봉이 가장 높은 직책?72406.4350
select a.title
	from titles a,
(select avg(salary) as avgsa, d.title
	from salaries a, titles d
    where a.emp_no = d.emp_no
    and d.to_date ='9999-01-01'
    and a.to_date ='9999-01-01'
    group by d.title) h
    order by h.avgsa desc
    limit 1;

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
select concat(a.first_name,' ',a.last_name) as 사원이름, b.emp_no as 사번, e.first_name as '매니저', d.dept_name as 부서, g.salary as '연봉', f.salary as '매니저'
	from employees a, dept_emp b, dept_manager c, departments d, employees e , salaries f, salaries g
    where c.dept_no = d.dept_no
	and a.emp_no = b.emp_no
    and b.dept_no = d.dept_no
    and e.emp_no = c.emp_no
    and e.emp_no = f.emp_no
    and a.emp_no = g.emp_no
    and g.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    and f.to_date = '9999-01-01'
    and f.salary < g.salary
    order by g.salary desc;


select concat(a.first_name,' ',a.last_name) as 사원이름, b.emp_no as 사번, e.first_name as 매니저, d.dept_name as 부서
	from employees a, dept_emp b, dept_manager c, departments d, employees e
    where c.dept_no = d.dept_no
	and a.emp_no = b.emp_no
    and b.dept_no = d.dept_no
    and e.emp_no = c.emp_no
    and c.to_date = '9999-01-01'
    and b.to_date = '9999-01-01';
select *
	from employees a, dept_manager b, salaries c
    where a.emp_no = b.emp_no
    and a.emp_no = c.emp_no
    and c.to_date ='9999-01-01'
    and b.to_date = '9999-01-01'
    order by c.salary desc;
