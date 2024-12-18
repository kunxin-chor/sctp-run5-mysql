-- SELECT allow us to select rows from a table
-- * -> means all columns
-- FROM <whatever table> => which table to get all the columns from
SELECT * FROM employees;

-- We can specify which columns to retrieve from the table
-- SELECT <col1>, <col2>, ....<coln> FROM <table>
SELECT firstName, lastName, email FROM employees;

-- column alias: rename a column
SELECT firstName AS "First Name", 
       lastName AS "Last Name", 
       email FROM employees;

-- WHERE allows us to shortlist certain rows
-- SELECT * FROM <table> WHERE <column_name matches critera>
SELECT * FROM employees WHERE officeCode=3;

-- find all the employees who reports to reportsTo
SELECT * FROM employees WHERE reportsTo = 1056;

-- find all the employees who reports to reportsTo
-- string matching in MySQL is case insensitive (this is to unique MySQL)
SELECT * FROM employees WHERE jobTitle = "sales rep";


-- find all the employees whose job title has the word "sales"
-- LIKE allow us to match by string patterns

-- Use LIKE without string matching symbols, its like a equal
SELECT * FROM employees WHERE jobTitle LIKE "sales rep";

-- Find all rows where the job titles includes the word "sales"
SELECT * FROM employees WHERE jobTitle LIKE "%sales%";

-- Find all the products that begin with 1969
SELECT * FROM products WHERE productName LIKE "1969%"

-- Find all the products that ends with the word "Falcon"
SELECT * FROM products WHERE productName LIKE "%Falcon";

-- Find all the products that has the word "Davidson" in the productName
SELECT productName, productLine, productVendor 
FROM products WHERE productName LIKE "%Davidson%"

-- SELECT BY MULTIPLE CRITERIA
-- the logical operator AND allows us to filter by multiple criteria
SELECT firstName, lastname, email, extension FROM employees WHERE jobTitle = "Sales Rep" AND officeCode = 1;

-- OR is as long as one of the criteria matches
-- find all the employees from officeCode 1 or officeCode 2
SELECT * FROM employees WHERE officeCode = 1 OR officeCode =2;

-- Find all the customers in USA with more than 10K credit limit
SELECT * FROM customers WHERE country="USA" AND creditLimit > 10000;

-- Find all the sales rep from office with office code 1 and office code 2
SELECT * FROM employees WHERE jobTitle = "Sales Rep" AND (officeCode = 2 OR officeCode = 1); 

-- JOINS
-- Find the first name, last name and city of all employees
SELECT firstName, lastName, city FROM employees JOIN offices
  ON employees.officeCode = offices.officeCode

-- If two or more columns share the same in the joined table
-- then we have to specific about which table to take the column from
SELECT offices.officeCode, firstName, lastName, city FROM employees  JOIN offices 
  ON employees.officeCode = offices.officeCode

  -- Get the full phone number of employees and their extension
  SELECT firstName, lastName, offices.phone, employees.extension FROM employees JOIN offices ON
	employees.officeCode = offices.officeCode

-- For each order, show the customer name, the contact's first name
-- the contact's name, the order number and order status
SELECT orderNumber, status, customerName, contactFirstName, contactLastName FROM customers JOIN orders
 ON customers.customerNumber = orders.customerNumber

 -- Like above, but also show the sales rep
 SELECT firstName, lastName, customerName, orderNumber FROM employees JOIN customers
 ON employees.employeeNumber = customers.salesRepEmployeeNumber
 JOIN orders
 ON customers.customerNumber = orders.customerNumber;

 -- Like above, but also show the country of the customer
 -- and country of the employee
 SELECT firstName, lastName, customerName, orderNumber, offices.country AS "Office Country", customers.country AS "Customer Country" FROM 
 offices JOIN employees
 ON offices.officeCode = employees.officeCode
 JOIN customers
 ON employees.employeeNumber = customers.salesRepEmployeeNumber
 JOIN orders
 ON customers.customerNumber = orders.customerNumber;


 -- When we do a normal join, it's implictly an INNER JOIN
-- Both rows in the LHS and RHS must have a match to be present
SELECT COUNT(*) FROM customers JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- When we do a LEFT JOIN, the lefthand side table  will have ALL its rows
-- in the resultant table, regardless if there's a matching row in the other table.
SELECT COUNT(*) FROM customers LEFT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- When we do a RIGHT JOIN, the righthand side table  will have ALL its rows
-- in the resultant table, regardless if there's a matching row in the other table.
SELECT * FROM customers RIGHT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- Find all the customers who are served by the officeCode 3

-- Get the current date on the server
SELECT curdate();

-- Get both date and time
SELECT now();

-- Get all payments after 30th Jun 2003
SELECT * FROM payments WHERE paymentDate > "2003-06-30";

-- Get all pamynets from 1st July to 31st July 2003
SELECT * FROM payments WHERE paymentDate > "2003-06-30" AND
 paymentDate <= "2003-07-31";

 -- DATEDIFF allows us to find the differences between two dates
 SELECT orderNumber, orderDate, requiredDate, DATEDIFF(requiredDate, orderDate ) AS "Days Late" FROM orders
WHERE DATEDIFF(requiredDate, orderDate) > 3

-- Alternatively:
SELECT orderNumber, orderDate, requiredDate,requiredDate - orderDate  AS "Days Late" FROM orders
WHERE requiredDate - orderDate > 3

-- Find all the orders that shipped in Nov 2003
select orderNumber, shippedDate from orders
WHERE YEAR(shippedDate)=2003 AND MONTH(shippedDate)=11;

-- SORTING
SELECT * FROM customers ORDER BY customerName; -- sort is ascending order
SELECT * FROM customers ORDER BY customerName DESC; -- sort by descending orde

-- LIMIT
SELECT * FROM customers ORDER BY customerName LIMIT 3; -- sort is ascending order

-- AGGRGEATE:
SELECT COUNT(*) FROM customers; -- show how many rows there
SELECT MAX(creditLimit) FROM customers; -- show the max credit limit there is
SELECT MIN(creditLimit) FROM customers WHERE creditLimit > 0; -- show minimal credit limit for customers with credit limit higher than 0
SELECT SUM(creditLimit) FROM customers WHERE creditLimit > 0; -- sum of all credit limit

-- SELECT DISTINCT will only return unique values
-- What are the different countries our customers are from
SELECT DISTINCT(country) FROM customers;

-- COUNT HOW MANY CUSTOMERS THERE ARE PER COUNTRY
-- Includes a aggregate
SELECT COUNT(*), country 
FROM customers
GROUP BY country;

-- Find average credit limit per country
SELECT AVG(creditLimit), country 
FROM customers
GROUP BY country;

-- find employees per office code
SELECT COUNT(*), officeCode FROM employees GROUP BY officeCode; 

-- How many orders there are PER customers.
-- 1. note: keywords: FOR each X, find Y,  Find x PER Y, given each X, find Y
-- 2. find what to group by - usually it's by certain identifying criteria
-- 3. What you group by, you also must select -- what you select by must also be in the group by
SELECT COUNT(*), customerNumber FROM orders
GROUP BY customerNumber;

-- Find average MSRP per product line
SELECT AVG(MSRP), productLine FROM products
GROUP BY productLine;

-- Find the number of sales rep per office
SELECT COUNT(*), officeCode FROM employees
WHERE jobTitle = "sales rep"
GROUP BY officeCode



-- show how many sales rep there per office
-- and only show offices with at least 3 sales rep
-- and also sort them by the number of sales rep with 
-- the office with the msot sales rep at the top
-- and show the top 3

-- String are in backtick are exclusively column names and table names
SELECT  officeCode, COUNT(*) AS `Sales Rep Count` FROM employees
WHERE jobTitle = "sales rep"
GROUP BY officeCode
HAVING `Sales Rep Count` > 1
ORDER BY `Sales Rep Count` DESC
LIMIT 3;

-- The FULL SQL EXPERIENCE
SELECT employeeNumber, firstName, lastName, AVG(creditLimit) 
FROM employees JOIN customers
 ON employees.employeeNumber = customers.salesRepEmployeeNumber
 WHERE country = "USA"
 GROUP BY employeeNumber, firstName, lastName
 HAVING AVG(creditLimt) > 50000
 ORDER BY AVG(creditLimit) DESC
 LIMIT 5;