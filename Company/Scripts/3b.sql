SELECT AVG(Amount) as 'Average' FROM [Salary]
WHERE Year = 2015
GROUP BY EmployeeId
HAVING COUNT(*) >= 2;