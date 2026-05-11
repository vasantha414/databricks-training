--Question 1:
select s.student_name, c.course_name
from students s
left join enrollments e on s.student_id = e.student_id
left join courses c on e.course_id = c.course_id;

---Question 2:

select c.course_name
from courses c
left join enrollments e on c.course_name = e.student_id
where e.course_id is null;

--Question3:

SELECT i.instructor_name,c.course_name
FROM instructors i
LEFT JOIN courses c
ON i.instructor_id = c.instructor_id;

--Question4:

SELECT *
FROM courses
WHERE instructor_id IS NULL;

--Question5:

SELECT s.student_name,e.enrollment_id,e.course_id,e.enrollment_date
FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id;

--Question6:

SELECT s.student_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

--Questionn7:

SELECT s.student_name, e.enrollment_id, e.course_id
FROM students s
FULL OUTER JOIN enrollments e
ON s.student_id = e.student_id;

--Question8:

SELECT c.course_name
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

--Qestion9:

SELECT i.instructor_name, c.course_name
FROM instructors i
FULL OUTER JOIN courses c
ON i.instructor_id = c.instructor_id;

--Question 10:
SELECT s.student_name, c.course_name, i.instructor_name
FROM students s
FULL OUTER JOIN enrollments e ON s.student_id = e.student_id
FULL OUTER JOIN courses c ON e.course_id = c.course_id
FULL OUTER JOIN instructors i ON c.instructor_id = i.instructor_id;


