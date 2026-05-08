-- Question 1: Display all employees
SELECT *
FROM Employee;

-- Question 2
SELECT name,
salary
FROM Employee;


-- Question 3:
SELECT name, age
FROM Employee
WHERE age>30;


-- Question 4:
SELECT *
FROM Department
-- Question 5: 
SELECT e.name, d.name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE d.name = 'IT';

--Question 6:
SELECT name
FROM Employee
WHERE name like 'J%';

--Question 7:
SELECT name
FROM Employee
WHERE name like '%e';

--Question 8:
SELECT name
FROM Employee
WHERE name like '%a%';

--Question 9:
SELECT name
FROM Employee
WHERE LENGTH(name)=9;

--Question 10:
SELECT name
FROM Employee
WHERE name LIKE '_o%';

--Question 11:
select *
from Employee
where year(hire_date) = 2020;

--Question 12:
select *
from Employee
where month(hire_date) = 1;

--Question 13:
select *
from Employee
where year(hire_date) < 2019;

--Question 14:
SELECT *
FROM Employee
WHERE hire_date >= '2021-03-01';

--Question 15:
SELECT *
FROM Employee
WHERE hire_date >= '2020-01-01';

--Question 16:
select name, sum(salary) as totalsalary
from Employee
group by name;

--Question 17:
select name, avg(salary) as averagesalary
from Employee
group by name;

--Queston 18:
select min(salary) as minimum_salary
from Employee;

--Question 19:
SELECT department_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY department_id;

--Question 20:
SELECT department_id, avg(salary)
FROM Employee
GROUP BY department_id;

--Question 21:

SELECT department_id, sum(salary) as total_salary
FROM Employee
GROUP BY department_id;

--Question 22:
SELECT department_id, avg(age)
FROM Employee
GROUP BY department_id;

--Question 23:
SELECT YEAR(hire_date) AS hire_year,
COUNT(*) AS total_employees
FROM Employee
GROUP BY YEAR(hire_date);

--Question 24;
SELECT department_id, max(salary) as highest_salary
FROM Employee
GROUP BY department_id;

--Question 25:
SELECT department_id, avg(salary) as average_salary
FROM Employee
GROUP BY department_id
ORDER BY average_salary DESC;

--Question 26:
SELECT department_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

--Question 27:
SELECT department_id, avg(salary) as average_salary
FROM Employee
GROUP BY department_id
HAVING avg(salary)>55000;

--Question 28:
SELECT YEAR(hire_date) AS hire_year,
COUNT(*) AS total_employees
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

--Question 29:
SELECT department_id, sum(salary) as total_salary
FROM Employee
GROUP BY department_id
HAVING sum(salary)<100000;

--Question 30:
SELECT department_id, max(salary) as maximum_salary
FROM Employee
GROUP BY department_id
HAVING max(salary)>75000;

--Question 31:
select *
from Employee
order by salary asc;

--Question 32:
select *
from Employee
order by age desc;

--Question 33:
select *
from Employee
order by hire_date asc;

--Question 34:
select *
from Employee
order by department_id, salary;

--Question 35:
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;

--Question 36:
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

--Question 37:
SELECT p.name AS Project_name, d.name AS department_name
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;

--Question 38:
SELECT p.name AS Project_name, e.name AS Employee_name
FROM Project p
JOIN Employee e
ON p.department_id = emp_id;

--Question 39:
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

---Question 40:
SELECT d.name AS department_name, e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON  d.department_id = e.department_id;
