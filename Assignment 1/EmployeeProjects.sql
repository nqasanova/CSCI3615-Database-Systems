CREATE TABLE Employee_Information(
    EmployeeID int,
    EmployeeName varchar(50),
    Department varchar(50),
    Manager varchar(50),
    OfficeLocation varchar(50),
    ProjectName varchar(50),
    Role varchar(50),
    PRIMARY KEY(EmployeeID, ProjectName)
)

SELECT * FROM Employee_Information

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY,
	EmployeeName VARCHAR(50),
	Department VARCHAR(50),
	OfficeLocation VARCHAR(50),
	Manager VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, EmployeeName, Department, OfficeLocation, Manager)
VALUES (101, 'John Doe', 'IT', 'Floor 1', 'Jane Smith'), 
(102, 'Anna Brown', 'HR','Floor 2', 'Mark Lee'),
(103, 'Gary White', 'IT', 'Floor 1', 'Jane Smith');

SELECT * FROM Employees

CREATE TABLE Projects (
	ProjectID INT PRIMARY KEY,
	ProjectName VARCHAR(50)
);

INSERT INTO Projects (ProjectID, ProjectName)
VALUES (1, 'Alpha, Beta'), (2, 'Gamma'), (3, 'Alpha');

SELECT * FROM Projects

CREATE TABLE Roles (
	RoleID INT PRIMARY KEY,
	Role VARCHAR(50)
);

INSERT INTO Roles (RoleID, Role)
VALUES (1, 'Developer, Tester'), (2, 'Coordinator'), (3, 'Developer');

SELECT * FROM Roles

CREATE TABLE EmployeeRoles (
	EmployeeID INT,
	ProjectID INT,
	RoleID INT,
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
	FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

INSERT INTO EmployeeRoles (EmployeeID, ProjectID, RoleID)
VALUES (101, 1, 1), (102, 2, 2), (103, 3, 3);

SELECT * FROM EmployeeRoles

CREATE TABLE Managers (
	ManagerID INT PRIMARY KEY,
	Manager VARCHAR(50)
);

INSERT INTO Managers(ManagerID, Manager)
VALUES (1, 'Jane Smith'), (2, 'Mark Lee'), (3, 'Jane Smith');

SELECT * FROM Managers

ALTER TABLE Employees
DROP COLUMN Manager, 
ADD COLUMN ManagerID INT,
ADD CONSTRAINT fk_manager FOREIGN KEY(ManagerID) REFERENCES Managers(ManagerID);

SELECT * FROM Employees

UPDATE Employees 
SET ManagerID = 1
WHERE EmployeeID = 101;

UPDATE Employees 
SET ManagerID = 2
WHERE EmployeeID = 101;