/*
Question 3D
Show NID, name, employer, job title, extracurricular group and position, course codes
*/

SELECT
  employees.NID,
  employees.First_Name,
  employees.Last_Name,
  employees.Department,
  employees.Job_Title,
  extracurriculars.Program,
  extracurriculars.Position,
  studentregister.Course1,
  studentregister.Course2
FROM
  studentregister AS StudentRegister
INNER JOIN employees as Employees
  ON studentregister.NID = employees.NID
INNER JOIN extracurriculars as Extracurriculars
  ON extracurriculars.NID = employees.NID;
