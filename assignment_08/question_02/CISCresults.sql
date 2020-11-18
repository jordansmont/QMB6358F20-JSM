/*
Question 3D
Show NID, name, employer, job title, extracurricular group and position, course codes
*/

.mode column
.headers on
.output CISCresults.out

SELECT
  Employees.NID,
  Employees.First_Name,
  Employees.Last_Name,
  Employees.Department,
  Employees.Job_Title,
  Extracurriculars.Program,
  Extracurricularsta.Position,
  StudentRegister.Course1,
  StudentRegister.Course2
FROM
  (SELECT
	Employees.NID,
  	Employees.First_Name,
  	Employees.Last_Name,
  	Employees.Department,
  	Employees.Job_Title,
  	Extracurriculars.Program,
  	Extracurriculars.Position,
  	StudentRegister.Course1,
  	StudentRegister.Course2
   FROM 
	Employees
   LEFT JOIN Extracurriculars ON Employees.NID = Extracurriculars.NID
   LEFT JOIN StudentRegister ON Employees.NID = StudentRegister.NID
   UNION
   SELECT
	Extracurriculars.NID,
	Extracurriculars.First_Name,
	Extracurriculars.Last_Name
	Employees.Department,
	Employees.Job_Title,
	Extracurriculars.Program,
	Extracurriculars.Position,
	StudentRegister.Course1,
	StudentRegister.Course2
   FROM
	Extracurriculars
   LEFT JOIN Employees ON Extracurriculars.NID = Employees.NID
   LEFT JOIN StudentRegister ON Extracurriculars.NID = StudentRegister.NID
   UNION
   SELECT
	StudentRegister.NID,
	StudentRegister.First_Name,
	StudentRegister.Last_Name
	Employees.Department,
	Employees.Job_Title,
	Extracurriculars.Program,
	Extracurriculars.Position,
	StudentRegister.Course1,
	StudentRegister.Course2
   FROM
	StudentRegister
   LEFT JOIN Employees ON StudentRegister.NID = Employees.NID
   LEFT JOIN Extracurriculars ON StudentRegister.NID = Extracurriculars.NID 
   )

.output stdout
















