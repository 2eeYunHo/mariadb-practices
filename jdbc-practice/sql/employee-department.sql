-- DepartmentDao : find all
select * 
	from department 
    order by no desc;

-- EmployeeDao: findall
select no, name, department_no
	from employee
	order by no desc;
    
-- DepartmentDao : update(vo)
update department 
	set name = '솔루션개발' 
    where no = 3;

-- EmployeeDao : delete
delete from employee;