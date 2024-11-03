CREATE DEFINER = CURRENT_USER TRIGGER `ins_Student` AFTER INSERT ON `Student` FOR EACH ROW
BEGIN
    INSERT INTO Data_History (Table_Name, Student_id, First_Name, Middle_Name,Last_Name, 
				Student_Status, Change_Performed)
        VALUES ("Student", new.Student_id, new.First_Name, new.Middle_Name, new.Student_Status, "I");
  END