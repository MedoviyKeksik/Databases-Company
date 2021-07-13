SELECT Surname FROM [Employee]
WHERE Id IN 
	(SELECT EmployeeID FROM [Salary]
	WHERE Year = 2015 AND Month = 1)