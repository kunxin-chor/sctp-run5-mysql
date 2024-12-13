create database employees;

use employees;

CREATE TABLE taskforces(
   taskforces_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(45) NOT NULL
) engine = innodb;

CREATE TABLE departments(
   dept_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   dept_name VARCHAR(100) NOT NULL
) engine = innodb;

CREATE TABLE Contacts(
   contact_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   countryCode VARCHAR(3) NOT NULL,
   areaCode VARCHAR(3) NOT NULL,
   number VARCHAR(8)
) engine = innodb;


CREATE TABLE employees(
   emp_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   first_name VARCHAR(45) NOT NULL,
   last_name VARCHAR(45) NOT NULL,
    email VARCHAR(320) NOT NULL,
gender VARCHAR(1) NOT NULL,
   emp_date Date,
   designation VARCHAR(100),
   notes text
) engine = innodb;

CREATE TABLE address(
   add_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   buidling VARCHAR(255) NOT NULL,
   street VARCHAR(255) NOT NULL,
    unit VARCHAR(10) NOT NULL,
postalCode VARCHAR(10) NOT NULL,
) engine = innodb;

CREATE TABLE TaskforceMembership(
taskforcemem_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
) engine = innodb;

ALTER TABLE TaskforceMembership ADD COLUMN emp_id int UNSIGNED;
ALTER TABLE Contacts ADD COLUMN emp_id int UNSIGNED;
ALTER TABLE address ADD COLUMN emp_id int UNSIGNED;
ALTER TABLE employees ADD COLUMN dept_id int UNSIGNED;

ALTER TABLE TaskforceMembership ADD CONSTRAINT fk_employees_taskforce FOREIGN KEY(emp_id) REFERENCES employees(emp_id);

ALTER TABLE Contacts ADD CONSTRAINT fk_employees_contacts FOREIGN KEY(emp_id) REFERENCES employees(emp_id);
ALTER TABLE address ADD CONSTRAINT fk_employees_address FOREIGN KEY(emp_id) REFERENCES employees(emp_id);
ALTER TABLE employees ADD CONSTRAINT fk_departments_employees FOREIGN KEY(dept_id) REFERENCES departments(dept_id);


