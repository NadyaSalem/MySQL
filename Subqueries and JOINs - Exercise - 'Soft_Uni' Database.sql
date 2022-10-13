-- 1. Employee Address

SELECT e.`employee_id`, e.`job_title`, e.`address_id`, a.`address_text`
FROM `employees` AS e 
JOIN `addresses` AS a 
ON e.`address_id` = a.`address_id`
ORDER BY e.`address_id`
LIMIT 5;


-- 2. Addresses with Towns

SELECT e.`first_name`, e.`last_name`, t.`name` AS `town`, a.`address_text`
FROM `employees` AS e 
JOIN `addresses` AS a 
ON e.`address_id` = a.`address_id`
JOIN `towns` AS t
ON t.`town_id` = a.`town_id`
ORDER BY `first_name`, e.`last_name`
LIMIT 5;


-- 3. Sales Employee

SELECT e.`employee_id`, e.`first_name`, e.`last_name`, d.`name` AS `department_name`
FROM `employees` AS e 
JOIN `departments` AS d
ON  e.`department_id` =  d.`department_id`
WHERE d.`name` = 'Sales'
ORDER BY e.`employee_id` DESC;


-- 4. Employee Departments

SELECT e.`employee_id`, e.`first_name`, e.`salary`, d.`name` AS `department_name`
FROM `employees` AS e 
JOIN `departments` AS d
ON  e.`department_id` =  d.`department_id`
WHERE e.`salary` > 15000
ORDER BY e.`department_id` DESC
LIMIT 5;


-- 5. Employees Without Project

SELECT e.`employee_id`, e.`first_name` 
FROM `employees` AS e 
LEFT JOIN `employees_projects` AS e_p 
ON e.`employee_id` = e_p.`employee_id`
WHERE  e_p.`project_id` IS NULL
ORDER BY e.`employee_id` DESC
LIMIT 3;


-- 6. Employees Hired After

SELECT  e.`first_name`, e.`last_name`, e.`hire_date`, d.`name` AS `department_name`
FROM `employees` AS e 
JOIN `departments` AS d
ON  e.`department_id` =  d.`department_id`
WHERE e.`hire_date` > '1999-01-01 00:00:00.000000' AND  d.`name` = 'Sales' OR  d.`name` = 'Finance'
ORDER BY e.`hire_date`;


-- 7. Employees with Project

SELECT e.`employee_id`, e.`first_name`, p.`name` AS project_name
FROM `employees` AS e 
JOIN `employees_projects` AS e_p 
ON e.`employee_id` = e_p.`employee_id`
JOIN `projects` AS p
ON p.`project_id` =  e_p.`project_id`
WHERE DATE(p.`start_date`) > '2002-08-13' AND `end_date` IS NULL
ORDER BY e.`first_name`, `project_name`
LIMIT 5;


-- 8. Employee 24

SELECT e.`employee_id`, e.`first_name`, IF(YEAR(p.`start_date`) >= 2005, NULL, p.`name`) AS project_name
FROM `employees` AS e 
JOIN `employees_projects` AS e_p 
ON e.`employee_id` = e_p.`employee_id`
JOIN `projects` AS p
ON p.`project_id` =  e_p.`project_id`
WHERE e.`employee_id` = 24
ORDER BY p.`name`;


-- 9. Employee Manager

SELECT e.`employee_id`, e.`first_name`, e.`manager_id`, (SELECT e2.`first_name` FROM `employees` AS e2
WHERE  e.`manager_id` = e2.`employee_id`) AS 'manager_name'
FROM `employees` AS e 
WHERE e.`manager_id` IN(3, 7)
ORDER BY e.`first_name`;


-- 10. Employee Summary

SELECT 
e.`employee_id`, 
CONCAT(e.`first_name`, ' ', e.`last_name`) AS employee_name,
(SELECT CONCAT(e2.`first_name`, ' ', e2.`last_name`) FROM `employees` AS e2 WHERE  e.`manager_id` = e2.`employee_id`) AS 'manager_name', 
d.`name` AS `department_name`
FROM `employees` AS e 
JOIN `departments` AS d
ON  e.`department_id` =  d.`department_id`
WHERE e.`manager_id` IS NOT NULL
ORDER BY e.`employee_id`
LIMIT 5;


-- 11. Min Average Salary

SELECT AVG(`salary`) AS min_average_salary FROM `employees`
GROUP BY `department_id`
ORDER BY min_average_salary
LIMIT 1;
