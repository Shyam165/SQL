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


PL/SQL
DECLARE
<declarations section>
BEGIN
<executable command(s)>
EXCEPTION
<exception handling> END;
A Simple Program
DECLARE
message varchar2(20):= 'Hello, World!';
BEGIN
dbms_output.put_line(message); END;
Comments
DECLARE
-- variable declaration
message varchar2(20):= 'Hello, World!';
BEGIN
/*
* PL/SQL executable statement(s)
*/
dbms_output.put_line(message); END;
Data Type Declaration
DECLARE num1 INTEGER; num2 REAL;
BEGIN null; END;
// Print the value of name and age
DECLARE
a integer := 10; b integer := 20; c integer; f real;
BEGIN c := a + b;
dbms_output.put_line('Value of c: ' || c); f := 70.0/3.0;
dbms_output.put_line('Value of f: ' || f);
END;
DECLARE
SUBTYPE name IS char(20); SUBTYPE message IS varchar2(100); salutation name; greetings message;
BEGIN
salutation := 'Reader '; greetings := 'Welcome to the World of PL/SQL'; dbms_output.put_line('Hello ' || salutation || greetings);
END;
Assigning SQL Query Results to PL/SQL
Variables
CREATE TABLE CUSTOMERS(
ID	INT NOT NULL,
NAME VARCHAR (20) NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR (25),
SALARY	DECIMAL (18, 2),
PRIMARY KEY (ID)
);
INSERT INTO CUSTOMERS
(ID,NAME,AGE,ADDRESS,SALARY)
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );
INSERT INTO CUSTOMERS
(ID,NAME,AGE,ADDRESS,SALARY)
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );
INSERT INTO CUSTOMERS
(ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );
Set serveroutput on
DECLARE
c_id customers.id%type := 1; c_name customers.name%type; c_addr customers.address%type; c_sal customers.salary%type;
BEGIN
SELECT name, address, salary INTO c_name, c_addr, c_sal
FROM customers WHERE id = c_id;
dbms_output.put_line
('Customer ' ||c_name || ' from ' || c_addr || ' earns ' || c_sal);
END;
/
Delimiter	Description
+, -, *, /	Addition, subtraction/negation, multiplication, division
%	Attribute indicator
'
Character string delimiter
.
Component selector
(,)	Expression or list delimiter
:
Host variable indicator
,
Item separator
"
Quoted identifier delimiter
=	Relational operator
@	Remote access indicator
;
Statement terminator
:=	Assignment operator
=>	Association operator
||
Concatenation operator
**	Exponentiation operator
<<, >>	Label delimiter (begin and end)
/*, */	Multi-line comment delimiter (begin and end)
--	Single-line comment indicator
..
Range operator
<, >, <=, >=	Relational operators
<>, '=, ~=, ^=	Different versions of NOT EQUAL
Statements IF-THEN IF-THEN-ELSE IF-THEN-ELSEIF Q.Write a PL/SQL program to arrange the number of two variable in such a way that the small number will store in num_small variable and large number will store in num_large variable.
Sol: DECLARE num_small NUMBER := 8; num_large NUMBER := 5; num_temp NUMBER;
BEGIN
IF num_small > num_large THEN num_temp := num_small; num_small := num_large; num_large := num_temp;
END IF;
DBMS_OUTPUT.PUT_LINE ('num_small = '||num_small);
DBMS_OUTPUT.PUT_LINE ('num_large = '||num_large);
END;
/
PL/SQL Loop
PL/SQL loops can be labeled. The label should be enclosed by double angle brackets (<< and >>) and appear at the beginning of the LOOP statement. The label name can also appear at the end of the LOOP statement.
DECLARE
i number(1); j number(1); BEGIN
<< outer_loop >>
FOR i IN 1..3 LOOP << inner_loop >>
FOR j IN 1..3 LOOP
dbms_output.put_line('i is: '|| i || ' and j is: ' || j);
END loop inner_loop;
END loop outer_loop;
END;
The Loop Control Statements
EXIT
The Exit statement completes the loop and control passes to the statement immediately after the END LOOP.
Set serveroutput on
DECLARE a number(2) := 10;
BEGIN
-- while loop execution
WHILE a < 20 LOOP
dbms_output.put_line ('value of a: ' || a);
a := a + 1;
IF a > 15 THEN
-- terminate the loop using the exit statement
EXIT;
END IF;
END LOOP;
END;
CONTINUE statement
Causes	the	loop	to	skip	the	remainder	of	its	body	and immediately retest its condition prior to reiterating.
DECLARE a number(2) := 10;
BEGIN


-- while loop execution
WHILE a < 20 LOOP
dbms_output.put_line ('value of a: ' || a);
a := a + 1;
IF a = 15 THEN
-- skip the loop using the CONTINUE statement
a := a + 1;
CONTINUE;
END IF;
END LOOP;
END;


-- GOTO statement
-- Transfers control to the labeled statement. Though it is not advised to use the GOTO statement in your program.
DECLARE a number(2) := 10; BEGIN
<<loopstart>>
-- while loop execution
WHILE a < 20 LOOP
dbms_output.put_line ('value of a: ' || a);
a := a + 1;
IF a = 15 THEN
a := a + 1;
GOTO loopstart;
END IF;
END LOOP;
END;
PL/SQL - Strings
- - (clob can store upto 128 terabytes is a string)
All are the types to store string variables
DECLARE
name varchar2(20); company varchar2(30); introduction clob;
choice char(1);
BEGIN name := 'John Smith'; company := 'Infotech'; introduction := ' Hello! I''m John Smith from Infotech.'; choice := 'y';
IF choice = 'y' THEN
dbms_output.put_line(name);
dbms_output.put_line(company);
dbms_output.put_line(introduction);
END IF; END;
//String methods
DECLARE
greetings varchar2(11) := 'hello world';
BEGIN
dbms_output.put_line(UPPER(greetings)); dbms_output.put_line(LOWER(greetings)); dbms_output.put_line(INITCAP(greetings));
/* retrieve the first character in the string */ dbms_output.put_line ( SUBSTR (greetings, 1, 1));
/* retrieve the last character in the string */ dbms_output.put_line ( SUBSTR (greetings, -1, 1));
/* retrieve five characters,
starting from the seventh position. */
dbms_output.put_line ( SUBSTR (greetings, 7, 5));
/* retrieve the remainder of the string,
starting from the second position. */
dbms_output.put_line ( SUBSTR (greetings, 2));
/* find the location of the first "e" */
dbms_output.put_line ( INSTR (greetings, 'e'));
END;
DECLARE
subject varchar2(30) := '......Database Management System.....'; BEGIN
dbms_output.put_line(RTRIM(subject,'.')); dbms_output.put_line(LTRIM(subject, '.'));
dbms_output.put_line(TRIM( '.' from subject));
END;
PL/SQL - Procedures
PL/SQL provides two kinds of subprograms −
Functions − These subprograms return a single value; mainly used to compute and return a value.
Procedures − These subprograms do not return a value directly; mainly used to perform an action.
Creating a Procedure
CREATE [OR REPLACE] PROCEDURE procedure_name
[(parameter_name [IN | OUT | IN OUT] type [, ...])]
{IS | AS}
BEGIN
< procedure_body >
END procedure_name;
Example
CREATE OR REPLACE PROCEDURE greetings
AS
BEGIN
dbms_output.put_line('Hello World!');
END;
/
Executing a Standalone Procedure
A standalone procedure can be called in two ways −
	 	Using the EXECUTE keyword
	 	Calling the name of the procedure from a PL/SQL block
The above procedure named 'greetings' can be called with the EXECUTE keyword as −
EXECUTE greetings;
The above call will display −
Hello World
PL/SQL procedure successfully completed.
The procedure can also be called from another PL/SQL block −
BEGIN
greetings;
END;
/
Deleting a Standalone Procedure
DROP PROCEDURE procedure-name;
DROP PROCEDURE greetings;
DECLARE a number; b number; c number;
PROCEDURE findMin(x IN number, y IN number, z OUT number) IS
BEGIN
IF x < y THEN
z:= x;
ELSE
z:= y;
END IF;
END;
BEGIN a:= 23; b:= 45; findMin(a, b, c);
dbms_output.put_line(' Minimum of (23, 45) : ' || c);
END;
/
IN & OUT Mode Example
DECLARE a number;
PROCEDURE squareNum(x IN OUT number) IS
BEGIN x := x * x;
END;
BEGIN a:= 23; squareNum(a);
dbms_output.put_line(' Square of (23): ' || a);
END;
/


PL/SQL - Triggers
Triggers are, in fact, written to be executed in response to any of the following events −
A database manipulation (DML) statement (DELETE, INSERT, or UPDATE) A database definition (DDL) statement (CREATE, ALTER, or DROP). A database operation (SERVERERROR, LOGON, LOGOFF, STARTUP, or SHUTDOWN).
Creating Triggers
The syntax for creating a trigger is −
CREATE [OR REPLACE ] TRIGGER trigger_name
{BEFORE | AFTER }
{INSERT [OR] | UPDATE [OR] | DELETE}
ON table_name
[REFERENCING OLD AS o NEW AS n]
[FOR EACH ROW]
WHEN (condition)
DECLARE
Declaration-statements
BEGIN
Executable-statements
EXCEPTION
Exception-handling-statements END;
Example:
CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON customers
FOR EACH ROW
WHEN (NEW.ID > 0)
DECLARE
sal_diff number;
BEGIN sal_diff := :NEW.salary - :OLD.salary; dbms_output.put_line('Old salary: ' || :OLD.salary); dbms_output.put_line('New salary: ' || :NEW.salary); dbms_output.put_line('Salary difference: ' || sal_diff);
END;
/
Triggering a Trigger
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (7, 'Kriti', 22, 'HP', 7500.00 );
2. UPDATE customers
SET salary = salary + 500
WHERE id = 2;


