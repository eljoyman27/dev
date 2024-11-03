create table Parent_tbl (
    Parent_ID INT auto_increment not null primary key,
    Parent_FName varchar(50) not null,
    Parent_MName Varchar(1) Null,
    Parent_LName Varchar(50) Not null,
    Address_1 Varchar(100) not null,
    Address_2 Varchar(10) null,
    City Varchar(15) Not null,
    State Varchar(2) Not Null,
    Zip_Code Varchar(12),
    Parent_Stud_ID INT, -- One parent might have one or more students
    Parent_Car_ID INT -- One parent might have one or more cars
    );

/*****************************************/
/**** Parent Car *************************/
/*****************************************/
Create Table Parent_Car (
	Parent_Car_ID INT AUTO_INCREMENT not null primary key,
	Parent_ID INT,
	Car_Type Varchar(12),
	Car_Model Varchar(10),
	Car_Year Year,
	Car_Color Varchar(10),
	License_Plate Varchar(10),
	Ticket_Number Varchar(10),
     INDEX par_car_ind (Parent_ID),
    FOREIGN KEY (Parent_ID)
        REFERENCES Parent_Tbl(Parent_ID)
        ON DELETE CASCADE );

/*****************************************/
/**** Student ****************************/
/*****************************************/
create table Student_tbl (
    Student_ID INT AUTO_INCREMENT not null primary key,
    Student_FName varchar(50) not null,
    Student_MName Varchar(1) Null,
    Student_LName Varchar(50) Not null,
    Address_1 Varchar(100) not null,
    Address_2 Varchar(10) null,
    City Varchar(15) Not null,
    State Varchar(2) Not Null,
    Zip_Code Varchar(12),
    Parent_ID INT, -- One teacher might have one or more Parents
    Teacher_ID INT, -- One Student might have one or more Teachers
    Class_ID INT, -- One Student might have one or more Classes
    Grade_ID Varchar(10)
);
/*****************************************/
/**** Parent_Student *********************/
/*****************************************/
Create Table Parent_Student (
	Parent_Student_ID INT AUTO_INCREMENT not null primary key,
	Parent_ID INT,
    Student_ID INT,
     INDEX par_index (Parent_ID),
    FOREIGN KEY (Parent_ID)
        REFERENCES Parent_Tbl(Parent_ID)
        ON DELETE CASCADE,
	 INDEX student_index (Student_ID),
	FOREIGN KEY (Student_ID)
		REFERENCES Student_Tbl(Student_ID)
		ON DELETE CASCADE );
/*****************************************/
/**** Teacher ****************************/
/*****************************************/
create table Teacher_tbl (
    Teacher_ID INT AUTO_INCREMENT not null primary key,
    Teacher_FName varchar(50) not null,
    Teacher_MName Varchar(1) Null,
    Teacher_LName Varchar(50) Not null,
    Address_1 Varchar(100) not null,
    Address_2 Varchar(10) null,
    City Varchar(15) Not null,
    State Varchar(2) Not Null,
    Zip_Code Varchar(12)
    );

/*****************************************/
/**** Teacher/Student/Grade ********/
/*****************************************/
Create Table Teacher_Student (
	Teacher_Student_ID INT AUTO_INCREMENT not null primary key,
	Teacher_ID INT, -- One teacher might have one or more Students
    Student_ID INT, -- One student might have one or more teachers
    Class_ID INT,-- One teacher give have one or more classes
    Grade Varchar(10),-- One teacher might have one or more grades
    Classroom_No Varchar(5),
     INDEX Teacher_index (Teacher_ID),
    FOREIGN KEY (Teacher_ID)
        REFERENCES Teacher_Tbl(Teacher_ID)
        ON DELETE CASCADE,
	 INDEX student2_index (Student_ID),
	FOREIGN KEY (Student_ID)
		REFERENCES Student_Tbl(Student_ID)
		ON DELETE CASCADE );
/*****************************************/
/**** TeacherStudent/Class ********/
/*****************************************/
Create Table Class_tbl (
	Class_ID INT AUTO_INCREMENT not null primary key,
    Class_Name Varchar(25),-- One teacher give have one or more classes
    Classroom_No Varchar(5),
	 INDEX class_index1 (Class_ID),
	FOREIGN KEY (Class_ID)
		REFERENCES Teacher_Student (Class_ID)
		ON DELETE CASCADE );
/*****************************************/