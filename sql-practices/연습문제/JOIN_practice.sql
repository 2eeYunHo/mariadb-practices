-- inner join 
-- ex1) 현재 근무하고 있는 직원의 이름과 직책을 출력하세요.
select a.emp_no, a.first_name, b.title
   from employees a, titles b
   where a.emp_no = b.emp_no -- join 조건(n-1)개가 있어야함
    and b.to_date = '9999-01-01'; -- row 선택 조건
    
-- ex2) 현재 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력
select a.first_name, b.title, a.gender
   from employees a, titles b
   where a.emp_no = b.emp_no -- join 조건(n-1)개가 있어야함
    and a.gender = 'F'
    and b.title = 'ENGINEER'
    order by a.first_name desc; -- row 선택 조건
    
-- ANSI/ISO SQL1999 JOIN 표준문법

-- ex1) natural join

-- ex2) join ~ using

-- ex3) join ~ on
    