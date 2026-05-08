--SELECT:

select *
from Employees;

select emp_name, salary
from Employees;

select emp_id, emp_name, department
from Employees;

select emp_id, emp_name
from Employees
where department='IT';

select emp_id, emp_name, experience
from Employees;


--WHERE:

select emp_id, emp_name, salary
from Employees
where salary>70000;

select emp_id, emp_name,city
from Employees
where city='Hyderabad';

select emp_id, emp_name,experience
from Employees
where experience<'4 years';

select emp_id, emp_name, department
from Employees
where department='Finance';

select emp_id, emp_name, salary
from Employees
where salary=52000;


--GROUP BY:

select department, sum(salary) as total_salary
from Employees
group by department;

select department, avg(salary) as average_salary
from Employees
group by department;

select city, count(*) as total_Employees
from Employees
group by city;

select department, max(salary) as maximum_salary
from Employees
group by department;

select department, min(salary) as minimum_salary
from Employees
group by department;



