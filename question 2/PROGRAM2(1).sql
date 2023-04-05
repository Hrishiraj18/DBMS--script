SHOW DATABASES;
USE course;
show tables;
#creation of table employee
Create table employee(emp_no int(10),emp_name varchar(20)NOT NULL,DOB varchar(10),address varchar(20),DOJ varchar(10),mobile_no int (10), dept_no int(10),salary int (10),designation varchar(20) NOT NULL,PRIMARY KEY(emp_no),FOREIGN KEY(dept_no) REFERENCES department(dept_no));
drop table employee;
#creation of table department
create table department(dept_no int(10),dept_name varchar(20) NOT NULL,primary key(dept_no));

#insertion of data into table 1
insert into employee values('122','JOHN','16/02/1996','ATTINGAL','19/10/2019',1234567,1,7000,'AI ENGINNER');
insert into employee values('123','AMAL','18/07/1998','TVM','16/02/2019',3224367,2,10000,'DATA SCIENTIST');
insert into employee values('124','JOHN','13/08/1999','KOLLAM','26/05/2018',6324893,3,6300,'CLOUD ARCHITECT');
insert into employee values('125','LUCKY','26/07/1994','ALAPPUZHA','27/08/2022',097538,4,4900,'Typist');
insert into employee values('126','MICHAEL','23/09/1999','KOCHI','26/12/2018',232347,5,19000,'CEO');
insert into employee values('129','AKHIL','16/02/1996','ATTINGAL','19/10/2019',12349567,1,19500,'AI ENGINNER');

#insertion of data into table 2
INSERT INTO department values('1','AI');
INSERT INTO department values('2','DS');
INSERT INTO department values('3','CLOUD');
INSERT INTO department values('4','DEV');
INSERT INTO department values('5','ADMIN');

#display commands question 2
select *from department;
select * from employee;
select emp_no,emp_name from employee where dept_no=2;
select emp_no,emp_name,designation,dept_no,salary from employee order by salary desc;
select emp_no,emp_name from employee where salary between 2000 and 5000;
select distinct designation from employee;
select dept_no,sum(salary) as SUM from employee group by dept_no;
select dept_name,salary from department,employee;
update employee set salary=25000 where designation='Typist';
select designation,salary from employee where designation="Typist";
select * from employee;
update employee set mobile_no=975934 where emp_name="JOHN";
select emp_name,mobile_no from employee where emp_name="JOHN";
delete from employee where emp_name="JOHN";
delete from employee where salary=7000;
SELECT dept_no,sum(salary) FROM employee GROUP BY salary  HAVING  sum(salary) > 2500;
#7th part
select department.dept_name ,sum(employee.salary) as SUM_SALARY from department join employee on (department.dept_no=employee.dept_no) group by dept_name;
#11 part
select department.dept_name,sum(employee.salary) as total_salary from department join employee on(department.dept_no=employee.dept_no) group by dept_name having sum(employee.salary)>20000;