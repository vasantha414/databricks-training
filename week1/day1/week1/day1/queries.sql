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
