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

--tpp

select *
from Employees
order by salary desc
limit 5;

select *
from Employees
order by experience desc
limit 3;

select *
from Employees
where department = 'Finance'
order by salary desc
limit 2;

select *
from Employees
where city = 'Hyderabad'
order by salary desc
limit 4;

select *
from Employees
order by salary desc
limit 1;

select distinct department
from Employees;

select distinct city
from Employees;

select distinct salary
from Employees;

select distinct department,city
from Employees;

select distinct emp_id,experience
from Employees;

--comparison operator:

select*
from Employees
where salary>=80000;

select*
from Employees
where experience<=3;

select*
from Employees
where salary <> 45000;

select*
from Employees
where salary < 50000;

select*
from Employees
where experience > 5;

--LOGICAL OPERATORS:

select*
from Employees
where department='IT'
and salary>70000;

select*
from Employees
where city='Hyderabad' 
or city= 'Bangalore';

select*
from Employees
where department='HR'
and experience<3;

select*
from Employees
where salary>60000
or experience>6;

select*
from Employees
where department != 'Sales';

--IN AND NOTIN:
select*
from Employees
where city in ('Hyderabad', 'Mumbai');

select*
from Employees
where department in ('IT', 'Finance');

select*
from Employees
where city not in('Chennai', 'Pune');

select*
from Employees
where salary in (45000, 75000, 91000);

select*
from Employees
where department not in ('HR', 'Sales');

--BETWEEN:
select*
from Employees
where salary between 50000 AND 80000;

select*
from Employees
where experience BETWEEN 3 AND 6;

select*
from Employees
where emp_id  BETWEEN 105 AND 112;

select*
from Employees
where salary not BETWEEN 40000 AND 60000.;

select*
from Employees
where experience BETWEEN 2 AND 4;

--LIKE OPERATORS:

select*
from Employees
where emp_name like 'R%';

select*
from Employees
where emp_name like '%a';

select*
from Employees
where emp_name like '%v%';

select*
from Employees
where city like 'B%';

select*
from Employees
where department like '%e';



