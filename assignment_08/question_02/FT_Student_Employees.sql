/*
Question 3C
Show name, NID, and GPA of full time students who also work
*/

SELECT
studentregister.FirstName,
studentregister.LastName,
studentregister.NID,
studentregister.GPA,
employees.Job_Title
FROM
(SELECT * FROM studentregister WHERE Status = 'Full time') AS StudentRegister
INNER JOIN
employees as Employees
ON studentregister.NID = employees.NID

/*
I stumbled upon this producing what was asked. However I realize there are other ways to filter.
I will adjust later to filter appropriately so I won't need Job_Title in the table.
*/
