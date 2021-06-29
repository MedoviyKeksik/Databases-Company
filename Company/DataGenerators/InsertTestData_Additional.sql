/* Employee */
INSERT INTO Employee (Name, Surname, DateOfBirth, Email) VALUES ('Klim', 'Severin', '05.03.2001', 'Klim.Seviaryn@itechart-group.com');
INSERT INTO Employee (Name, Surname, DateOfBirth, Email) VALUES ('Pavel', 'Slyaz', '07.25.2001', 'SomMail@wasd.com');
INSERT INTO Employee (Name, Surname, DateOfBirth, Email) VALUES ('Alena', 'Strunevskaya', '10.19.2000', 'SomMail1@wasd.com');

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
INSERT INTO Salary (EmployeeName, EmployeeSurname, Month, Year, Amount) VALUES ('Klim', 'Severin', 01, 2015, 450);
INSERT INTO Salary (EmployeeName, EmployeeSurname, Month, Year, Amount) VALUES ('Pavel', 'Slyaz', 01, 2015, 550);
INSERT INTO Salary (EmployeeName, EmployeeSurname, Month, Year, Amount) VALUES ('Klim', 'Severin', 05, 2015, 500);
INSERT INTO Salary (EmployeeName, EmployeeSurname, Month, Year, Amount) VALUES ('Pavel', 'Slyaz', 05, 2015, 500);
INSERT INTO Salary (EmployeeName, EmployeeSurname, Month, Year, Amount) VALUES ('Alena', 'Strunevskaya', 01, 2015, 3000);
INSERT INTO Salary (EmployeeName, EmployeeSurname, Month, Year, Amount) VALUES ('Alena', 'Strunevskaya', 01, 2013, 3000);
INSERT INTO Salary (EmployeeName, EmployeeSurname, Month, Year, Amount) VALUES ('Alena', 'Strunevskaya', 01, 2012, 3000);

/* Career */
INSERT INTO Career (EmployeeName, EmployeeSurname, JobId, DepartmentId, DateHired, DateDismissed) VALUES ('Klim', 'Severin', 1, 1, '04.20.2021', '08.20.2021');
INSERT INTO Career (EmployeeName, EmployeeSurname, JobId, DepartmentId, DateHired, DateDismissed) VALUES ('Pavel', 'Slyaz', 1, 1, '03.20.2021', '07.20.2021');
INSERT INTO Career (EmployeeName, EmployeeSurname, JobId, DepartmentId, DateHired, DateDismissed) VALUES ('Pavel', 'Slyaz', 2, 1, '03.20.2022', '07.20.2023');
INSERT INTO Career (EmployeeName, EmployeeSurname, JobId, DepartmentId, DateHired, DateDismissed) VALUES ('Alena', 'Strunevskaya', 3, 2, '03.17.2021', '07.17.2021');
INSERT INTO Career (EmployeeName, EmployeeSurname, JobId, DepartmentId, DateHired, DateDismissed) VALUES ('Alena', 'Strunevskaya', 3, 2, '03.17.2022', '07.17.2023');


