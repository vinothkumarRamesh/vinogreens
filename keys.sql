//Demo: Primary Key vs Foreign Key

// Step 1: Create Database 
CREATE DATABASE PKFK_Demo;
GO

USE PKFK_Demo;
GO

// Step 2: Create Parent Tables (Primary Keys)
CREATE TABLE Students (
    StudentID INT PRIMARY KEY, //StudentID is Primary Key
    StudentName VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY, //CourseID is Primary Key
    CourseName VARCHAR(100)
);


// Step 3: Create Child Table (Foreign Keys)
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


// StudentID is Foreign Key → references Students table
// CourseID is Foreign Key → references Courses table

// Step 4: Insert Data (Valid Data) - This will work perfectly.
INSERT INTO Students VALUES (1, 'Ram');
INSERT INTO Students VALUES (2, 'John');

INSERT INTO Courses VALUES (101, 'SQL');
INSERT INTO Courses VALUES (102, 'Python');

INSERT INTO Enrollments VALUES (1001, 1, 101);
INSERT INTO Enrollments VALUES (1002, 2, 102);


// Step 5: Try Invalid Insert (To Understand FK) - This will FAIL.

INSERT INTO Enrollments VALUES (1003, 5, 101);

// Because StudentID = 5 does NOT exist in Students table. This is how Foreign Key maintains data integrity.


// Step 6: Try Duplicate Primary Key
INSERT INTO Students VALUES (1, 'Anita');


✔ Primary Key = Unique Identifier
✔ Foreign Key = Relationship between tables
✔ Prevents invalid data
✔ Maintains referential integrity