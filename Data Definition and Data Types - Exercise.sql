-- 1. Create Tables


USE `minions`;

CREATE TABLE `minions` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `age` INT NOT NULL
);

CREATE TABLE `towns` (
`town_id` INT PRIMARY KEY AUTO_INCREMENT,
 `name` VARCHAR(255) NOT NULL
 );
 
 
 -- 2. Alter Minions Table
 
 
SELECT * FROM minions.minions;

ALTER TABLE `minions`

ADD COLUMN `town_id` INT NOT NULL,
ADD CONSTRAINT fk_minions_town_id
FOREIGN KEY (`town_id`)
REFERENCES `towns` (`id`);


 -- 3. Insert Records in Both Tables
 
 USE `minions`;

INSERT INTO `towns` (`id`, `name`)
VAlUES (1, 'Sofia'), (2, 'Plovdiv'), (3, 'Varna');

INSERT INTO `minions` (`id`, `name`, `age`, `town_id`)
VALUE (1, 'Kevin', 22,	1), (2,	'Bob', 15, 3), (3, 'Steward', NULL, 2);


 -- 4. Truncate Table Minions
 
SELECT * FROM minions.minions;

TRUNCATE TABLE `minions`;

 -- 5. Drop All Tables
 
USE `minions`;
 
DROP TABLE `minions` ;
DROP TABLE `towns`; 


 -- 6. Create Table People

CREATE TABLE `people` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` DECIMAL(10 , 2),
    `weight` DECIMAL(10 , 2),
    `gender` ENUM('m', 'f') NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

INSERT INTO `people` (`name`, `gender`, `birthdate`)
VALUES ('Nadya', 'f', DATE (now())),
('Lina', 'f', DATE (now())),
('Lora', 'f', DATE (now())),
('Polina', 'f', DATE (now())),
('Valentin', 'm', DATE (now()));


 -- 7. Create Table Users
 
 CREATE TABLE `users` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` TIME,
    `is_deleted` BOOLEAN
);

INSERT INTO `users` (`username`, `password`)
VALUES ('Nadya', '1234'),
('Lina', '5678'),
('Lora', '5689'),
('Polina', '5369'),
('Valentin', 'sonic');


 --8. Change Primary Key
 
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD PRIMARY KEY `pk_users` (`id`, `username`);


 -- 9. Set Default Value of a Field
 
ALTER TABLE `users`
MODIFY COLUMN `last_login_time` DATETIME DEFAULT NOW();


 -- 10. Set Unique Field
 
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT `pk_users`
PRIMARY KEY `users`(`id`),
MODIFY COLUMN  `username` VARCHAR(30) NOT NULL UNIQUE;


 -- 11. Movies Database
 
CREATE DATABASE `Movies`;

USE `Movies`;

CREATE TABLE `directors` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(100) NOT NULL,
    `notes` TEXT
);

INSERT INTO  `directors` (`director_name`)
VALUES ('name1'), ('name2'), ('name3'), ('name4'), ('name5');

CREATE TABLE `genres` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(100) NOT NULL,
    `notes` TEXT
);

INSERT INTO  `genres` (`genre_name`)
VALUES ('genres1'), ('genres2'), ('genres3'), ('genres4'), ('genres5');

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(100) NOT NULL,
    `notes` TEXT
);

INSERT INTO  `categories` (`category_name`)
VALUES ('category1'), ('category2'), ('category3'), ('category4'), ('category5');

CREATE TABLE `movies` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `director_id` INT,
    `copyright_year` INT,
    `length` INT,
    `genre_id` INT,
    `category_id` INT,
    `rating` DOUBLE,
    `notes` TEXT
);

INSERT INTO  `movies` (`title`)
VALUES ('title1'), ('title2'), ('title3'), ('title4'), ('title5');


 -- 12. Car Rental Database

CREATE DATABASE `car_rental`;

USE `car_rental`;

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(30) NOT NULL,
    daily_rate DOUBLE,
    weekly_rate DOUBLE,
    monthly_rate DOUBLE,
    weekend_rate DOUBLE
);

INSERT INTO `categories` (`category`)
VALUES ('category1'), ('category2'), ('category3');

CREATE TABLE `cars` (
 `id` INT PRIMARY KEY AUTO_INCREMENT,
 `plate_number` VARCHAR (20),
 `make` VARCHAR (20),
 `model` VARCHAR (30),
 `car_year` INT,
 `category_id` INT,
 `doors` INT,
 `picture` BLOB,
 `car_condition` VARCHAR (50),
 `available` BOOLEAN
 );
 
INSERT INTO `cars` (`model`)
VALUES ('model1'), ('model2'), ('model3');

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(30),
    `last_name` VARCHAR(30),
    `title` VARCHAR(50),
    `notes` TEXT
);

INSERT INTO  `employees` (`first_name`)
VALUES ('Nadya'), ('Lora'), ('Lina');

CREATE TABLE `customers` (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`driver_licence_number` VARCHAR(30),
 `full_name`VARCHAR(50),
 `address` VARCHAR(70),
 `city` VARCHAR(20),
 `zip_code` VARCHAR(20),
 `notes` TEXT
 );
 
 INSERT INTO  `customers` (`city`)
 VALUES ('Kavarna'), ('Varna'), ('Shumen');

CREATE TABLE `rental_orders` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
    `employee_id` INT,
    `customer_id` INT,
    `car_id` INT,
    `car_condition` VARCHAR(70),
    `tank_level` VARCHAR(30),
    `kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATE, 
    `end_date` DATE, 
    `total_days` INT,
    `rate_applied` DOUBLE,
    `tax_rate` DOUBLE,
    `order_status` VARCHAR(40),
    `notes` TEXT
 );

 INSERT INTO  `rental_orders` (`employee_id`)
 VALUES (001), ('002'), ('003');


 -- 13. Basic Insert
 
 CREATE DATABASE `soft_uni`;

USE `soft_uni`;

CREATE TABLE `towns` (
`id` INT PRIMARY KEY AUTO_INCREMENT, 
`name` VARCHAR (20)
);

CREATE TABLE `addresses` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `address_text` VARCHAR(70),
    `town_id` INT,
    FOREIGN KEY (`town_id`)
    REFERENCES `towns` (`id`)
);
 
 CREATE TABLE `departments` (
`id` INT PRIMARY KEY AUTO_INCREMENT, 
`name` VARCHAR (50)
);

CREATE TABLE `employees` (
`id`INT PRIMARY KEY AUTO_INCREMENT,
`first_name`VARCHAR (50) NOT NULL,
`middle_name`VARCHAR (50),
`last_name`VARCHAR (50) NOT NULL,
`job_title`VARCHAR (50) NOT NULL,
`department_id` INT,
`hire_date` DATE,
`salary` DECIMAL (7,3),
`address_id` INT,
FOREIGN KEY (`department_id`)
REFERENCES `departments` (`id`),
FOREIGN KEY (`address_id`)
REFERENCES `addresses` (`id`)
);

INSERT INTO `towns`(`name`)
VALUES
    ('Sofia'), 
    ('Plovdiv'), 
    ('Varna'), 
    ('Burgas');
    
INSERT INTO `departments`(`name`)
VALUES
	('Engineering'), 
        ('Sales'), 
        ('Marketing'),
        ('Software Development'),
        ('Quality Assurance'); 

INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES
	('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),        
	('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),        
	('Maria', 'Petrova', 'Ivanova',	'Intern', 5, '2016-08-28', 525.25),        
	('Georgi', 'Terziev', 'Ivanov',	'CEO', 2, '2007-12-09',	3000.00),        
	('Peter', 'Pan', 'Pan',	'Intern', 3, '2016-08-28', 599.88);
        
	
   -- 14. Basic Select All Fields
   
SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

  -- 15. Basic Select All Fields and Order Them
  
  SELECT * FROM `towns`
ORDER BY `name`;

SELECT * FROM `departments`
ORDER BY `name`;

SELECT * FROM `employees`
ORDER BY `salary` DESC;



