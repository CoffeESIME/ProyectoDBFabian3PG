USE [master]
GO
/******Base de datos de vacunación Fabian******/
 create database [VaccinationVFabian]
 GO
USE VaccinationVFabian
GO
create table State
(
    idState tinyint IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] varchar(30)NOT NULL,
	
);

create table [Personnel key] 
(
    [idPersonnel key] tinyint PRIMARY KEY NOT NULL,
	[Name] varchar(30) NOT NULL, 
);

create table Vaccine
(
    idVaccine tinyint IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [Name] varchar(50) NOT NULL,
	[Dose] varchar(30) NOT NULL,

);

create table Campus
(
    idCampus tinyint IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [Address] varchar(100) NOT NULL,
	[Date] smalldatetime NOT NULL,
	idState tinyint,
	FOREIGN KEY (idState) references State(idState),
);



create table Personnel 
(
    idPersonnel int IDENTITY(1,1) PRIMARY KEY,
	[Name] varchar(30) NOT NULL,
    [Maternal surname] varchar(100) NOT NULL,
    [Paternal surname] varchar(100) NOT NULL,
    [Address]  varchar(100)NOT NULL,
	[Telephone number] varchar(10) NOT NULL,
    [idPersonnel key] tinyint,
	FOREIGN KEY ([idPersonnel key]) references [Personnel key]([idPersonnel key]),
	idCampus tinyint,
	FOREIGN KEY(idCampus) references Campus(idCampus),
	
);
    
create table Citizen
(
    idCitizen int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] varchar(30) NOT NULL,
    [Maternal surname] varchar(100) NOT NULL,
    [Paternal surname] varchar(100) NOT NULL,
    [Address] varchar(100)NOT NULL,
	[Telephone number] varchar(10) NOT NULL,
	Age tinyint NOT NULL,
	idCampus tinyint,
	FOREIGN KEY(idCampus) references Campus(idCampus),
	idVaccine tinyint,
	FOREIGN KEY(idVaccine) references Vaccine(idVaccine),
);
create table [Citizen report] 
(
    idReport int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idCitizen int
	FOREIGN KEY(idCitizen) references Citizen(idCitizen),
	idCampus tinyint
	FOREIGN KEY(idCampus) references Campus(idCampus),
	idVaccine tinyint
	FOREIGN KEY(idVaccine) references Vaccine(idVaccine),
	[Dose number] tinyint,
	[Vaccination date] smalldatetime NOT NULL,
); 


ALTER DATABASE [VaccinationVFabian] SET  READ_WRITE 