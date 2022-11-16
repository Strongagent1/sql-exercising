-- joins: select all the computers from the products table:
SELECT * FROM products 
WHERE CATEGORYID = 1;
-- using the products table and the categoriestable, return the product name and the category name
 SELECT
	products.NAME, 
    categories.NAME
FROM PRODUCTS
JOIN CATEGORIES
ON PRODUCT.CATEGORYID = CATEGORY.CATEGORYID;
-- joins: find all product names, product prices, and products ratings that have a rating of 5 
 SELECT
	products.NAME,
    products.PRICE,
    reviews.RATING
FROM products
JOIN reviews
ON ProductS.PRODUCTID = REVIEWS.ProductID
WHERE reviews.RATING = 5; 
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by 
SELECT 
	SALES.EmployeeID,
    SUM(SALES.QUANTITY)
FROM SALES
GROUP BY EMPLOYEEID
ORDER BY SUM(SALES.QUANTITY) DESC
LIMIT 1;  
-- joins: find the name of the department, and the name of the category for Appliances and Games 
SELECT * FROM categories
WHERE NAME 
LIKE 'appliances' OR NAME LIKE 'games';
-- joins: find the product name, total # sold, and total price sold,
 -- for Eagles: Hotel California --You may need to use SUM() 
SELECT 
	products.NAME,
    SUM(SALES.QUANTITY),
    SUM(SALES.PRICEPERUNIT)
FROM PRODUCTS
JOIN SALES
ON PRODUCTS.PRODUCTID = SALES.PRODUCTID
WHERE products.NAME LIKE 'Eagles: Hotel California';    
-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) 
SELECT
	products.NAME,
    REVIEWS.REVIEWER,
    REVIEWS.RATING,
    reviews.Comment
FROM products
JOIN REVIEWS 
ON products.ProductID = reviews.ProductID
WHERE products.NAME LIKE 'VISIO TV'
AND RATING = 1;

-- ------------------------------------------ Extra - May be difficult
-- Your goal is to write a query that serves as an employee sales report.
-- This query should return:
--  the employeeID
--  the employee's first and last name
--  the name of each product
--  and how many of that product they sold 
SELECT
	employees.EmployeeID,
    employees.FirstName,
    employees.LastName,
    products.NAME,
    sales.Quantity
FROM EMPLOYEES
JOIN SALES ON employees.EMPLOYEEID = sales.EmployeeID
JOIN products ON sales.ProductID = products.ProductID
ORDER BY employees.EmployeeID;
