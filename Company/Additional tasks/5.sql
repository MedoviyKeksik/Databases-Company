CREATE VIEW [dbo].[EmployeeDistribution]
	AS SELECT COUNT(*) AS 'Count', Department.Title as 'Department', Job.Title as 'Job' FROM Career
	JOIN Department ON Career.DepartmentId = Department.Id
	JOIN Job ON Career.JobId = Job.Id
	WHERE GETDATE() BETWEEN Career.DateHired and Career.DateDismissed
	GROUP BY Department.Title, Job.Title
