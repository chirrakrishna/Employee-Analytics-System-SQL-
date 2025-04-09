CREATE DATABASE EmployeeHRDBtemp11;
USE EmployeeHRDBtemp11;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    ManagerID INT
);
select * from Departments;

CREATE TABLE Employee1 (
    EmployeeID INT unique PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Non-binary', 'Other') NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE NOT NULL,
    DateOfJoining DATE NOT NULL,
    JobTitle VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    CONSTRAINT FK_Employee_Department1 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
select * from Employee;

ALTER TABLE Departments 
ADD CONSTRAINT FK_Department_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID);

CREATE TABLE Compensation1 (
    CompensationID INT unique PRIMARY KEY,
    EmployeeID INT NOT NULL,
    BaseSalary DECIMAL(10, 2) NOT NULL,
    Bonus DECIMAL(10, 2) DEFAULT 0.00,
    PaymentDate DATE NOT NULL,
    CONSTRAINT FK_Compensation_Employee1 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Performance1 (
    PerformanceID INT unique PRIMARY KEY,
    EmployeeID INT NOT NULL,
    Rating INT NOT NULL,
    CONSTRAINT CHK_Performance_Rating1 CHECK (Rating BETWEEN 1 AND 5),
    CONSTRAINT FK_Performance_Employee11 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Banking_Details1 (
    BankID INT unique PRIMARY KEY,
    EmployeeID INT NOT NULL,
    BankName VARCHAR(50) NOT NULL,
    AccountNumber VARCHAR(20) NOT NULL,
    IFSC_Code VARCHAR(15),
    CONSTRAINT FK_Banking_Employee1 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID) VALUES
(1, 'Human Resources', NULL), 
(2, 'Finance', NULL), 
(3, 'IT', NULL);
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, PhoneNumber, Email, DateOfJoining, JobTitle, DepartmentID) VALUES
('John', 'Doe', '1990-06-15', 'Male', '123-456-7890', 'johndoe@example.com', '2020-01-01', 'HR Manager', 1),
('Jane', 'Smith', '1985-08-22', 'Female', '098-765-4321', 'janesmith@example.com', '2019-02-15', 'Finance Analyst', 2),
('Alex', 'Taylor', '1992-11-30', 'Non-binary', '234-567-8901', 'alextaylor@example.com', '2021-03-25', 'IT Specialist', 3),
('Emily', 'Johnson', '1993-04-05', 'Female', '345-678-9012', 'emilyjohnson@example.com', '2022-07-18', 'HR Assistant', 1),
('Chris', 'Lee', '1988-12-10', 'Male', '456-789-0123', 'chrislee@example.com', '2018-09-20', 'Finance Manager', 2);


UPDATE Departments
SET ManagerID = 1
WHERE DepartmentID = 1;

UPDATE Departments
SET ManagerID = 5
WHERE DepartmentID = 2;

UPDATE Departments
SET ManagerID = 3
WHERE DepartmentID = 3;
INSERT INTO Compensation (EmployeeID, BaseSalary, Bonus, PaymentDate) VALUES
(1, 60000.00, 5000.00, '2024-12-01'),
(2, 55000.00, 4000.00, '2024-12-01'),
(3, 70000.00, 3000.00, '2024-12-01'),
(4, 45000.00, 2500.00, '2024-12-01'),
(5, 75000.00, 6000.00, '2024-12-01');
INSERT INTO Performance (EmployeeID, Rating) VALUES
(1, 5),
(2, 4),
(3, 3),
(4, 4),
(5, 5);
INSERT INTO Banking_Details (EmployeeID, BankName, AccountNumber, IFSC_Code) VALUES
(1, 'Bank of America', '1234567890', 'BOA1234567'),
(2, 'Chase Bank', '0987654321', 'CHAS9876543'),
(3, 'Wells Fargo', '5678901234', 'WELF4567890'),
(4, 'Citibank', '6789012345', 'CITI6789012'),
(5, 'HSBC', '7890123456', 'HSBC7890123');