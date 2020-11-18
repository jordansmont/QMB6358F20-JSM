/*
Question 3D
Show NID, name, employer, job title, extracurricular group and position, course codes
*/

.mode column
.headers on
.output CISCresults.out

SELECT
  AllData.nid,
  AllData.First_Name,
  AllData.Last_Name,
  AllData.Department,
  AllData.Job_Title,
  AllData.Program,
  AllData.Position,
  AllData.Course1,
  AllData.Course2
FROM
  (SELECT
	Employees.nid,
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
   LEFT JOIN Extracurriculars ON Employees.nid = Extracurriculars.NID
   LEFT JOIN StudentRegister ON Employees.nid = StudentRegister.NID
   UNION
   SELECT
	Employees.NID,
	Extracurriculars.FirstName,
	Extracurriculars.LastName,
	Employees.Department,
	Employees.Job_Title,	
	Extracurriculars.Program,
	Extracurriculars.Position,
	StudentRegister.Course1,
	StudentRegister.Course2
   FROM
	Extracurriculars
   LEFT JOIN Employees ON Extracurriculars.NID = Employees.nid
   LEFT JOIN StudentRegister ON Extracurriculars.NID = StudentRegister.NID
   UNION
   SELECT
	Employees.NID,
	StudentRegister.FirstName,
	StudentRegister.LastName,
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
   );

.output stdout
















