ALTER TABLE Employee
	ADD Email nchar(255) NOT NULL;

CREATE UNIQUE INDEX AK_Employee_Email
	ON Employee (Email);
