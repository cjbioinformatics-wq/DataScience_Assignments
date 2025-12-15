CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    age INT
);

INSERT INTO Employees VALUES 
(1, 'Amit', 'IT', 50000, 28),
(2, 'Riya', 'HR', 40000, 26),
(3, 'Neha', 'IT', 60000, 32),
(4, 'Rahul', 'Finance', 55000, 35),
(5, 'Karan', 'HR', 45000, 29);

CREATE TABLE Projects (
    pro_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(50),
    hours_worked INT
);

INSERT INTO Projects VALUES
(101, 1, 'AI system', 120),
(102, 2, 'Recruitment app', 80),
(103, 3, 'Data analysis', 150),
(104, 4, 'Budget planning', 100),
(105, 5, 'HR portal', 90);

SELECT * FROM Employees
WHERE department = 'IT'AND salary>55000;

SELECT * FROM Employees
WHERE department = 'HR' OR department = 'FINANCE';

SELECT * FROM Employees
WHERE NOT department = 'IT';

SELECT SUM(salary) AS total_salary
FROM Employees;

SELECT AVG(salary) AS average_salary
FROM Employees;

SELECT COUNT(emp_id) AS total_employees
FROM Employees;

SELECT * FROM Employees
ORDER BY salary ASC;

SELECT * FROM Employees
ORDER BY age DESC;

SELECT * FROM Projects
WHERE hours_worked > 90;

SELECT department, COUNT(emp_id) AS total_employees
FROM Employees
GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 50000;

SELECT * FROM Employees
WHERE salary BETWEEN 45000 AND 60000;

SELECT * FROM Employees
WHERE department IN ('IT', 'HR');

SELECT * FROM Employees
WHERE department NOT IN ('HR', 'Finance');