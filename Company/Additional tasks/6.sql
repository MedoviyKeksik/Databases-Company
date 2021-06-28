CREATE PROCEDURE GetWorkHistory
	@Name nchar(100),
	@Surname nchar(100)
AS
	SELECT Job.Title FROM Career
	JOIN Job ON Career.JobId = Job.Id
	JOIN Employee ON Career.EmployeeId = Employee.Id
	WHERE @Name = Employee.Name AND @Surname = Employee.Surname; 