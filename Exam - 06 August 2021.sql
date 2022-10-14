-- Section 1: Data Definition Language (DDL) – 40 pts --

 -- 1.	Table Design

CREATE DATABASE `sgd`;

CREATE TABLE `addresses`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(10) NOT NULL
);

CREATE TABLE `offices`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`workspace_capacity` INT NOT NULL,
`website` VARCHAR(50),
`address_id` INT NOT NULL,
CONSTRAINT `fk_offices_adresse`
FOREIGN KEY (`address_id`)
REFERENCES `addresses`(`id`)
);

CREATE TABLE `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(30) NOT NULL,
`last_name` VARCHAR(30) NOT NULL,
`age` INT NOT NULL,
`salary` DECIMAL(10,2) NOT NULL,
`job_title` VARCHAR(20) NOT NULL,
`happiness_level` CHAR(1) NOT NULL
);

CREATE TABLE `teams`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
`office_id` INT NOT NULL,
`leader_id` INT UNIQUE NOT NULL,
CONSTRAINT `fk_teams_offices`
FOREIGN KEY (`office_id`)
REFERENCES `offices`(`id`),
CONSTRAINT `fk_teams_employees`
FOREIGN KEY (`leader_id`)
REFERENCES `employees`(`id`)
);

CREATE TABLE `games`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) UNIQUE NOT NULL,
`description` TEXT,
`rating` FLOAT NOT NULL,
`budget` DECIMAL(10,2) NOT NULL,
`release_date` DATE,
`team_id` INT NOT NULL,
CONSTRAINT `fk_games_teams`
FOREIGN KEY (`team_id`)
REFERENCES `teams`(`id`)
);


CREATE TABLE `games_categories`(
`game_id` INT NOT NULL,
`category_id` INT NOT NULL,
 CONSTRAINT `pk_games_categories`
 PRIMARY KEY (`game_id`, `category_id`),
 CONSTRAINT `fk_games_categories_to_games`
 FOREIGN KEY (`game_id`)
 REFERENCES `games`(`id`),
 CONSTRAINT `fk_games_categories_to_categories`
 FOREIGN KEY (`category_id` )
 REFERENCES `categories`(`id`)
);



-- Section 2: Data Manipulation Language (DML) – 30 pts --

-- 2.	Insert

INSERT INTO `games` (`name`, `rating`, `budget`, `team_id`)
SELECT LOWER(REVERSE(SUBSTR(`name`, 2))), `id`, `leader_id` * 1000, `id` FROM `teams` AS t
WHERE t.`id` BETWEEN 1 AND 9;


-- 3.	Update

UPDATE `employees` AS e
SET `salary` = `salary` + 1000
WHERE `id` IN (SELECT `leader_id` FROM `teams`) AND e.`age` < 40 AND e.`salary` <= 5000;
 
 
 -- 4.	Delete
 
DELETE FROM `games`
WHERE `id` NOT IN (SELECT `game_id` FROM `games_categories`) AND release_date IS NULL;
