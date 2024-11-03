CREATE DEFINER = CURRENT_USER TRIGGER 'ins_student` AFTER INSERT ON `Student` 
FOR EACH ROW
BEGIN
    IF (old.Student_ID != new.Student_ID) OR 
		OR (old.First_Name != new.First_Name) OR OR (old.Middle_Name != new.Middle_Name)
        OR (old.Last_Name != new.Last_Name) OR (old.Stud_Satus != new.Stud_Satus)
    THEN
        UPDATE Data_History
            SET Student_ID=new.Student_ID,
                First_Name=new. First_Name,
                Middle_Name=new.Middle_Name,
                Last_Name=new.Last_Name,
                Table_Name='Student',
                Change_Performed='U'
        WHERE Student_ID=old.Student_ID;
    END IF;
  END