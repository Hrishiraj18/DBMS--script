CREATE DATABASE ORG;
USE ORG;

CREATE TABLE department (
	dept_no INT PRIMARY KEY, 
	dept_name VARCHAR(50), 
    location VARCHAR(50)
);

CREATE TABLE employee (
	emp_no INT PRIMARY KEY,
	emp_name VARCHAR(50),
    DOB DATE, 
    address VARCHAR(50), 
    doj DATE, 
    mobile_no BIGINT UNIQUE, 
    dept_no INT, 
    salary INT,
    DESIGNATION VARCHAR(50),
    FOREIGN KEY(dept_no) REFERENCES department(dept_no)
);

INSERT INTO department (dept_no, dept_name, location) 
VALUES 
    (101, 'Sales', 'New York'),
    (102, 'Marketing', 'Los Angeles'),
    (103, 'IT', 'ONTARIO'),
    (104, 'Finance', 'TORONTO'),
    (105, 'Engineering', 'San Francisco'),
    (106, 'Operations', 'San Francisco');

INSERT INTO employee (emp_no, emp_name, DOB, address, doj, mobile_no, dept_no, salary, DESIGNATION) 
VALUES 
    (1001, 'John Doe', '1990-01-01', '123 Main St, New York', '2020-01-01', 5551234, 101, 50000, 'Sales Representative'),
    (1002, 'Jane Smith', '1992-05-15', '456 Elm St, Los Angeles', '2021-02-15', 5552345, 102, 60000, 'Marketing Manager'),
    (1003, 'Bob Johnson', '1985-10-20', '789 Oak St, San Francisco', '2019-07-01', 5553456, 103, 7000, 'Senior Engineer'),
    (1004, 'Mary Johnson', '1988-03-10', '456 Maple St, Chicago', '2022-01-01', 5554567, 104, 55000, 'Accountant'),
    (1005, 'Samuel Lee', '1991-09-22', '789 Pine St, Houston', '2022-02-15', 5555678, 105, 65000, 'HR Coordinator'),
    (1006, 'Asha George', '1981-10-25', '431 Gandhi St, Evorton', '2022-04-25', 5555778, 105, 2500, 'DATA ANALYST'),
	(1007, 'Stan Lee', '1995-04-12', '729 Great St, Toronto', '2022-02-15', 5558678, 105, 5000, 'TESTER'),
    (1008, 'Emily Davis', '1993-07-05', '123 Cedar St, Seattle', '2021-07-01', 5559789, 106, 15000, 'Typist'),
    (1009, 'Emily Davis', '1993-07-05', '523 Bus St, Washington', '2021-07-01', 5569789, 106, 15000, 'Typist');


INSERT INTO department (dept_no, dept_name, location)
VALUES
(107, 'Operations', 'Dallas'),
(108, 'Legal', 'Washington D.C.'),
(109, 'Research and Development', 'Boston'),
(110, 'Customer Service', 'Houston'),
(111, 'Supply Chain Management', 'Miami');

INSERT INTO employee (emp_no, emp_name, DOB, address, doj, mobile_no, dept_no, salary, designation)
VALUES
(1010, 'Sarah Johnson', '1995-06-10', '234 Elm St, Dallas', '2018-03-01', 5553345, 106, 45000, 'Operations Coordinator'),
(1011, 'David Lee', '1980-07-15', '567 Main St, Washington D.C.', '2014-11-01', 5557789, 107, 70000, 'Legal Counsel'),
(1012, 'Samantha Brown', '1985-08-20', '890 Pine St, Boston', '2011-04-01', 5551123, 108, 80000, 'R&D Manager'),
(1013, 'Robert Smith', '1990-09-25', '123 Oak St, Houston', '2016-06-01', 5555567, 110, 50000, 'Customer Service Representative'),
(1114, 'Emily Davis', '2000-10-30', '456 Cedar St, Miami', '2019-08-01', 5559901, 111, 55000, 'Supply Chain Coordinator');

SELECT EMP_NO, EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);
SELECT * FROM EMPLOYEE WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);
SELECT * FROM EMPLOYEE E LEFT JOIN DEPARTMENT D ON E.DEPT_NO = D.DEPT_NO;
SELECT * FROM EMPLOYEE E RIGHT JOIN DEPARTMENT D ON E.DEPT_NO = D.DEPT_NO;
drop database org;