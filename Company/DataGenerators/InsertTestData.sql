/* Employee */
INSERT INTO Employee (Name, Surname, DateOfBirth) VALUES ('Klim', 'Severin', '05.03.2001');
INSERT INTO Employee (Name, Surname, DateOfBirth) VALUES ('Pavel', 'Slyaz', '07.25.2001');
INSERT INTO Employee (Name, Surname, DateOfBirth) VALUES ('Alena', 'Strunevskaya', '10.19.2000');

/* Job */
INSERT INTO Job (Title, Salary) VALUES ('Junior Software Engeneer', 400);
INSERT INTO Job (Title, Salary) VALUES ('Middle Software Engeneer', 1000);
INSERT INTO Job (Title, Salary) VALUES ('Senior Software Engeneer', 2000);
INSERT INTO Job (Title, Salary) VALUES ('Project Manajer', 3000);
INSERT INTO Job (Title, Salary) VALUES ('Team Lead', 4000);

/* Department */
INSERT INTO Department (Title, Address) VALUES ('D01', '611 Reggie River Apt. 125 Port Mitchelstad, WA 80031-0415');
INSERT INTO Department (Title, Address) VALUES ('D02', '95139 Beverly Parkways Port Ole, MO 02571');
INSERT INTO Department (Title, Address) VALUES ('D03', '48720 Wiza Coves Suite 901 East Nico, CA 28488-1010');
INSERT INTO Department (Title, Address) VALUES ('D04', '194 Zetta Fort Port Jeramiefurt, ME 49155-4797');
INSERT INTO Department (Title, Address) VALUES ('D05', '3532 Sallie Corner Suite 826 South Ambroseborough, NE 80623-3900');
INSERT INTO Department (Title, Address) VALUES ('D06', '61753 Treutel Radial Apt. 767 West Gwendolynhaven, NH 21188');

/* Salary */
INSERT INTO Salary (EmployeeId, Month, Year, Amount) VALUES (1, 01, 2015, 450);
INSERT INTO Salary (EmployeeId, Month, Year, Amount) VALUES (2, 01, 2015, 550);
INSERT INTO Salary (EmployeeId, Month, Year, Amount) VALUES (1, 05, 2015, 500);
INSERT INTO Salary (EmployeeId, Month, Year, Amount) VALUES (2, 05, 2015, 500);
INSERT INTO Salary (EmployeeId, Month, Year, Amount) VALUES (3, 01, 2015, 3000);
INSERT INTO Salary (EmployeeId, Month, Year, Amount) VALUES (3, 01, 2013, 3000);
INSERT INTO Salary (EmployeeId, Month, Year, Amount) VALUES (3, 01, 2012, 3000);

/* Career */
INSERT INTO Career (EmployeeId, JobId, DepartmentId, DateHired, DateDismissed) VALUES (1, 1, 1, '04.20.2021', '08.20.2021');
INSERT INTO Career (EmployeeId, JobId, DepartmentId, DateHired, DateDismissed) VALUES (2, 1, 1, '03.20.2021', '07.20.2021');
INSERT INTO Career (EmployeeId, JobId, DepartmentId, DateHired, DateDismissed) VALUES (2, 2, 1, '03.20.2022', '07.20.2023');
INSERT INTO Career (EmployeeId, JobId, DepartmentId, DateHired, DateDismissed) VALUES (3, 3, 2, '03.17.2021', '07.17.2021');
INSERT INTO Career (EmployeeId, JobId, DepartmentId, DateHired, DateDismissed) VALUES (3, 3, 2, '03.17.2022', '07.17.2023');


