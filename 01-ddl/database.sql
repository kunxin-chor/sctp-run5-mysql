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