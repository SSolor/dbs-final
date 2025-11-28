-- create the database
using group14_finalassgmt;

--ifdrop for convenience


-- create tables 
create table Bank(
bank_id int PRIMARY KEY,
institutionNum int NOT NULL
);

create table Department(
dept_id int PRIMARY KEY,
dep_name varchar(255) UNIQUE
);

create table Salary(
salary_id int DEFAULT 35000, -- roughly calculated annual sal. on min. wage
quantity decimal,
pay_period varchar(255)
);

create table Position(
pos_id int PRIMARY KEY,
dep_id int,
salary_id int,
pos_hrs_vacation int,
pos_hrs_expected int,
FOREIGN KEY dep_id REFERENCES department(dep_id),
FOREIGN KEY salary_id REFERENCES salary(salary_id) 
);

create table Employee(
emp_id int PRIMARY KEY,
pos_id int,
bank_id int,
emp_accNum int,
emp_name varchar(255),
emp_email varchar(255),
emp_phone varchar(20),
FOREIGN KEY pos_id REFERENCES position(pos_id),
FOREIGN KEY bank_id REFERENCES bank(bank_id)
);

create table Payslip(
pay_id int PRIMARY KEY,
emp_id int,
pay_date DATE,
gross_pay decimal,
net_pay decimal,
FOREIGN KEY emp_id REFERENCES employee(emp_id)
);

Pay_Adjustments(
adjustment_id int PRIMARY KEY,
description varchar(255),
quantity decimal,
pay_id int,
FOREIGN KEY pay_id REFERENCES payslip(pay_id)
);
