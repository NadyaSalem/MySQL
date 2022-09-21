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
