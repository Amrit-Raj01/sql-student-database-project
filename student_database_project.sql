-- College Student Management System

CREATE DATABASE college;

USE college;

-- Student Table
CREATE TABLE students (
student_id INT PRIMARY KEY,
name VARCHAR(50),
branch VARCHAR(20),
semester int);

-- Courses Table
CREATE TABLE courses(
courses_id INT PRIMARY KEY,
courses_name VARCHAR(50),
credits int);

-- Enrollment Tbale
CREATE TABLE enrollments (
enrollments_id INT PRIMARY KEY,
student_id INT,
courses_id INT,
marks INT,
FOREIGN KEY (student_id) REFERENCES students( student_id ),
FOREIGN KEY ( courses_id ) REFERENCES courses (courses_id) );

-- Data Value
INSERT INTO students VALUES
(1, "Amrit", "ECE", 3),
(2, "Narayan", "CSE", 4),
(3, "Aditya", "CSE", 2);

INSERT INTO courses VALUES
(101, "DBMS", 5),
(102, "PYTHON", 3),
(103, "JAVA", 4);

INSERT INTO enrollments VALUES
(1, 1, 101, 85),
(2, 1, 102, 78),
(3, 2, 101, 90),
(4, 3, 103, 78);

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- Top Perform Students
SELECT s.name, AVG(e.marks) AS avg_marks FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.name
ORDER BY avg_marks DESC;

-- Courses-wise Average Marks
SELECT c.courses_name, AVG(e.marks) AS avg_marks FROM courses c
JOIN enrollments e ON c.courses_id = e.courses_id
GROUP BY c.courses_name;

-- Students Scoring Above 85
SELECT DISTINCT s.name FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.marks > 85;

-- Number Of Students Per Branch
SELECT branch, COUNT(*) AS
total_students FROM students 
GROUP BY branch;







