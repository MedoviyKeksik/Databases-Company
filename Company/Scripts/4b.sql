SELECT Name, Surname, SUM(DATEDIFF(month, DateHired, DateDismissed)) as 'Work experience(month)' FROM [Employee]
JOIN [Career]
ON [Employee].Id = EmployeeId
GROUP BY Name, Surname, DepartmentId, JobId