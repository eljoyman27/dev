INSERT INTO Data_History (Table_Name, Student_id, First_Name, Middle_Name,Last_Name, 
				Active, Change_Performed)
        VALUES ("Student","2453464","John","P","Jefferson", "Y","Insert");
  
  SELECT * FROM Data_History;
  
  INSERT INTO Data_History (Table_Name, Student_id, First_Name, Middle_Name,Last_Name, 
				Stud_Status, Change_Performed)
        VALUES ('Student', new.Student_id, new.First_Name, new.Middle_Name, new.Last_Name, new.Stud_Status, 'I') ;      
        
        
CREATE DEFINER = CURRENT_USER TRIGGER `ins_Student` AFTER INSERT ON `Student` FOR EACH ROW
BEGIN
    INSERT INTO Data_History (Table_Name, Student_id, First_Name, Middle_Name,Last_Name, 
				Student_Status, Change_Performed)
        VALUES ('Student', new.Student_id, new.First_Name, new.Middle_Name, new.Last_Name, new.Stud_Status, 'I');
  END