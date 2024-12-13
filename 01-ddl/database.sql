-- create a new database on a MySQL server
create database swimming_coach;

-- Show all databases on the server
show databases;

-- change the current active database
use swimming_coach;

/*
 create table <name of table> (
  <col name> <data type> <options>,
  <col 2 name> <data type> <options>,
  .....
 ) engine = innodb;

Column names, table names are case sensitive
The SQL commands are not

*/
CREATE TABLE parents (
 parent_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(45) NOT NULL,
 last_name VARCHAR(45) DEFAULT '' -- if no value is given for last_name, default to an empty string
) engine = innodb;

-- Verify that the table is created correct
show tables;

CREATE TABLE locations (
    location_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    address VARCHAR(255)
) engine = innodb;

-- DESCRIBE allows us to see the columns and their data type of a table
DESCRIBE parents;

-- Create the students table WITHOUT th foreign key
CREATE TABLE students (
    student_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    swimming_level VARCHAR(45),
    dob DATE
) engine = innodb;

-- To update an existing table
-- we use ALTER TABLE
ALTER TABLE students ADD COLUMN parent_id INT UNSIGNED;

-- a foreign key is one possible constraints you can add
-- to a column
-- ALTER TABLE <table name> ADD CONSTRAINT <name of constraint>
ALTER TABLE students ADD CONSTRAINT fk_parents_students
  FOREIGN KEY(parent_id) REFERENCES parents(parent_id);

-- Delete a column from a table
ALTER TABLE students DROP COLUMN swimming_level;

-- Add the column back
ALTER TABLE students ADD COLUMN swimming_level varchar(45);

-- Modify an existing column
-- Make it such that the swimming_level is an TINYINT UNSIGNED
ALTER TABLE students MODIFY COLUMN swimming_level TINYINT UNSIGNED;

-- Remove a table
CREATE TABLE test (
    test_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(1000)
) engine = innodb;

DROP TABLE test;