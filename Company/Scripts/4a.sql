SELECT Name, Surname FROM [Employee]
JOIN [Salary]
ON [Employee].Id = EmployeeId
WHERE Year = 2015 AND Month = 1 AND Amount > 1000