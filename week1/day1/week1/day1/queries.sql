-- Question 1: Display all employees
SELECT * FROM Employee;

-- Question 2: Employees with salary > 50000
SELECT name, salary FROM Employee
WHERE salary > 50000;

-- Question 3: Employees and departments
SELECT e.name, d.name AS department
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- Question 4: Count employees in each department
SELECT department_id, COUNT(*) 
FROM Employee
GROUP BY department_id;

-- Question 5: Employees without department
SELECT * FROM Employee
WHERE department_id IS NULL;
