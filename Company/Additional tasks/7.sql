CREATE FUNCTION [dbo].[7]
(
	@EmployeeId int,
	@DateStart datetime,
	@DateEnd datetime
)
RETURNS INT
AS
BEGIN
	DECLARE @Result int
	SELECT @Result = SUM(Amount) FROM Salary
		WHERE EmployeeId = @EmployeeId AND DATETIMEFROMPARTS(Year, Month, 1, 0, 0, 0, 0) BETWEEN @DateStart AND @DateEnd	
	RETURN @Result
END
