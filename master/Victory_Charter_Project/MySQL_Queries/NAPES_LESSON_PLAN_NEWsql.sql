-- MySQL Script generated by MySQL Workbench
-- Fri Nov 18 03:51:10 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema NAPES_Lesson_Plans
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema NAPES_Lesson_Plans
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NAPES_Lesson_Plans` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema NAPES_LP
-- -----------------------------------------------------
USE `NAPES_Lesson_Plans` ;

-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans_New`.`Director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Director` (
  `Director_ID` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(25) NULL,
  `Middle_name` VARCHAR(1) NULL,
  `Last_Name` VARCHAR(25) NULL,
  `Phone_No` VARCHAR(12) NULL,
  `Email` VARCHAR(45) NULL,
  `Teacher_ID` INT NULL,
  `Insert_Date` DATETIME NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` DATETIME NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Director_ID`),
  UNIQUE INDEX `Director_ID_UNIQUE` (`Director_ID` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`School`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`School` (
  `School_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `PhoneNo` VARCHAR(10) NULL,
  `Email` VARCHAR(45) NULL,
  `Address1` VARCHAR(50) NULL,
  `Address2` VARCHAR(10) NULL,
  `City` VARCHAR(25) NULL,
  `State` VARCHAR(2) NULL,
  `ZipCode` VARCHAR(10) NULL,
  `Director_ID` INT NULL,
  `Insert_Date` DATETIME NULL DEFAULT Current_Timestamp,
  `inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` DATETIME NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`School_ID`),
  INDEX `Director_ID_idx` (`Director_ID` ASC) VISIBLE,
  UNIQUE INDEX `School_ID_UNIQUE` (`School_ID` ASC) VISIBLE,
  CONSTRAINT `Director_ID`
    FOREIGN KEY (`Director_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Director` (`Director_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Login` (
  `Login_ID` INT NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(10) NULL,
  `Password` VARCHAR(15) NULL,
  `Permission` VARCHAR(25) NULL,
  `User_Status` BIT(1) NULL,
  `Email` VARCHAR(45) NULL,
  `Insert_Date` DATETIME NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` DATETIME NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `User_ID` VARCHAR(10) NULL COMMENT 'User ID to log',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Login_ID`),
  UNIQUE INDEX `Director_ID_UNIQUE` (`Login_ID` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Teacher` (
  `Teacher_ID` INT NOT NULL AUTO_INCREMENT,
  `Login_ID` INT NULL COMMENT 'User ID to log',
  `First_Name` VARCHAR(25) NULL,
  `Middle_name` VARCHAR(1) NULL,
  `Last_Name` VARCHAR(25) NULL,
  `Phone_No` VARCHAR(12) NULL,
  `Email` VARCHAR(45) NULL,
  `Teacher_Status` BIT(1) NULL COMMENT 'Active(Y/N)',
  `Director_ID` INT NULL,
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Teacher_ID`),
  INDEX `Login_ID_idx` (`Login_ID` ASC) VISIBLE,
  INDEX `Director_ID_idx` (`Director_ID` ASC) VISIBLE,
  CONSTRAINT `Login_ID`
    FOREIGN KEY (`Login_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Login` (`Login_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Director_ID2`
    FOREIGN KEY (`Director_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Director` (`Director_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Class` (
  `Class_ID` INT NOT NULL AUTO_INCREMENT,
  `Class_Name` INT NULL,
  `Class_Description` VARCHAR(10) NULL,
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NOT NULL COMMENT 'Y-N',
  PRIMARY KEY (`Class_ID`),
  UNIQUE INDEX `TS_ID_UNIQUE` (`Class_ID` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Grades` (
  `Grade_ID` INT NOT NULL AUTO_INCREMENT,
  `Grade_No` INT NULL,
  `Grade_Name` VARCHAR(10) NULL,
  `Class_ID` INT NULL,
  `Classroom_No` VARCHAR(3) NULL,
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Grade_ID`),
  UNIQUE INDEX `TS_ID_UNIQUE` (`Grade_ID` ASC) VISIBLE,
  INDEX `Class_ID_idx` (`Class_ID` ASC) VISIBLE,
  CONSTRAINT `Class_ID`
    FOREIGN KEY (`Class_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Class` (`Class_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Accomodations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Accomodations` (
  `Accomodation_ID` INT NOT NULL AUTO_INCREMENT,
  `Accomodation_Type` INT NULL,
  `Accomodation_Description` INT NULL,
  `Student_ID` INT NULL,
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Accomodation_ID`),
  UNIQUE INDEX `Lesson_Plan_ID_UNIQUE` (`Accomodation_ID` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Student` (
  `Student_ID` INT NOT NULL AUTO_INCREMENT,
  `Login_ID` INT NULL,
  `First_Name` VARCHAR(25) NULL,
  `Middle_name` VARCHAR(1) NULL,
  `Last_Name` VARCHAR(25) NULL,
  `Phone_No` VARCHAR(12) NULL,
  `Email` VARCHAR(45) NULL,
  `Parent_ID` INT NULL,
  `Grade_ID` INT NULL,
  `Student_Status` BIT(1) NULL COMMENT 'Active(Y/N)',
  `Accomodation_ID` INT NULL,
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Student_ID`),
  UNIQUE INDEX `Director_ID_UNIQUE` (`Student_ID` ASC) VISIBLE,
  INDEX `Grade_ID_idx` (`Grade_ID` ASC) VISIBLE,
  INDEX `Accomodation_ID_idx` (`Accomodation_ID` ASC) VISIBLE,
  INDEX `LogIn_ID_idx` (`Login_ID` ASC) VISIBLE,
  CONSTRAINT `Grade_ID`
    FOREIGN KEY (`Grade_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Grades` (`Grade_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Accomodation_ID`
    FOREIGN KEY (`Accomodation_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Accomodations` (`Accomodation_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `LogIn_ID3`
    FOREIGN KEY (`Login_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Login` (`Login_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Car` (
  `Car_ID` INT NOT NULL AUTO_INCREMENT,
  `Make` INT NULL,
  `Model` VARCHAR(10) NULL,
  `Year` YEAR(4) NULL,
  `Color` VARCHAR(10) NULL,
  `License_Plate` VARCHAR(6) NULL,
  `Ticket_No` VARCHAR(10) NULL,
  `Car_Status` BIT(1) NULL COMMENT 'Active(Y/N)',
  `Inserted_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Car_ID`),
  UNIQUE INDEX `TS_ID_UNIQUE` (`Car_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Parents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Parents` (
  `Parent_ID` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(25) NULL,
  `Middle_name` VARCHAR(1) NULL,
  `Last_Name` VARCHAR(25) NULL,
  `Phone_No` VARCHAR(12) NULL,
  `Email` VARCHAR(45) NULL,
  `Address1` VARCHAR(25) NULL,
  `Address2` VARCHAR(10) NULL,
  `City` VARCHAR(25) NULL,
  `ZipCode` VARCHAR(10) NULL,
  `Car_ID` INT NULL,
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Parent_ID`),
  UNIQUE INDEX `Director_ID_UNIQUE` (`Parent_ID` ASC) VISIBLE,
  INDEX `Car_ID_idx` (`Car_ID` ASC) VISIBLE,
  CONSTRAINT `Car_ID`
    FOREIGN KEY (`Car_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Car` (`Car_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Teacher_Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Teacher_Student` (
  `TS_ID` INT NOT NULL AUTO_INCREMENT,
  `Teacher_ID` INT NULL,
  `Student_ID` INT NULL,
  `Class_ID` INT NULL,
  `Class_Name` VARCHAR(45) NULL,
  `Grade_ID` INT NULL,
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`TS_ID`),
  UNIQUE INDEX `TS_ID_UNIQUE` (`TS_ID` ASC) VISIBLE,
  INDEX `Student_ID_idx` (`Student_ID` ASC) VISIBLE,
  INDEX `Teacher_ID_idx` (`Teacher_ID` ASC) VISIBLE,
  INDEX `Grade_ID_idx` (`Grade_ID` ASC) VISIBLE,
  CONSTRAINT `Student_ID`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Student` (`Student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Teacher_ID`
    FOREIGN KEY (`Teacher_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Teacher` (`Teacher_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Grade_ID2`
    FOREIGN KEY (`Grade_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Grades` (`Grade_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Module` (
  `Module_ID` INT NOT NULL AUTO_INCREMENT,
  `Module` VARCHAR(45) NULL,
  `Module_Desc` VARCHAR(45) NULL,
  `Unit-Topics` VARCHAR(1) NULL,
  `Unit_Topic_Desc` VARCHAR(10) NULL,
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Module_ID`),
  UNIQUE INDEX `Module_D_UNIQUE` (`Module_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Week`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Week` (
  `Week_ID` INT NOT NULL AUTO_INCREMENT,
  `Week_No` VARCHAR(10) NULL,
  `Start_Date` DATE NULL,
  `End_Date` DATE NULL,
  `Date_Name` VARCHAR(8) NULL,
  `MonthName` VARCHAR(10) NULL,
  `Year` YEAR(4) NULL,
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Week_ID`),
  UNIQUE INDEX `Week_ID_UNIQUE` (`Week_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Lesson_Plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Lesson_Plan` (
  `Lesson_Plan_ID` INT NOT NULL AUTO_INCREMENT,
  `Class_ID` INT NULL,
  `Standard_Type` VARCHAR(25) NULL,
  `Standard` TEXT(250) NULL,
  `Lesson_ID` INT NULL,
  `Module_ID` INT NULL,
  `Week_ID` INT NULL,
  `Active` VARCHAR(1) NOT NULL,
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`Lesson_Plan_ID`),
  UNIQUE INDEX `Lesson_Plan_ID_UNIQUE` (`Lesson_Plan_ID` ASC) VISIBLE,
  INDEX `Class_ID_idx` (`Class_ID` ASC) VISIBLE,
  INDEX `MOdule_ID_idx` (`Module_ID` ASC) VISIBLE,
  INDEX `Week_ID_idx` (`Week_ID` ASC) VISIBLE,
  CONSTRAINT `Class_ID1`
    FOREIGN KEY (`Class_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Class` (`Class_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Module_ID`
    FOREIGN KEY (`Module_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Module` (`Module_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Week_ID`
    FOREIGN KEY (`Week_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Week` (`Week_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NAPES_Lesson_Plans`.`Parents_Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`Parents_Student` (
  `PS_ID` INT NOT NULL AUTO_INCREMENT,
  `Student_ID` INT NULL,
  `Parent_ID` INT NULL,
  `Last_Name` VARCHAR(25) NULL,
  `Phone_No` VARCHAR(12) NULL,
  `Email` VARCHAR(45) NULL,
  `Teacher_ID` INT NULL,
  `Active` VARCHAR(1),
  `Insert_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Inserted_By` VARCHAR(10) NULL DEFAULT 'User',
  `Updated_Date` TIMESTAMP NULL DEFAULT Current_Timestamp,
  `Updated_By` VARCHAR(10) NULL DEFAULT 'User',
  `Active` VARCHAR(1) NULL COMMENT 'Y-N',
  PRIMARY KEY (`PS_ID`),
  UNIQUE INDEX `Director_ID_UNIQUE` (`PS_ID` ASC) VISIBLE,
  INDEX `Student_ID_idx` (`Student_ID` ASC) VISIBLE,
  INDEX `Parent_ID_idx` (`Parent_ID` ASC) VISIBLE,
  CONSTRAINT `Student_ID3`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Student` (`Student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Parent_ID`
    FOREIGN KEY (`Parent_ID`)
    REFERENCES `NAPES_Lesson_Plans_New`.`Parents` (`Parent_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `NAPES_Lesson_Plans` ;

-- -----------------------------------------------------
-- Placeholder table for view `NAPES_Lesson_Plans`.`vw_Lesson_Plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NAPES_Lesson_Plans`.`vw_Lesson_Plan` 
	(`Teacher_Name` INT, 
	`Grade_Name` INT, 
	`Class_Name` INT, 
    `Standard_Type` INT, 
    `Standard` INT);

-- -----------------------------------------------------
-- View `NAPES_Lesson_Plans`.`vw_Lesson_Plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NAPES_Lesson_Plans`.`vw_Lesson_Plan`;
USE `NAPES_Lesson_Plans`;
CREATE  OR REPLACE VIEW `vw_Lesson_Plan` AS
SELECT CONCAT(t.First_Name,COALESCE(T.Middle_Name,''),T.Last_Name) AS Teacher_Name
	,G.Grade_Name, C.Class_Name, LP.Standard_Type, LP.Standard
FROM Teacher T
INNER JOIN Teacher_Student ST ON T.Teacher_ID = ST.Teacher_ID
INNER JOIN Grades G ON ST.Grade_ID = G.Grade_ID
INNER JOIN Class C ON G.Class_ID = C.Class_ID
INNER JOIN Lesson_Plan LP ON C.Class_ID = LP.Class_ID;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
