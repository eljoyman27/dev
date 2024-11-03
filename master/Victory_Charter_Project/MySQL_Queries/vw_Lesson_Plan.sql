CREATE VIEW `vw_Lesson_Plan` AS
SELECT CONCAT(t.First_Name,COALESCE(T.Middle_Name,''),T.Last_Name) AS Teacher_Name
	,G.Grade_Name, C.Class_Name, LP.Standard_Type, LP.Standard

FROM Teacher T
INNER JOIN Teacher_Student ST ON T.Teacher_ID = ST.Teacher_ID
INNER JOIN Grades G ON ST.Grade_ID = G.Grade_ID
INNER JOIN Class C ON G.Class_ID = C.Class_ID
INNER JOIN Lesson_Plan LP ON C.Class_ID = LP.Class_ID