/* Miguel Nillas
* Final Exam Part 2
* 04/21/2024
*/
DROP DATABASE IF EXISTS college;
CREATE DATABASE college;

-- table 1
USE college;
Create Table student (
	StuNum varchar(5) Primary Key,
    StuFirstName varchar(25),
    StuLastName varchar(25),
    StuMajor varchar(40)
);

-- table 2

Create Table instructor (
	InstructorID varchar(5) primary key,
    Ins_FNAme varchar(30),
    Ins_LName varchar(30),
    Phone varchar(15)
);

-- table 3

create table class (
	ClassCode varchar(5) primary key,
    SectionNum varchar(5),
    InstructorID varchar(5),
    Location varchar(40),
    foreign key (InstructorID) references instructor(InstructorID)
);

-- table 4

create table registration (
	ClassCode varchar(5),
    StuNum varchar(5),
    EnrollDate date,
    primary key (ClassCode, StuNum),
    foreign key (ClassCode) references class(ClassCode),
    foreign key (StuNum) references student(StuNum)
);