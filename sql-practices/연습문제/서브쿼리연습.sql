-- subquery

-- 1) select 절
-- 2) from 절의 서브 쿼리
select now() as a, sysdate() as b, 3+1 as c;	
select s.a, s.b
  from (select now() as a, sysdate() as b, 3+1 as c) s;

-- 3) where 절의 서브쿼리
-- 예제
-- 현재, Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 출력해보세요.

select dept_no
  from dept_emp a, employees b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and concat(b.first_name, ' ', b.last_name) = 'Fai Bale';

select b.emp_no, b.first_name
  from dept_emp a, employees b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and dept_no = 'd004';
-- sol)
select b.emp_no, b.first_name
  from dept_emp a, employees b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and dept_no = (select dept_no
					from dept_emp a, employees b
				   where a.emp_no = b.emp_no
                     and a.to_date = '9999-01-01'
                     and concat(b.first_name, ' ', b.last_name) = 'Fai Bale');

-- 3-1) 단일행 연산자: =, >, <, >=, <=, <>, !=
-- 실습문제 1: 현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의 이름, 급여를 나타내세요.                    
select avg(salary) from salaries where to_date='9999-01-01';

select b.first_name, a.salary
  from salaries a, employees b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and a.salary < (select avg(salary) from salaries where to_date='9999-01-01')
order by a.salary desc;   

-- 실습문제 2: 현재 가장 적은 평균급여의 직책과 평균급여를 출력 하세요.
-- 1) 현재 가장 적은 평균급여
-- 1-1) 직책별 평균급여
select a.title, avg(salary)
  from titles a, salaries b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by a.title;
   
-- 1-2) 가장 적은 평균급여
select min(c.avg_salary)
  from (  select a.title, avg(salary) as avg_salary
            from titles a, salaries b
           where a.emp_no = b.emp_no
             and a.to_date = '9999-01-01'
             and b.to_date = '9999-01-01'
        group by a.title) c;

-- 2-1) sol1: subquery
  select a.title, avg(salary) as avg_salary
    from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.title
  having avg_salary = (select min(c.avg_salary)
                         from (  select a.title, avg(salary) as avg_salary
                                   from titles a, salaries b
                                  where a.emp_no = b.emp_no
                                    and a.to_date = '9999-01-01'
                                    and b.to_date = '9999-01-01'
                               group by a.title) c);
                               

-- 2-2) sol2: top-k
  select a.title, avg(salary)
    from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.title
order by avg(salary) asc
   limit 0, 1;

-- 3-2) 복수행 연산자: in, not in any, all 
-- any의 사용법 : 1. =any : in과 동일하게 사용한다 | 2. >any : 최소,최대값 | 3. <>any : not in과 동일
-- all의 사용법 : 1. =all : X 불가능 | 2. >=all, <all 모든인자와비교해 최대or최솟값 | <>all:
-- 실습문제3: 현재 급여가 50000 이상인 직원의 이름과 급여를 출력하세요.(급여가 큰 순서대로)
-- sol.1)
select a.salary as '급여', b.first_name as '이름'
   from salaries a, employees b
   where a.emp_no = b.emp_no
   and a.to_date like '9999%'
   and a.salary >= 50000
   order by a.salary asc;
-- sol.2)
select a.first_name, b.salary
   from employees a, salaries b
   where a.emp_no = b.emp_no
   and b.to_date = '9999%'
   and (a.emp_no, b.salary) in (select emp_no, salary
   from salaries 
   where to_date like '9999%'
   and salary >=50000)
   order by b.salary asc;
   
-- 실습문제 4) 현재 각 부서별로 최고월급을 받는 직원의 이름과 월급을 출력하세요.
select a.dept_no, max(b.salary)
    from dept_emp a, salaries b
   where a.emp_no=b.emp_no
     and a.to_date='9999-01-01'
     and b.to_date='9999-01-01'
group by a.dept_no;

-- sol1) where subquery: in(=any)   
select d.dept_name, b.first_name, c.salary
  from dept_emp a, employees b, salaries c, departments d  
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and d.dept_no = a.dept_no
   and a.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
   and (a.dept_no, c.salary) in (  select a.dept_no, max(b.salary)
									 from dept_emp a, salaries b
                                    where a.emp_no=b.emp_no
                                      and a.to_date='9999-01-01'
                                      and b.to_date='9999-01-01'
                                 group by a.dept_no);
   
-- sol2) from subquery
select d.dept_name, b.first_name, c.salary
  from dept_emp a,
       employees b,
       salaries c,
       departments d,
       (  select a.dept_no, max(b.salary) as max_salary
		    from dept_emp a, salaries b
           where a.emp_no=b.emp_no
             and a.to_date='9999-01-01'
             and b.to_date='9999-01-01'
        group by a.dept_no) e
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and d.dept_no = a.dept_no
   and a.dept_no = e.dept_no   
   and a.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
   and c.salary = e.max_salary;
   