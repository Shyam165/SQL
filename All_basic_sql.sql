-- by using name bootcamp , it does not require write bootcamp name again and again.
use bootcamp;

-- creating a table named orders.
create table orders
(
o_id int, 
price int,
customer varchar(250)
);

-- inserting some data into the table of orders.
insert into orders(o_id, price, customer) values(1, 2341, "Rahul");
insert into orders(o_id, price, customer) values(2, 2342, "Rohit");
insert into orders(o_id, price, customer) values(3, 2343, "Rohan");
insert into orders(o_id, price, customer) values(4, 2344, "arjun");
insert into orders(o_id, price, customer) values(5, 2345, "karan");
insert into orders(o_id, price, customer) values(6, 2346, "raj");
insert into orders(o_id, price, customer) values(7, 2347, "sohan");
insert into orders(o_id, price, customer) values(8, 2348, "yadav");
insert into orders(o_id, price, customer) values(9, 2349, "aryan");
insert into orders(o_id, price, customer) values(10, 2340, "kumar");

select * from orders;

-- make all prices in ascending and descending order.
select price from orders order by price desc; 

-- use of where clause like giving some conditions in order to get some selected orders
select * from orders where o_id = 4 and price = 2344;
select * from orders where o_id = 4 or price = 2345;

-- In order to get the unique values from the table use distinct func.
select distinct(customer) from orders;

-- find the total price of all customers.
select sum(price) from orders;

-- make all the customer names into the uppercase.alter
select ucase(customer) from orders;

-- find the total sum from each customer.
select  customer, sum(price) from orders group by customer;
select customer, sum(price) as total from orders group by customer order by total desc;

-- Display only those customers which is having order greater than 2345 .
-- Note we can only use having clause here in group by statement for some conditions as we can't use where clause here.
select customer, sum(price) from orders group by customer having sum(price) > 2345;

alter table orders add location varchar (250);     # add new column
alter table orders drop location;                  # drop column
alter table orders modify o_id varchar(250);       # modificaition in column

-- alias name 
select price as order_price from orders;

drop table person;                 # this wil delete entire table named person.
drop database bootcamp;            # this will delete entire bootcamp.

-- use of substring function in order to get only few letter from selected strings
select customer, substr(customer, 1, 2) from orders;

-- between function allow to select items between given values only
select customer, price from orders where price  between 2345 and 2348;

-- In operator allow you to specify the multiple values in a where clause.
select customer from orders where customer  in ("karan", "raj", "yadav");

-- use of SQL LIKE operator 
select customer from orders where customer Like "R%";          # finds start with R letter 
select customer from orders where customer Like "%T";  		   # ends with T letter
select customer from orders where customer Like "R%T";  	   # starts with R and Ends with T letter
select customer from orders where customer Like "_o%";         # starts with any letter but second letter is o
select customer from orders where customer Like "%hi%";        # string should contains letters hi in between them
select customer from orders where customer Like "R_%";         # starts with R and after that at least any two letter 

-- use of TRUNCATE OPERATOR:- it is used to delete all values in the table without removing columns name
truncate table orders;

-- update will modify some data in the table wherever we want 
update orders       
set price = 3000
where o_id = 7;

------------------------------------------------------------------------------------------------------------

-- Constraints :- Not Null , Unique, check

use bootcamp;
drop table Man;
select * from Man;
create table Man
(
m_id int not null unique,
m_Name varchar(250),
m_salary int,
check ( m_salary > 57000)
);

insert into Man(m_id, m_Name, m_salary) values( 1 , "Shivam", 57800);
insert into Man(m_id, m_Name, m_salary) values( 2 , "Shivam", 40000);

-----------------------------------------------------------------------------------------------------------------

-- Constraints :- primary key(not null + unique) , foreign key

use bootcamp;

create table Student              # Parent table
(
reg_id int primary key,
s_Name varchar (240),
city varchar(230)
);

create table Result				  # Child table 
(
s_subject varchar(230),
marks int,
reg_id int,
foreign key (reg_id) references Student(reg_id)
);

insert into Student (reg_id, s_Name, city) values (1, "shivam", "jaipur");
insert into Student (reg_id, s_Name, city) values (2, "satyam", "kota");
insert into Student (reg_id, s_Name, city) values (3, "sundaram", "ajmer");
select * from Student;

insert into Result (reg_id, marks, s_subject) values (1, 88, "maths");
insert into Result (reg_id, marks, s_subject) values (2, 89, "python");
insert into Result (reg_id, marks, s_subject) values (3, 90, "science");
select * from Result;

-- use of auto_increment
create table Hello
(
h_id int primary key auto_increment,
h_name varchar (340),
h_city varchar (230)
);

insert into Hello(h_name, h_city) values("arjun", "jaipur");
insert into Hello(h_name, h_city) values("karan", "ajmer");
select * from Hello;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

use employment;
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  emp_name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  email_address VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  work_experience INT NOT NULL,
  address VARCHAR(100) NOT NULL,
  contact_number VARCHAR(20) NOT NULL
);
INSERT INTO employees (employee_id, emp_name, age, email_address, department, work_experience, address, contact_number)
VALUES 
(1, 'John Doe', 35, 'john.doe@example.com', 'Sales', 10, '123 Main St, Anytown, USA', '555-1234'),
(2, 'Jane Smith', 28, 'jane.smith@example.com', 'Marketing', 5, '456 Elm St, Anytown, USA', '555-5678'),
(3, 'Bob Johnson', 42, 'bob.johnson@example.com', 'Engineering', 15, '789 Oak St, Anytown, USA', '555-9012'),
(4, 'Sarah Lee', 30, 'sarah.lee@example.com', 'Finance', 7, '234 Maple St, Anytown, USA', '555-3456'),
(5, 'Tommy Nguyen', 25, 'tommy.nguyen@example.com', 'IT', 3, '567 Pine St, Anytown, USA', '555-7890'),
(6, 'Jenny Kim', 38, 'jenny.kim@example.com', 'HR', 12, '890 Cedar St, Anytown, USA', '555-2345'),
(7, 'David Lee', 27, 'david.lee@example.com', 'Sales', 4, '2345 Birch St, Anytown, USA', '555-6789'),
(8, 'Mary Smith', 33, 'mary.smith@example.com', 'Marketing', 8, '6789 Cedar St, Anytown, USA', '555-1234'),
(9, 'Alex Johnson', 45, 'alex.johnson@example.com', 'Engineering', 20, '123 Oak St, Anytown, USA', '555-5678');

select * from employees;

-- Add a new column
ALTER TABLE employees
ADD COLUMN salary DECIMAL(10,2);

-- Rename a column
ALTER TABLE employees
RENAME COLUMN work_experience TO years_of_experieinfonce;

-- Change data type of a column
ALTER TABLE employees
MODIFY COLUMN age SMALLINT;

DELETE FROM employees
WHERE employee_id = 5;

ALTER TABLE employees
ADD CONSTRAINT chk_age CHECK (age >= 18 AND age <= 70);

UPDATE employees
SET age = 31,o_info
    email_address = 'sarah.lee@newemail.com'
WHERE employee_id = 4;


-- Drop a column
ALTER TABLE employees
DROP COLUMN salary;

ALTER TABLE employeesresult
DROP CONSTRAINT chk_age;

TRUNCATE TABLE employees;
DROP DATABASE employment;




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Join Operation

use bootcamp;
create table info
(
p_id int,
p_name varchar (230),
address varchar (340),
salary int 
);

insert into info (p_id, p_name, address, salary) values (1, "rohan", "H-123", 23000);
insert into info (p_id, p_name, address, salary) values (2, "sanjay", "P-23", 24000);
insert into info (p_id, p_name, address, salary) values (3, "mohit", "J-12", 23400);
insert into info (p_id, p_name, address, salary) values (4, "amit", "I-23", 23050);

create table o_info
(
p_id int,
o_id int, 
order_no int
);

insert into o_info (p_id, o_id, order_no) values (4, 345,2300045);
insert into o_info (p_id, o_id, order_no) values (3, 454,2400056);
insert into o_info (p_id, o_id, order_no) values (5, 432,2340078);

select * from info;
select * from o_info;

select info.p_id, info.p_name, info.address,  info.salary, o_info.o_id, o_info.order_no from info
inner join o_info on info.p_id = o_info.p_id;

select info.p_id, info.p_name, info.address,  info.salary, o_info.o_id, o_info.order_no from info
left join o_info on info.p_id = o_info.p_id;

select info.p_id, info.p_name, info.address,  info.salary, o_info.o_id, o_info.order_no from info
right join o_info on info.p_id = o_info.p_id;

-------------------------------------------------------------------------------------------------

# Window Function

use bootcamp;
create table employee
(
emp_id int, 
emp_name varchar(230),
dept_name varchar(230),
salary int
);

insert into employee(emp_id, emp_name, dept_name, salary) values(101, "mohan", "admin", 4000);
insert into employee(emp_id, emp_name, dept_name, salary) values(102, "sohan", "IT", 3000);
insert into employee(emp_id, emp_name, dept_name, salary) values(103, "rohan", "HR", 5000);
insert into employee(emp_id, emp_name, dept_name, salary) values(104, "mohit", "admin", 6000);
insert into employee(emp_id, emp_name, dept_name, salary) values(105, "abhishek", "finance", 4000);
insert into employee(emp_id, emp_name, dept_name, salary) values(106, "amit", "IT", 4000);
insert into employee(emp_id, emp_name, dept_name, salary) values(107, "shivam", "finance", 4000);
insert into employee(emp_id, emp_name, dept_name, salary) values(108, "shubham", "admin", 4000);
insert into employee(emp_id, emp_name, dept_name, salary) values(109, "ronak", "IT", 5000);
insert into employee(emp_id, emp_name, dept_name, salary) values(110, "yadav", "HR", 4500);
insert into employee(emp_id, emp_name, dept_name, salary) values(111, "rahul", "finance", 10000);
insert into employee(emp_id, emp_name, dept_name, salary) values(112, "rohit", "admin", 4300);
insert into employee(emp_id, emp_name, dept_name, salary) values(113, "manish", "HR", 4300);
insert into employee(emp_id, emp_name, dept_name, salary) values(114, "kumar", "IT", 5500);
insert into employee(emp_id, emp_name, dept_name, salary) values(115, "singh", "finance", 5000);
insert into employee(emp_id, emp_name, dept_name, salary) values(116, "mayank", "HR", 4000);
insert into employee(emp_id, emp_name, dept_name, salary) values(117, "madan", "admin", 5000);
insert into employee(emp_id, emp_name, dept_name, salary) values(118, "kapil", "IT", 4000);
insert into employee(emp_id, emp_name, dept_name, salary) values(119, "rachit", "finance", 3000);
insert into employee(emp_id, emp_name, dept_name, salary) values(120, "kuldeep", "admin", 4000);
insert into employee(emp_id, emp_name, dept_name, salary) values(121, "alok", "HR", 6000);

select * from employee;

select dept_name, max(salary) as max_salary
from employee group  by dept_name;

select e.*,
max(salary) over(partition by dept_name) as max_salary
from employee e;

# COMMON TABLE EXPRESSION (CTE)

-- fetch the first 2 rows of employee from each department based on emp_id
 
select * from
  (  
  select e.*,
  row_number() over (partition by dept_name order by emp_id) as rn
  from employee e
  ) x
  where x.rn<3;
  
  -- fetch the first 3 top employee from each department based on their salary
  
  select * from
  (  
  select e.*,
  row_number() over (partition by dept_name order by salary) as rnk
  from employee e
  ) x
  where x.rnk<=3;

  -- write a pl/sql program that takes an input of emp number and delete that row in a table and also store that deleted part in history table.

  declare 
emp_number number;
begin
emp_number := :emp_number;
insert into history
select * from customers
where id = emp_number;

delete from customers where id = emp_number;
commit;

dbms_output.put_line('deleted data and inserted data successfully');
end;

-- write a pl/sql program to duplicate the data into the another table

declare 
emp_number number;
begin
insert into duplicate
select * from customers
where id>=1;
commit;

dbms_output.put_line(' inserted data successfully into the duplicated table');
end;

-- write a pl/sql program to update the salary of specific employees by 6% if salary encodes the mid range of salary against this job and update upto mid range if salary is less than the mid range.

DECLARE
  job_id number;
  mid_range   NUMBER;
BEGIN

  SELECT (MIN(salary) + MAX(salary)) / 2
  INTO mid_range
  FROM customers
  WHERE id>=1;

  UPDATE customers
  SET salary = CASE
    WHEN salary >= mid_range THEN salary * 1.06 
    WHEN salary < mid_range THEN mid_range 
  END
  WHERE id>=1;

  
  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');
END;


-- Step 2: Create a procedure for inserting values into the table
CREATE OR REPLACE PROCEDURE insert_student (
  p_id     IN NUMBER,
  p_name   IN VARCHAR2,
  p_age    IN NUMBER,
  p_grade  IN VARCHAR2
) AS
BEGIN
  INSERT INTO student1 (id, name, age, grade)
  VALUES (1, 'shyam', 20, 'A');
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Student inserted successfully.');
END;

BEGIN
  insert_student(1, 'John Doe', 18, 'A');
  insert_student(2, 'Jane Smith', 19, 'B');
  insert_student(3, 'Mark Johnson', 20, 'C');
END;

-- Step 2: Create a procedure for updating  values into the table
CREATE OR REPLACE PROCEDURE update_student_grade (
  p_id     IN NUMBER,
  p_grade  IN VARCHAR2
) AS
BEGIN

  UPDATE student1
  SET grade = p_grade
  WHERE id = p_id;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Student grade updated successfully.');
  end;

  begin
update_student_grade(1, 'B');
end;