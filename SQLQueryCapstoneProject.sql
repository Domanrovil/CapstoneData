
/* Team 8 Church Management System Database Prototype*/
/* The SQL Query will create various tables that will be needed for the database involving the church management system
All tables were taken from the ER diagram made from sprint 3 with some minor changes meant to make the tables more 
accurate and informative.*/

Create database ChurchVolunteerManagementSystem
Create table Roles
(RoleID int  NOT null,
RoleName varchar (30) not null,
RoleDesc varchar (100) not null,
constraint PK_Roles primary key(RoleID))

/* Fake Data and a select * from command to display an example of how table will look */
insert into Roles
(RoleID,RoleName,RoleDesc) 
values
(1,'Administrator','In Charge of Database/Church Management System'),
(2,'TeamLeader','In charge of assigning and managing team members for events'),
(3,'TeamMember','Member of a team for events')
Select * from Roles

create table Teams
(TeamID int not null,
TeamDesc varchar (100),
constraint PK_Teams primary key(TeamID))

Create table ZipCodes
(ZipCode varchar(15),
City varchar (50),
State varchar(5),
Constraint PK_ZipCodes Primary key(ZipCode))

/* Changed name of StreetAddress1 StreetAddress2 to Address_Line1 & Address_Line2 respectively*/
Create Table Users(
UserID int not null,
FirstName varchar(50) not null,
MiddleInitial varchar(1),
LastName varchar(50) not null,
Address_Line1 varchar(50),
Address_Line2 varchar(50),
Phone varchar(14),
Email varchar(50),
ZipCode varchar(15) not null,
RoleID int not null,
Constraint PK_Users Primary Key(UserID),
Constraint FK_Users_ZipCodes Foreign Key (ZipCode) References ZipCodes,
Constraint FK_Users_Roles Foreign Key(RoleID) References Roles,)

Create Table UserAvailability(
UserID int not null,
DayOfWeek varchar(20),
StartTime time,
EndTime time,
Constraint PK_UserAvailability primary key (UserID),
Constraint FK_UserAvailability_Users Foreign Key (UserID) References Users)

Create table TeamAssignments(
TeamID int not null,
UserID int not null,
Constraint PK_TeamAssignments primary key(TeamID,UserID),
Constraint FK_TeamAssignments_Teams Foreign Key (TeamID) References Teams,
Constraint FK_TeamAssignments_Users Foreign Key (UserID) References Users)

Create table Logins(
LoginID int not null,
LoginUserName varchar (50),
UserPassword varchar (50),
UserID int not null,
Constraint PK_Logins Primary Key (LoginID),
Constraint FK_Logins_Users Foreign key (UserID) References Users)

Create Table Jobs(
JobID int not null,
JobDescription varchar (100),
Constraint PK_Jobs Primary Key (JobID))

Create Table Files(
FileID int not null,
FileDescription varchar(100),
FileTags varchar(50),
FilePath varchar(200),
FileImage varbinary(max),
Constraint PK_Files Primary Key (FileID))

/* Seperated EventDateTime and created new columns to add more detail to the specific time and date*/
Create Table Events(
EventID int not null,
EventName varchar(100),
EventStartDate date,
EventEndDate date,
EventStartTime time,
EventEndTime time,
UserID int not null,
Constraint PK_Events Primary Key (EventID),
constraint FK_Events_Users foreign key (UserID) references Users)

Create table FileShares(
FileID int not null,
TeamID int not null,
EventID int not null,
Constraint PK_FileShares Primary Key (FileID,TeamID),
Constraint Fk_Fileshares_Files foreign key (FileID) References Files,
Constraint FK_FileShares_Teams foreign key (TeamID) References Teams,
Constraint FK_FileShares_Events foreign key (EventID) References Events)

Create table Shifts(
ShiftID Int not null,
Date date,
StartTime time,
EndTime time,
UserID int not null,
JobID int not null,
EventID int not null,
Constraint PK_Shifts Primary Key (ShiftID),
Constraint FK_Shifts_Users foreign key (UserID) references Users,
Constraint FK_Shifts_Jobs Foreign Key (JobID) References Jobs,
Constraint FK_Shifts_Events Foreign Key (EventID) References Events)





