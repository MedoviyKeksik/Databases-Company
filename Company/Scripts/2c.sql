SELECT Id FROM [Employee]
WHERE 
	(SELECT Amount FROM [Salary]
	WHERE EmployeeId = [Employee].Id AND Year = 2015 AND Month = 5)
	< (SELECT TOP 1 Amount FROM [Salary]
	WHERE EmployeeId = [Employee].Id AND YEAR = 2015 AND Month BETWEEN 1 and 4
	ORDER BY Amount ASC)