-- Part I – Queries for SoftUni Database --

-- 1. Find Names of All Employees by First Name

SELECT `first_name`, `last_name` FROM `employees` 
WHERE `first_name` LIKE ('Sa%')
ORDER BY `employee_id`;


-- 2. Find Names of All Employees by Last Name

SELECT `first_name`, `last_name` FROM `employees` 
WHERE `last_name` LIKE ('%ei%')
ORDER BY `employee_id`;


-- 3. Find First Names of All Employees

SELECT `first_name` FROM `employees` 
WHERE `department_id` IN (3, 10) AND
YEAR (`hire_date`) BETWEEN 1995 AND 2005
ORDER BY `employee_id`;


-- 4.	Find All Employees Except Engineers

SELECT `first_name`, `last_name` FROM `employees` 
WHERE `job_title` NOT LIKE('%engineer%')
ORDER BY `employee_id`;


-- 5. Find Towns with Name Length

SELECT `name` FROM `towns`
WHERE CHAR_LENGTH(`name`) IN (5, 6)
ORDER BY `name`;


-- 6.  Find Towns Starting With

SELECT * FROM `towns`
WHERE `name` LIKE 'M%' OR `name` LIKE 'K%' OR `name` LIKE 'B%' OR `name` LIKE 'E%'
ORDER BY `name`;


-- 7. Find Towns Not Starting With

SELECT * FROM `towns`
WHERE `name` NOT LIKE 'R%' AND `name` NOT LIKE 'B%' AND `name`  NOT LIKE 'D%'
ORDER BY `name`;


-- 8. Create View Employees Hired After 2000 Year

CREATE VIEW `v_employees_hired_after_2000` AS
SELECT `first_name`, `last_name` FROM `employees` 
WHERE YEAR(`hire_date`) > 2000;

SELECT * FROM `v_employees_hired_after_2000`;


-- 9. Length of Last Name

SELECT `first_name`, `last_name` FROM `employees`
WHERE  char_length(`last_name`) = 5;


-- Part II – Queries for Geography Database --

-- 10. Countries Holding 'A' 3 or More Times

SELECT `country_name`, `iso_code` FROM `countries`
WHERE `country_name` LIKE '%a%a%a%'
ORDER BY `iso_code`;


-- 11. Mix of Peak and River Names

SELECT `peak_name`, `river_name`, concat(LOWER(`peak_name`), LOWER(SUBSTRING(`river_name`, 2)))  AS `mix` 
FROM `peaks`, `rivers`
WHERE RIGHT(`peak_name`, 1) = LEFT(`river_name`, 1)
ORDER BY `mix`;


