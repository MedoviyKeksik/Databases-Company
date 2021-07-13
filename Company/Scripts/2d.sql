SELECT Id, Title, 
	(SELECT COUNT(*) as 'Employees' FROM Career
	WHERE [Department].Id = DepartmentId AND DateHired <= GETDATE() AND DateDismissed >= GETDATE()) as 'Workers' 
FROM [Department]