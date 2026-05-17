---1 Use ROW_NUMBER() to assign a row number to employees ordered by salary descending

SELECT employee_name,
department,
salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

--2. Use RANK() to rank employees by salary2.
SELECT employee_name,
department,
salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

--3. Use DENSE_RANK() to rank employees by salary
SELECT employee_name,
department,
salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

--4. Find the top 3 highest-paid employees using a window function

SELECT *
FROM (
    SELECT employee_name,
    department,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
) ranked_employees
WHERE salary_rank <= 3;

---5. Rank employees within each department using PARTITION BY
SELECT employee_name,
department,
salary,
RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
) AS dept_rank
FROM employees;

--6. Display the highest salary in each department using a window function

SELECT DISTINCT department,
MAX(salary) OVER (
    PARTITION BY department
) AS highest_salary
FROM employees;

--7. Calculate the running total of order amounts ordered by order_date
SELECT order_id,
order_date,
total_amount,
SUM(total_amount) OVER (
    ORDER BY order_date
) AS running_total
FROM orders;

--8. Calculate the cumulative sales amount for each employee
SELECT employee_id,
order_id,
order_date,
total_amount,
SUM(total_amount) OVER (
    PARTITION BY employee_id
    ORDER BY order_date
) AS cumulative_sales
FROM orders;

--9. Use LAG() to show the previous order amount for each customer
SELECT employee_id,
order_id,
order_date,
total_amount,
SUM(total_amount) OVER (
    PARTITION BY employee_id
    ORDER BY order_date
) AS cumulative_sales
FROM orders;

--10. Use LEAD() to show the next order amount for each customer
SELECT customer_id,
order_id,
order_date,
total_amount,
LEAD(total_amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
) AS next_order_amount
FROM orders;

--11. Find the difference between the current order amount and previous order amount
SELECT customer_id,order_id,order_date,total_amount,
LAG(total_amount) OVER (PARTITION BY customer_id
    ORDER BY order_date
) AS previous_order_amount,

total_amount -
LAG(total_amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
) AS amount_difference

FROM orders;

--11. Find the difference between the current order amount and previous order amount
SELECT customer_id,
order_id,
order_date,
total_amount,
LAG(total_amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
) AS previous_order_amount,

total_amount -
LAG(total_amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
) AS amount_difference

FROM orders;

--12. Calculate a moving average of the last 3 orders.
SELECT order_id,
order_date,
total_amount,
AVG(total_amount) OVER (
    ORDER BY order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_average
FROM orders;

--13. Use NTILE(4) to divide employees into salary quartiles.

SELECT employee_name,
salary,
NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- 14. Find the first order placed by each customer using ROW_NUMBER

SELECT employee_name,
salary,
NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;

--15. Find the latest order placed by each customer. 
SELECT *
FROM (
    SELECT customer_id,
    order_id,
    order_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS rn
    FROM orders
) t
WHERE rn = 1;

--16. Display employee salaries along with department average salary.
SELECT *
FROM (
    SELECT customer_id,
    order_id,
    order_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date DESC
    ) AS rn
    FROM orders
) t
WHERE rn = 1;

--17. Find employees earning above their department average salary. 

SELECT employee_name,
department,
salary,
AVG(salary) OVER (
    PARTITION BY department
) AS department_avg_salary
FROM employees;

--18. Use SUM() OVER(PARTITION BY department) to calculate department payroll. 
SELECT employee_name,
department,
salary,
SUM(salary) OVER (
    PARTITION BY department
) AS department_payroll
FROM employees;

--19. Find the percentage contribution of each employee salary within their department.
SELECT employee_name,
department,
salary,
ROUND(
    salary * 100.0 /
    SUM(salary) OVER (PARTITION BY department),
2) AS salary_percentage
FROM employees;

--20. Use COUNT() OVER() to show total number of employees alongside each row
SELECT employee_name,
department,
COUNT(*) OVER () AS total_employees
FROM employees;

--21. Create a CTE to calculate total sales per employee. 

WITH employee_sales AS (
    SELECT employee_id,
    SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)

SELECT *
FROM employee_sales;


--22. Use a CTE to find employees whose sales exceed the company average. 
WITH employee_sales AS (
    SELECT employee_id,
    SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
),

company_avg AS (
    SELECT AVG(total_sales) AS avg_sales
    FROM employee_sales
)

SELECT es.*
FROM employee_sales es, company_avg ca
WHERE es.total_sales > ca.avg_sales;


--23. Create multiple CTEs to calculate customer total spending and rankings.
WITH customer_spending AS (
    SELECT customer_id,
    SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)

SELECT customer_id,
total_spent,
RANK() OVER (
    ORDER BY total_spent DESC
) AS spending_rank
FROM customer_spending;

--- 24. Write a recursive CTE to generate numbers from 1 to 10. 
WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10
)

SELECT *
FROM numbers;

--25. Use a recursive CTE to display employee hierarchy data. 
WITH RECURSIVE employee_hierarchy AS (
    SELECT employee_id,employee_name,manager_id,
    1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id,
    e.employee_name,
    e.manager_id,
    eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh
    ON e.manager_id = eh.employee_id
)

SELECT *
FROM employee_hierarchy;


---26. Create a CTE that filters orders above the average order amount. 
WITH avg_orders AS (
    SELECT AVG(total_amount) AS avg_amount
    FROM orders
)

SELECT *
FROM orders
WHERE total_amount >
(
    SELECT avg_amount
    FROM avg_orders
);

--27. Use a CTE and window function together to rank customers by total spending.

WITH customer_spending AS (
    SELECT customer_id,
    SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)

SELECT customer_id,
total_spent,
RANK() OVER (
    ORDER BY total_spent DESC
) AS spending_rank
FROM customer_spending;

--- 28. Find the second-highest salary in each department.
SELECT *
FROM (
    SELECT employee_name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS rnk
    FROM employees
) t
WHERE rnk = 2;


-- 29. Display the difference between each employee salary and the department maximum salary.
SELECT employee_name,
department,
salary,
MAX(salary) OVER (
    PARTITION BY department
) - salary AS salary_difference
FROM employees;


-- 30. Combine CTEs and window functions to find the top-performing employee in each department based on total sales
WITH employee_sales AS (
    SELECT e.employee_id,
    e.employee_name,
    e.department,
    SUM(o.total_amount) AS total_sales
    FROM employees e
    LEFT JOIN orders o
    ON e.employee_id = o.employee_id
    GROUP BY e.employee_id,
    e.employee_name,
    e.department
),

ranked_sales AS (
    SELECT *,
    RANK() OVER (
        PARTITION BY department
        ORDER BY total_sales DESC
    ) AS rnk
    FROM employee_sales
)

SELECT *
FROM ranked_sales
WHERE rnk = 1;
