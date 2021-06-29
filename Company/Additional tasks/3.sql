/* Clear all references */
DELETE Salary;
DELETE Career; 

/* Remove foreign key in Salary */
ALTER TABLE Salary
	DROP CONSTRAINT FK_Salary_ToEmployee
ALTER TABLE Salary
	DROP COLUMN EmployeeId;
GO

/* Remove foreign key in Career */
ALTER TABLE Career
	DROP CONSTRAINT FK_Career_ToEmployee
ALTER TABLE Career
	DROP COLUMN EmployeeId;
GO

/* Remove old PK*/
ALTER TABLE Employee
	DROP CONSTRAINT PK_EmployeeID;
ALTER TABLE Employee
	DROP COLUMN Id;
GO

/* Set PK columns not null */
ALTER TABLE Employee
	ALTER COLUMN Name nchar(100) NOT NULL;
	
ALTER TABLE Employee
	ALTER COLUMN Surname nchar(100) NOT NULL;
GO

ALTER TABLE Employee
	ADD CONSTRAINT PK_Employee_NS PRIMARY KEY (Name, Surname);

/* FK in Career */
ALTER TABLE Career
	ADD EmployeeName nchar(100)

ALTER TABLE Career
	ADD EmployeeSurname nchar(100)

ALTER TABLE Career
	ADD CONSTRAINT FK_Career_ToEmployee 
	FOREIGN KEY (EmployeeName, EmployeeSurname) REFERENCES Employee (Name, Surname)
	

/* FK in Salary */
ALTER TABLE Salary
	ADD EmployeeName nchar(100)

ALTER TABLE Salary
	ADD EmployeeSurname nchar(100)

ALTER TABLE Salary
	ADD CONSTRAINT FK_Salary_ToEmployee 
	FOREIGN KEY (EmployeeName, EmployeeSurname) REFERENCES Employee (Name, Surname)
	