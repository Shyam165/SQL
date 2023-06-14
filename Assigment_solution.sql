-- Q-1 :- Create a table called "students" with columns "id" (integer, primary key, auto-increment), "name" (text), "age" (integer), and "gender" (text).

use sample_practice;
create table students
(
s_id int primary key  auto_increment,
s_name varchar(230),
age int, 
gender varchar (230)
);

-- Q-2 :- Insert three rows of data into the "students" table.

insert into students(s_name, age, gender) values ("shivam", 19, "male");
insert into students(s_name, age, gender) values ("rohit", 20, "male");
insert into students(s_name, age, gender) values ("riya", 18, "female");

-- Q-3 :-  Retrieve all rows from the "students" table.

select * from students;

-- Q-4 :- Update the name of the student with id = 2 to "Janet".
update students 
set s_name = "Janet"
where s_id = 2;

-- Q-5 :- Delete the row with id = 3 from the "students" table.
delete from students
where s_id = 3;

--------------------------------------------------------------------------------------------------------------------------------

use sample_practice;
CREATE TABLE sales (
    salesman_id INT,
    s_name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4,2)
);

INSERT INTO sales (salesman_id, s_name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5003, 'Pit Alex', 'London', 0.11),
    (5004, 'Mc Lyon', 'Paris', 0.14),
    (5005, 'Paul Adam', 'Rome', 0.13),
    (5006, 'Lauson Hen', 'San Jose', 0.12),
    (5007, 'john', 'Paris', 0.14),
    (5008, 'harry', 'London', 0.16);

select * from sales;

-- Q-1 :- Write a query to retrieve the names of all salespeople who work in the city of Paris.

select s_name as Names_of_salesman from sales
where city = "Paris" ;

-- Q-2 :- Write a query to retrieve the name and commission rate of the salesperson with the highest commission.

select s_name , max(commission) as highest_commission from sales
group by s_name order by highest_commission desc;

select city , max(commission) as highest_commission from sales         # for cities
group by city order by highest_commission desc;

select * from 
(
select s.*,
max(commission) over (partition by city order by salesman_id) as highest_commission
from sales  s
) x
where x.highest_commission > 0.13 ;

-- Q-3 :- Write a query to retrieve the name and city of all salespeople and customers who live in the same city.
-- Q-4 :- Write a query to calculate the total commission earned by all salespeople in the table.

select sum(commission) as total_commission from sales;     # answer :- 4

-- Q-5 :- Write a query to update the commission rate for the salesperson with salesman_id 5001 to 0.20.

update  sales
set commission = 0.20
where salesman_id = 5001;

select * from sales;

-- Q-6 :- Write a query to delete all sales records for salespeople who work in the city of San Jose.

delete from sales
where city = "San Jose";

--------------------------------------------------------------------------------------------------------------------------------

use sample_practice;

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    commission DECIMAL(4,2) NOT NULL
);

INSERT INTO salesman (salesman_id, name, city, commission)
VALUES 
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    grade INT,
    salesman_id INT REFERENCES salesman(salesman_id)
);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
VALUES 
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
    (3001, 'Brad Guzan', 'London', NULL, 5005);

-- Q-1 :- From the following tables write a query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city

SELECT s.name AS salesman, c.cust_name, c.city
FROM salesman s
JOIN customer c ON s.salesman_id = c.salesman_id
WHERE s.city = c.city;


