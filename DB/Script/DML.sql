/*INSERT DATA IN STATE*/
USE [VaccinationVFabian]
GO

SET IDENTITY_INSERT [dbo].[State] ON;
INSERT [dbo].[State] ([idState], [Name]) 
					VALUES (10, N'Aguascalientes');
INSERT [dbo].[State] ([idState], [Name]) 
					VALUES (15, N'Baja California');
INSERT [dbo].[State] ([idState], [Name]) 
					VALUES (3, N'Baja California Sur');
INSERT [dbo].[State] ([idState], [Name]) 
					VALUES (24, N'San Luis Potosi');
INSERT [dbo].[State] ([idState], [Name]) 
					VALUES (2, N'Estado de México');
					INSERT [dbo].[State] ([idState], [Name]) 
					VALUES (1, N'Ciudad de México');
SET IDENTITY_INSERT [dbo].[State] OFF;

/*INSERT DATA IN CAMPUS*/
GO
SET IDENTITY_INSERT [dbo].[Campus] ON;
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) 
						VALUES (1, N'Estadio Alfonso Lastras, Malaquita #1030,Valle Dorado', N'2021-05-13 09:00:00', 24);
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) 
						VALUES (2, N'Tecnologico,Av. Adolfo López Mateos #1801 Ote. Fracc. Bona Gens', N'2021-06-01 09:30:00', 1);
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) 
						VALUES (3, N'Tecnologico, Blvd. Insurgentes #18235', N'2021-10-01 09:30:00', 2);
SET IDENTITY_INSERT [dbo].[Campus] OFF;
/*INSERT DATA IN VACCINE*/
INSERT [dbo].[Vaccine] ([Name], [Dose])
					VALUES ( N'CanSino', N'1');
INSERT [dbo].[Vaccine] ([Name], [Dose])
					VALUES (  N'Pfizer', N'2');
INSERT [dbo].[Vaccine] ([Name], [Dose])
					VALUES ( N'Moderna', N'2');
					
/*INSERT DATA IN CITIZEN*/
INSERT [dbo].[Citizen] ([Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) 
				VALUES ( N'Ulises', N'Gomez', N'Antonio', N'20 DE NOVIEMBRE NO. 1081', N'6518353171', 30, 3, 1);
INSERT [dbo].[Citizen] ([Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) 
				VALUES (N'Diana', N'Mendez', N'Bautista', N'AV DANIEL SOTO 738', N'8465835317', 51, 1, 2);
INSERT [dbo].[Citizen] ([Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) 
				VALUES (N'Juan', N'Azuela', N'Sossa', N'AV. JESUS CARRANZA NO. 991', N'9215835317', 31, 2, 2);

/*INSERT DATA IN CITIZEN REPORT*/
INSERT [dbo].[Citizen report] ([idCitizen], [idCampus], [idVaccine], [Dose number], [Vaccination date]) 
					VALUES ( 1, 3, 1, 2, N'2021-05-15 09:30:00');
INSERT [dbo].[Citizen report] ([idCitizen], [idCampus], [idVaccine], [Dose number], [Vaccination date]) 
					VALUES ( 3, 2, 3, 1, N'2021-07-16 11:00:00');
INSERT [dbo].[Citizen report] ([idCitizen], [idCampus], [idVaccine], [Dose number], [Vaccination date]) 
					VALUES (2, 1, 2, 1, N'2021-06-25 19:30:00');

/*INSERT DATA IN PERSONNEL KEY*/
INSERT [dbo].[Personnel key] ([idPersonnel key], [Name]) 
							VALUES (100, N'Doctor');
INSERT [dbo].[Personnel key] ([idPersonnel key], [Name]) 
							VALUES (120, N'Nurse');
INSERT [dbo].[Personnel key] ([idPersonnel key], [Name]) 
							VALUES (230, N'Administrative');


/*INSERT DATA IN PERSONNEL*/
INSERT [dbo].[Personnel] ([Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) 
					VALUES (N'Jose',N'Dario',N'Betanzos' ,N'Pte. 112 4901, Panamericana' ,N'5613843001' ,100, 3);
INSERT [dbo].[Personnel] ([Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) 
					VALUES (N'Alfredo',N'Gonzalez',N'Gamez' ,N'C. Pablo García 166, Juan Escutia' ,N'5523252772' ,230, 2);
INSERT [dbo].[Personnel] ([Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) 
					VALUES (N'Carlos',N'Martinez',N'Miranda' ,N'San Eleuterio, Pedregal de Sta Úrsula' ,N'5561635969' ,120, 1);