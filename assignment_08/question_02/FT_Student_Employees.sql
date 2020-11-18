/*
Question 3C
Show name, NID, and GPA of full time students who also work

Adding Department and Job Title just for reference. In a real world situation, I'm sure the requestor of this report would want to know where they work and what they do.
*/

.mode column
.header on
.output FT_Student_Employees.out

SELECT
StudentRegister.FirstName,
StudentRegister.LastName,
StudentRegister.NID,
Employees.Department,
Employees.Job_Title,
StudentRegister.GPA
FROM
StudentRegister
INNER JOIN
Employees
ON StudentRegister.NID = Employees.NID
WHERE StudentRegister.Status = 'Full time';

.output stdout
