/*****************************************/
Create database Dismissal_App;
/*****************************************/
/**** Parent ****************************/
/*****************************************/
create table Parent_tbl (
    Parent_ID INT auto_increment not null primary key,
    Parent_FName varchar(50) not null,
    Parent_MName Varchar(1) Null,
    Parent_LName Varchar(50) Not null,
    Address_1 Varchar(100) null,
    Address_2 Varchar(10) null,
    City Varchar(15) null,
    State Varchar(2) Null,
    Zip_Code Varchar(12)
    /*Parent_Stud_ID INT, -- One parent might have one or more students
    Parent_Car_ID INT -- One parent might have one or more cars */
)auto_increment=11110001;

/*****************************************/
/**** Parent Car *************************/
/*****************************************/
Create Table Parent_Car (
	Parent_Car_ID INT auto_increment not null primary key,
	Parent_ID int,
	Car_Type Varchar(12),
	Car_Model Varchar(10),
	Car_Year Year,
	Car_Color Varchar(10),
	License_Plate Varchar(10),
	Ticket_Number Varchar(10),
     INDEX par_car_ind (Parent_ID),
    FOREIGN KEY (Parent_ID)
        REFERENCES Parent_Tbl(Parent_ID)
        ON DELETE CASCADE )Auto_increment=11110001;

/*****************************************/
/**** Student ****************************/
/*****************************************/
create table Student_tbl (
    Student_ID INT auto_increment not null primary key,
    Student_FName varchar(50) not null,
    Student_MName Varchar(1) Null,
    Student_LName Varchar(50) Not null,
    Address_1 Varchar(100) not null,
    Address_2 Varchar(10) null,
    City Varchar(15) Not null,
    State Varchar(2) Not Null,
    Zip_Code Varchar(12)
    /*Parent_ID INT, -- One teacher might have one or more Parents
    Teacher_ID INT, -- One Student might have one or more Teachers
    Class_ID INT, -- One Student might have one or more Classes
    Grade_ID Varchar(10) */
)auto_increment=11110001;
/*****************************************/
/**** Parent_Student *********************/
/*****************************************/
Create Table Parent_Student (
	Parent_Student_ID INT auto_increment not null primary key,
	Parent_ID INT,
    Student_ID INT,
     INDEX par_index (Parent_ID),
    FOREIGN KEY (Parent_ID)
        REFERENCES Parent_Tbl(Parent_ID)
        ON DELETE CASCADE,
	 INDEX student_index (Student_ID),
	FOREIGN KEY (Student_ID)
		REFERENCES Student_Tbl(Student_ID)
		ON DELETE CASCADE )auto_increment=1000;
/*****************************************/
/**** Teacher ****************************/
/*****************************************/
create table Teacher_tbl (
    Teacher_ID INT auto_increment not null primary key,
    Teacher_FName varchar(50) not null,
    Teacher_MName Varchar(1) Null,
    Teacher_LName Varchar(50) Not null,
    Address_1 Varchar(100) not null,
    Address_2 Varchar(10) null,
    City Varchar(15) Not null,
    State Varchar(2) Not Null,
    Zip_Code Varchar(12)
    )auto_increment=11001000;

/*****************************************/
/**** Class ******************************/
/*****************************************/
create table Class_tbl (
    Class_ID INT auto_increment not null primary key,
    Class_Name Varchar(20),-- One teacher give have one or more classes
    Class_Description Float
    )auto_increment=10;
 
 /*****************************************/
/**** Grade ******************************/
/*****************************************/
create table Grade_tbl (
    Grade_ID INT auto_increment not null primary key,
    Grade_Number Numeric,-- One teacher might have one or more grades
    Grade_Name Varchar(10),
    Grade_Description Float
    ); 
 
/*****************************************/
/**** Teacher/Student/Class/Grade ********/
/*****************************************/
Create Table Teacher_Student (
	Teacher_Student_ID INT auto_increment not null primary key,
	Teacher_ID INT, -- One teacher might have one or more Students
    Student_ID int, -- One student might have one or more teachers
    Class_ID INT, -- One student might have one or more Classes
    Grade_ID INT,  -- One teacher might have one or more Grades
    Classroom_No Varchar(5),
     INDEX Teacher_index (Teacher_ID),
    FOREIGN KEY (Teacher_ID)
        REFERENCES Teacher_Tbl(Teacher_ID)
        ON DELETE CASCADE,
	 INDEX student2_index (Student_ID),
	FOREIGN KEY (Student_ID)
		REFERENCES Student_Tbl(Student_ID)
		ON DELETE CASCADE,
	 INDEX Class_index (class_ID),
	FOREIGN KEY (Class_ID)
		REFERENCES Class_Tbl(Class_ID)
		ON DELETE CASCADE,
	 INDEX Grade_index (Grade_ID),
	FOREIGN KEY (Grade_ID)
		REFERENCES Grade_Tbl(Grade_ID)
		ON DELETE CASCADE )auto_increment=00000001;
/********************************************/
/** General View vw_Dismissal ***************/
/********************************************/
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_dismissal` AS
    SELECT 
        `pt`.`Parent_FName` AS `Parent_FName`,
        COALESCE(`pt`.`Parent_MName`,'') AS `Parent_MName`,
        `pt`.`Parent_LName` AS `Parent_LName`,
        `st`.`Student_FName` AS `Student_FName`,
        COALESCE(`st`.`Student_MName`,'') AS `Student_MName`,
        `st`.`Student_LName` AS `Student_LName`,
        `tt`.`Teacher_FName` AS `Teacher_FName`,
        COALESCE(`tt`.`Teacher_MName`,'') AS `Teacher_MName`,
        `tt`.`Teacher_LName` AS `Teacher_LName`,
        `gt`.`Grade_Name` AS `Grade_Name`,
        `ct`.`Class_Name` AS `Class_Name`,
        `ts`.`Classroom_No` AS `Classroom_No`
    FROM
        ((((((`parent_tbl` `pt`
        JOIN `parent_student` `ps` ON ((`pt`.`Parent_ID` = `ps`.`Parent_ID`)))
        JOIN `student_tbl` `st` ON ((`ps`.`Student_ID` = `st`.`Student_ID`)))
        JOIN `teacher_student` `ts` ON ((`st`.`Student_ID` = `ts`.`Student_ID`)))
        JOIN `teacher_tbl` `tt` ON ((`ts`.`Teacher_ID` = `tt`.`Teacher_ID`)))
        JOIN `grade_tbl` `gt` ON ((`ts`.`Grade_ID` = `gt`.`Grade_ID`)))
        JOIN `class_tbl` `ct` ON ((`ts`.`Class_ID` = `ct`.`Class_ID`)))
  /**********************************************/
  SELECT * FROM vw_dismissal;
/**********************************************/
