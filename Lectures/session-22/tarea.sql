Table Students {
    StudentID int [pk, increment]
    FirstName varchar(50) [not null]
    LastName varchar(50) [not null]
    Gender varchar(10)
    DateOfBirth date
    Email varchar(100) [unique]
    PhoneNumber varchar(20)
    Address varchar(100)
    City varchar(50)
    State varchar(50)
    PostalCode varchar(10)
    Country varchar(50)
}

Table Courses {
    CourseID int [pk, increment]
    CourseName varchar(100) [not null]
    DepartmentID int [ref: > Departments.DepartmentID]
    Credits int
}

Table Departments {
    DepartmentID int [pk, increment]
    DepartmentName varchar(100) [not null]
}

Table Professors {
    ProfessorID int [pk, increment]
    FirstName varchar(50) [not null]
    LastName varchar(50) [not null]
    Gender varchar(10)
    DateOfBirth date
    Email varchar(100) [unique]
    PhoneNumber varchar(20)
    DepartmentID int [ref: > Departments.DepartmentID]
}

Table Enrollments {
    EnrollmentID int [pk, increment]
    StudentID int [ref: > Students.StudentID]
    CourseID int [ref: > Courses.CourseID]
    ProfessorID int [ref: > Professors.ProfessorID]
    Semester varchar(10)
    Year int
    Grade decimal(3, 2)
}