CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    SSN CHAR(11) NOT NULL,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Birthdate DATE,
    Gender CHAR(1),
    Address VARCHAR(255),
    Phone CHAR(10),
    Class VARCHAR(50),
    Major VARCHAR(50),
    Minor VARCHAR(50),
    Degree VARCHAR(50)
);

CREATE TABLE Department (
    Department_Code INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Office_Number VARCHAR(10),
    Office_Phone CHAR(10),
    College VARCHAR(100)
);

CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    SSN CHAR(11) NOT NULL,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Birthdate DATE,
    Gender CHAR(1),
    Address VARCHAR(255),
    Phone CHAR(10),
    Department_Code INT,
    FOREIGN KEY (Department_Code) REFERENCES Department(Department_Code)
);

CREATE TABLE Dependent (
    Name VARCHAR(50) NOT NULL,
    Gender CHAR(1),
    Date_of_Birth DATE,
    Employee_ID INT,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Course (
    Course_Number INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Semester_Hours INT,
    Offering_Department INT,
    FOREIGN KEY (Offering_Department) REFERENCES Department(Department_Code)
);

CREATE TABLE Section (
    Section_Number INT PRIMARY KEY,
    Course_Number INT,
    Semester VARCHAR(10),
    Year INT,
    FOREIGN KEY (Course_Number) REFERENCES Course(Course_Number)
);

CREATE TABLE Grade_Report (
    Letter_Grade CHAR(2),
    Numeric_Grade DECIMAL(3, 2),
    Student_ID INT,
    Section_Number INT,
    PRIMARY KEY (Student_ID, Section_Number),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Section_Number) REFERENCES Section(Section_Number)
);
