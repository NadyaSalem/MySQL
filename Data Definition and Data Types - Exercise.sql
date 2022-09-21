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
