CREATE DATABASE `gamebar`;

USE `gamebar`;

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL
);

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `products` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `category_id` INT
);


INSERT INTO `employees` (`first_name`, `last_name`)
VALUES('Test1', 'Test1'), ('Test2', 'Test2'), ('Test3', 'Test3');


ALTER TABLE `employees` 
ADD COLUMN `middle_name` VARCHAR(50) NOT NULL;


ALTER TABLE `products`
ADD FOREIGN KEY (`category_id`)
REFERENCES `categories`(`id`);
  
  
ALTER TABLE `employees`
CHANGE COLUMN `middle_name` `middle_name` VARCHAR(100) NOT NULL;
