Create schema Lesson_Plan;
/**************************************/
USE NAPES_Lesson_Plans;
/**************************************/
/*********** School table *************/
/**************************************/
Create Table School
(
	School_ID INT auto_increment not null primary key,
    School_Name Varchar(50),
    School_PhoneNo Varchar(10),
    School_Email Varchar(30),
    School_Address1 Varchar(50),
    School_Address2 Varchar(10),
    School_City Varchar(25),
    School_State Varchar(2),
    School_ZipCode Varchar(10)
)auto_increment=11110001;
/**************************************/
/*********** Director table ***********/
/**************************************/
Create Table Director
(
	Director_ID INT auto_increment not null primary key,
    Director_FName Varchar(25),
    Director_MName Varchar(1),
    Director_LName Varchar(25),
    Director_PhoneNo Varchar(10),
    Director_Email Varchar(30)
)auto_increment=11110001;
/**************************************/
/*********** Join table ***************/
/**************************************/
Create Table School_Director
(
	Sch_Dir_ID INT auto_increment not null primary key,
    School_ID INT, -- One school can have multiple directors
    Director_ID INT -- One director can have multiple schools
)auto_increment=11110001;
/**************************************/
/*********** Teacher table ************/
/**************************************/
Create Table Teacher
(
	Teacher_ID INT auto_increment not null primary key,
    Director_ID INT,
    Teacher_FName Varchar(25),
    Teacher_MName Varchar(1),
    Teacher_LName Varchar(25),
    Teacher_PhoneNo Varchar(10),
    Teacher_Email Varchar(30),
    INDEX par_car_ind (Parent_ID),
    FOREIGN KEY (Parent_ID)
        REFERENCES Parent_Tbl(Parent_ID)
        ON DELETE CASCADE )Auto_increment=11110001;
        
/**************************************/
/*********** Join table ***************/
/**************************************/
Create Table Director_Teacher
(
	Sch_Dir_ID INT auto_increment not null primary key,
    Teacher_ID INT, -- One teacher can have multiple directors
    Director_ID INT -- One director can have multiple Teachers
)auto_increment=21110001;
/**************************************/   
ALTER TABLE `NAPES_Lesson_Plans`.`Director_Teacher` 
	ADD INDEX `Director_ID_idx` (`Director_ID` ASC) VISIBLE,
	ADD INDEX `Teacher_ID_idx` (`Teacher_ID` ASC) VISIBLE;
ALTER TABLE `NAPES_Lesson_Plans`.`Director_Teacher` 
	ADD CONSTRAINT `Director_ID`
	  FOREIGN KEY (`Director_ID`)
	  REFERENCES `NAPES_Lesson_Plans`.`Director` (`Director_ID`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION,
	ADD CONSTRAINT `Teacher_ID`
	  FOREIGN KEY (`Teacher_ID`)
	  REFERENCES `NAPES_Lesson_Plans`.`Teacher` (`Teacher_ID`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION; 
/**************************************/
/*********** JLesson plan table *******/
/**************************************/
Create Table Lesson_Plan
(
	LP_id INT auto_increment not null primary key,
    Grade_Name Varchar(10),
    Standard_Class Varchar(10),
    Standard_Type Varchar(30),
    Standard Text
)auto_increment=11110001;
/**************************************/
/*********** Join table ***************/
/**************************************/
Create Table Director_Teacher
(
	Sch_Dir_ID INT auto_increment not null primary key,
    Teacher_ID INT, -- One teacher can have multiple lesson plans
    Grade_ID INT ,-- One lesson plan can have multiple Teachers
	Grade_Name Varchar(10),
    Class_ID INT,
	Class_Name Varchar(12)
)auto_increment=1;
/**************************************/
/*********** Grade table **************/
/**************************************/
Create Table Grade
(
	

)auto_increment=1;