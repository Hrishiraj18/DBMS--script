create database db;
show databases;
use db;
create table employees(
emp_no int not null,
emp_name varchar(100),
dob date,
wh int not null
);


create table del(
emp_no int not null,
emp_name varchar(100),
dob date,
wh int not null
);
show columns from del;
show columns from employees;
insert into employees values('1',"Hrishiraj",'2001-04-17','1');
insert into employees values('2',"Namitha",'2001-06-11','2');
insert into employees values('3',"Iqbal",'2001-07-20','-1');
insert into employees values('4',"Agraj",'2001-10-28','3');
o

DELIMITER //
CREATE TRIGGER before_insert 
BEFORE INSERT ON employees FOR EACH ROW
BEGIN
IF NEW.wh<0 THEN SET NEW.wh=0;
END IF;
END//

DELIMITER //
CREATE TRIGGER before_update 
BEFORE UPDATE ON employees FOR EACH ROW
BEGIN
IF OLD.wh=3 THEN SET NEW.emp_name="Sneha";
END IF;
END//

UPDATE employees
SET emp_name="Blaaah"
WHERE wh=3;

DELIMITER //
CREATE TRIGGER before_delete
BEFORE DELETE ON employees FOR EACH ROW
BEGIN
INSERT INTO del(emp_no,emp_name,dob,wh)
VALUES(OLD.emp_no,OLD.emp_name,OLD.dob,OLD.wh);
END//
DELETE FROM employees
WHERE wh=2;
select * from del;


drop table employees;
drop database db;