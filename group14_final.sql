-- ifdrop for convenience
DROP DATABASE IF EXISTS group14_finalassgmt;

-- create the database
create database group14_finalassgmt;
use group14_finalassgmt;

-- create tables --
create table Bank(
bank_id int PRIMARY KEY,
institutionNum int NOT NULL
);

create table Department(
dep_id int PRIMARY KEY,
dep_name varchar(255) UNIQUE
);

create table Salary(
salary_id int PRIMARY KEY,
quantity decimal DEFAULT 35000, -- roughly calculated annual sal. on min. wage
pay_period varchar(255)
);

create table Position_(
pos_id int PRIMARY KEY,
dep_id int,
salary_id int, 
pos_hrs_vacation int,
pos_hrs_expected int,
pos_name varchar(255) DEFAULT "Intern",
FOREIGN KEY (dep_id) REFERENCES department(dep_id),
FOREIGN KEY (salary_id) REFERENCES salary(salary_id) 
);

create table Employee(
emp_id int PRIMARY KEY,
pos_id int,
bank_id int,
emp_accNum int,
emp_name varchar(255),
emp_email varchar(255),
emp_phone varchar(20),
FOREIGN KEY (pos_id) REFERENCES position_(pos_id),
FOREIGN KEY (bank_id) REFERENCES bank(bank_id)
);

create table Payslip(
pay_id int PRIMARY KEY,
emp_id int,
pay_date DATE,
gross_pay decimal,
net_pay decimal,
FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

create table Pay_Adjustments(
adjustment_id int PRIMARY KEY,
description varchar(255),
quantity decimal,
pay_id int,
FOREIGN KEY (pay_id) REFERENCES payslip(pay_id)
);

-- 30 Inserts Divided amongst every table -- 
-- BANK (3)
INSERT INTO Bank VALUES (1, 12345);
INSERT INTO Bank VALUES (2, 67890);
INSERT INTO Bank VALUES (3, 54321);

-- DEPARTMENT (3)
INSERT INTO Department VALUES (1, 'Engineering');
INSERT INTO Department VALUES (2, 'HR');
INSERT INTO Department VALUES (3, 'Finance');

-- SALARY (3)
INSERT INTO Salary VALUES (1, 50000, 'Annual');
INSERT INTO Salary VALUES (2, 60000, 'Annual');
INSERT INTO Salary VALUES (3, 40000, 'Annual');

-- POSITION_ (4)
INSERT INTO Position_ VALUES (1, 1, 1, 120, 2000, 'Engineer');
INSERT INTO Position_ VALUES (2, 2, 2, 100, 1950, 'HR Specialist');
INSERT INTO Position_ VALUES (3, 3, 3, 80, 1900, 'Accountant');
INSERT INTO Position_ VALUES (4, 1, 2, 150, 2100, 'Senior Engineer');

-- EMPLOYEE (5)
INSERT INTO Employee VALUES (1, 1, 1, 111111, 'Alice Smith', 'alice@company.com', '555-1111');
INSERT INTO Employee VALUES (2, 2, 2, 222222, 'Bob Johnson', 'bob@company.com', '555-2222');
INSERT INTO Employee VALUES (3, 3, 3, 333333, 'Charlie Lee', 'charlie@company.com', '555-3333');
INSERT INTO Employee VALUES (4, 4, 1, 444444, 'Diana Prince', 'diana@company.com', '555-4444');
INSERT INTO Employee VALUES (5, 1, 2, 555555, 'Ethan Hunt', 'ethan@company.com', '555-5555');

-- PAYSLIP (6)
INSERT INTO Payslip VALUES (1, 1, '2025-01-31', 4200, 3800);
INSERT INTO Payslip VALUES (2, 2, '2025-01-31', 5000, 4500);
INSERT INTO Payslip VALUES (3, 3, '2025-01-31', 3500, 3200);
INSERT INTO Payslip VALUES (4, 4, '2025-01-31', 6000, 5400);
INSERT INTO Payslip VALUES (5, 5, '2025-01-31', 4000, 3600);
INSERT INTO Payslip VALUES (6, 1, '2025-02-28', 4200, 3800);

-- PAY_ADJUSTMENTS (6)
INSERT INTO Pay_Adjustments VALUES (1, 'Bonus', 500, 1);
INSERT INTO Pay_Adjustments VALUES (2, 'Tax Deduction', -400, 2);
INSERT INTO Pay_Adjustments VALUES (3, 'Overtime', 300, 3);
INSERT INTO Pay_Adjustments VALUES (4, 'Health Insurance', -200, 4);
INSERT INTO Pay_Adjustments VALUES (5, 'Performance Bonus', 600, 5);
INSERT INTO Pay_Adjustments VALUES (6, 'Late Penalty', -100, 6);


-- Update queries (2) --
-- one update must use subqueries

-- Delete Queries (2) --
-- one delete must use subqueries

-- View Tables After Update and Delete -- 



