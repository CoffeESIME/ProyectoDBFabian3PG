
USE [VaccinationVFabian]
GO
/*DATA TO INSERT TO TABLE STATE, HERE WE USE THE IDENTITY INSERT BECAUSE THE ID IS NOT IN ORDER */
/*IN THIS CASE WE NEED TO INSERT EXPLICITY THE IDSTATE IN ORDER TO CORRECT INSERTION OF DATA */
go
CREATE PROC InsertState
	@idsta tinyint,
	@name varchar(30)
	as
	begin
	if ((select COUNT(*) from [dbo].[State]  where [Name] like @name)=0)
		begin
			SET IDENTITY_INSERT [dbo].[State] ON;
			INSERT [dbo].[State] ([idState], [Name]) VALUES (@idsta, @name);
			SET IDENTITY_INSERT [dbo].[State] OFF;
		end
	else 
		begin
		print ' [!] Error, el registro ya existe en State'+@name;
		end
	end
GO
EXECUTE InsertState 10, N'Aguascalientes';
EXECUTE InsertState 15, N'Baja California';
EXECUTE InsertState 3, N'Baja California Sur';
EXECUTE InsertState 4, N'Campeche';
EXECUTE InsertState 5, N'Coahuila';
EXECUTE InsertState 6, N'Colima';
EXECUTE InsertState 7, N'Chiapas';
EXECUTE InsertState 8, N'Chihuahua';
EXECUTE InsertState 9, N'Durango';
EXECUTE InsertState 1, N'Ciudad de México';
EXECUTE InsertState 11, N'Guanajuato';
EXECUTE InsertState 12, N'Guerrero';
EXECUTE InsertState 13, N'Hidalgo';
EXECUTE InsertState 14, N'Jalisco';
EXECUTE InsertState 2, N'Estado de México';
/*HERE WE CHANGE THE PROPIERTY OF IDENTITY_INSERT TO OFF*/

GO 
/* INSERT VALUES WITHOUT THE USE OF IDENTITY_INSERT, AS WE CAN SEE WE NOW INSERT DATA WITHUOT THE IDSTATE*/
ALTER PROC InsertState
	@name varchar(30)
	as
	begin
	if ((select COUNT(*) from [dbo].[State]  where [Name] like @name)=0)
		begin
			INSERT [dbo].[State] ([Name]) VALUES  (@name);
		end
	else 
		begin
		print ' [!] Error, el registro ya existe en State'+@name;
		end
	end
GO
EXECUTE InsertState  N'Michoacan';
EXECUTE InsertState  N'Michoacan';
EXECUTE InsertState N'Morelos';
EXECUTE InsertState  N'Nayarit';
EXECUTE InsertState  N'Nuevo León';
EXECUTE InsertState  N'Oaxaca';
EXECUTE InsertState  N'Puebla';
EXECUTE InsertState  N'Querétaro';
EXECUTE InsertState  N'Quintana Roo';
EXECUTE InsertState  N'San Luis Potosi';
EXECUTE InsertState  N'Sinaloa';
EXECUTE InsertState  N'Sonora';
EXECUTE InsertState  N'TabaZco';
EXECUTE InsertState  N'TamaulipaZ';
EXECUTE InsertState  N'Tlaxcala';
EXECUTE InsertState  N'Veracruz';
EXECUTE InsertState  N'Yucatán';
EXECUTE InsertState  N'Sacatecas';

GO
CREATE PROC InsertCampus
@idcam tinyint,
@direc varchar(100),
@fecha smalldatetime,
@idsta tinyint
	as
	begin
		if ((select COUNT(*) from [dbo].[Campus]  where [Address] like @direc)=0)
			begin
				SET IDENTITY_INSERT [dbo].[Campus] ON;
				INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (@idcam, @direc,@fecha,@idsta);
				SET IDENTITY_INSERT [dbo].[Campus] OFF;
			end
		else 
			begin
			print ' [!] Error, el registro ya existe en Campus';
			end
	end
GO
EXECUTE InsertCampus 1, N'Estadio Alfonso Lastras, Malaquita #1030,Valle Dorado', N'2021-05-13 09:00:00', 24;
EXECUTE InsertCampus 2, N'Tecnologico,Av. Adolfo López Mateos #1801 Ote. Fracc. Bona Gens', N'2021-06-01 09:30:00', 1;
EXECUTE InsertCampus 3, N'Tecnologico, Blvd. Insurgentes #18235 Col. Libramiento', N'2021-10-01 09:30:00', 2;
EXECUTE InsertCampus 4, N'Unidad deportiva Crea, Blvd. Dolores #16841 Col. Parotas',N'2021-01-07 09:30:00', 12;

GO
ALTER PROC InsertCampus
@direc varchar(100),
@fecha smalldatetime,
@idsta tinyint
	as
	begin
		if ((select COUNT(*) from [dbo].[Campus]  where [Address] like @direc)=0)
			begin
				INSERT [dbo].[Campus] ([Address], [Date], [idState]) VALUES ( @direc,@fecha,@idsta);
			end
		else 
			begin
			print ' [!] Error, el registro ya existe en Campus';
			end
	end
GO
EXECUTE InsertCampus N'Centro Cultural Universitario, Av. Sierra Leona #550, Lomas 3ra sección', N'2021-05-13 09:00:00', 24;
EXECUTE InsertCampus N'Unidad Deportiva Salvador Escalante, El artesano #1030, Sta. Clara', N'2021-03-13 09:00:00', 16;
EXECUTE InsertCampus N'Domo del Parque de las Casitas, Carranza S/N, Chetumal',N'2021-07-13 09:00:00', 23;
EXECUTE InsertCampus N'Unidad Deportiva, Ignacio Ramirez S/N, Tepecoacuilco',N'2021-10-06 09:00:00', 24;
EXECUTE InsertCampus N'CECYTE Justo Sierra, Sierra del Sur #311, Solidaridad',N'2021-09-23 09:00:00', 26;


GO


CREATE PROC InsertVaccine
@nombre varchar(100),
@dosis tinyint
	as
	begin
		if ((select COUNT(*) from [dbo].[Vaccine]  where [Name] like @nombre)=0)
			begin
				INSERT [dbo].[Vaccine] ([Name], [Dose]) VALUES ( @nombre, @dosis);
			end
		else 
			begin
			print ' [!] Error, el registro ya existe en Vaccine';
			end
	end
GO
EXECUTE InsertVaccine N'CanSino', N'1';
EXECUTE InsertVaccine N'Pfizer', N'2';
EXECUTE InsertVaccine N'Moderna', N'2';
EXECUTE InsertVaccine N'Jonhson & Johnsons', N'1';
EXECUTE InsertVaccine N'Sinovac', N'2';
EXECUTE InsertVaccine N'Sputnik V', N'2';
EXECUTE InsertVaccine N'AztraZeneca', N'2';

GO
CREATE PROC InsertCitizen
@nombre varchar(30),
@ms   varchar(100),
@ps varchar(100),
@dir varchar(100),
@tel varchar(10),
@edad tinyint,
@idcam tinyint,
@idvac tinyint
	as
	begin
		if ((select COUNT(*) from [dbo].[Citizen]  where [Telephone number] = @tel)=0)
			begin
				INSERT [dbo].[Citizen] ([Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) 
				VALUES ( @nombre, @ms,@ps,@dir,@tel,@edad,@idcam,@idvac);
			end
		else 
			begin
			print ' [!] Error, el registro ya existe en Citizen';
			end
	end
	GO
EXECUTE InsertCitizen N'Ulises', N'Gomez', N'Antonio', N'20 DE NOVIEMBRE NO. 1081', N'6518353171', 30, 3, 2;
EXECUTE InsertCitizen N'Diana', N'Mendez', N'Bautista', N'AV DANIEL SOTO 738', N'8465835317', 51, 1, 2;
EXECUTE InsertCitizen N'Juan', N'Azuela', N'Sossa', N'AV. JESUS CARRANZA NO. 991', N'9215835317', 31, 5, 3;
EXECUTE InsertCitizen N'Fernanda', N'Cruz', N'Arroyo', N'CALLE MORELOS NO. 72-B', N'1672835317', 60, 3, 6;
EXECUTE InsertCitizen N'Araceli', N'Flores', N'Aguilar', N'CALLE OCAMPO NO 14, 752', N'5272435311', 29, 6, 5;
EXECUTE InsertCitizen N'Alejandro', N'Flores', N'Huerta', N'AV. 5 DE MAYO NO 1100-A', N'5271836312', 22, 1, 4;
EXECUTE InsertCitizen N'Danae', N'Garcia', N'Gil', N'BLVD. BENITO JUAREZ S / N', N'6272005319', 18, 5, 1;
EXECUTE InsertCitizen N'Erendira', N'Dominguez', N'Nava', N'CALLE MATAMOROS NO. 127', N'6200835355', 23, 2, 2;


EXECUTE InsertCitizen N'Keylor', N'Sandi', N'Nava', N'AV. INDEPENDENCIA NO. 241', N'7274535337', 59, 2, 2;
EXECUTE InsertCitizen N'Daniela', N'Lopez', N'Mendez', N'AV. 510 núm. 1000', N'6273695312', 46, 2, 2;
EXECUTE InsertCitizen N'Jose', N'García', N'Acundo', N'AV. NUEVA CASA DE MONEDA 133', N'7272625383', 36, 2, 2;

GO
CREATE PROC InsertCitzenRep
@idcit int,
@idcam tinyint,
@idvac tinyint,
@donu tinyint,
@vada smalldatetime
	as
	begin
		if ((select COUNT(*) from [dbo].[Citizen report]  where [idCitizen] like @idcit)=0)
			begin
				INSERT [dbo].[Citizen report] ([idCitizen], [idCampus], [idVaccine], [Dose number], [Vaccination date]) 
				VALUES ( @idcit,@idcam,@idvac,@donu,@vada);
			end
		else 
			begin
			print ' [!] Error, el registro ya existeen Citizen report';
			end
	end
GO
EXECUTE InsertCitzenRep 1, 3, 2, 2, N'2021-05-15 09:30:00';
EXECUTE InsertCitzenRep 3, 5, 3, 2, N'2021-07-16T11:00:00';
EXECUTE InsertCitzenRep 2, 1, 2, 2, N'2021-06-25T19:30:00';
EXECUTE InsertCitzenRep 5, 6, 5, 2, N'2021-08-03T20:00:00';
EXECUTE InsertCitzenRep 4, 3, 6, 2, N'2021-09-18T18:30:00' ;
EXECUTE InsertCitzenRep 6, 1, 4, 1, N'2021-07-19T15:00:00' ;
EXECUTE InsertCitzenRep 8, 4, 1, 1, N'2021-05-17T16:30:00';
EXECUTE InsertCitzenRep 7, 5, 1, 1, N'2021-08-04T14:00:00';


GO
CREATE PROC InsertPerKey
@pek tinyint,
@nom varchar(30)
	as
	begin
		if ((select COUNT(*) from [dbo].[Personnel key]  where [idPersonnel key] = @pek)=0)
			begin
				INSERT [dbo].[Personnel key] ([idPersonnel key], [Name]) 
				VALUES ( @pek,@nom);
			end
		else 
			begin
			print ' [!] Error, el registro ya existe en Personnel key';
			end
	end
GO
EXECUTE InsertPerKey 100, N'Doctor';
EXECUTE InsertPerKey 120, N'Nurse';
EXECUTE InsertPerKey 230, N'Administrative';
EXECUTE InsertPerKey 210, N'Promotor';
EXECUTE InsertPerKey 050, N'Seguridad';

GO
CREATE PROC InsertPer
@nom varchar(30),
@ms varchar(100),
@ps varchar(100),
@dir varchar(100),
@tel varchar(10),
@idper tinyint,
@idcam tinyint
	as
	begin
		if ((select COUNT(*) from [dbo].[Personnel]  where [Telephone number] = @tel)=0)
			begin
				INSERT [dbo].[Personnel] ([Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) 
				VALUES (@nom,@ms,@ps ,@dir ,@tel ,@idper, @idcam);
			end
		else 
			begin
			print ' [!] Error, el registro ya existe en Personnel';
			end
	end
GO
EXECUTE InsertPer N'Fabian', N'Romero', N'Hernández', N'FRATERNIDAD 14 SAN PABLO CHIMALPA', N'5530715158', 120, 1;
EXECUTE InsertPer N'Francisco', N'Calvo', N'Castro', N'AV. CENTRAL UNIDAD HABITACIONAL 13', N'5634213148', 210, 3;
EXECUTE InsertPer N'Ricardo', N'Barron', N'Fernández', N'AV. CONSTITUYENTES núm. 813', N'5527711337', 120, 5;
EXECUTE InsertPer N'Juan', N'Chimal', N'Eguía', N'CALLE ERMITA 3241', N'5525715153', 100, 6;
EXECUTE InsertPer N'Adrian', N'Martinez', N'Rivas', N'AV. DE LAS GRANJAS 618', N'5540613152', 210, 4;
EXECUTE InsertPer N'Nareli', N'Cruz', N'Cortes', N'MAR MEDITERRANEO 227', N'5580708159', 210, 5;
EXECUTE InsertPer N'Amadeo', N'Arguelles', N'Cruz', N'AV. DE LOS MAESTROS 217', N'5545415159', 100, 2;
EXECUTE InsertPer N'Elsa', N'Rubio', N'Espino', N'PASEO DE LAS JACARANDAS 196', N'5534765188', 100, 1;

GO

/*UPDATES FOR PERSONNEL*/
CREATE PROC UpdateTelPersbyInitName
@tel varchar(10),
@idcam tinyint,
@var nvarchar(10)
as
begin
 UPDATE [dbo].[Personnel]
   SET [Telephone number] = @tel
      ,[idCampus] = @idcam
 WHERE [Name] LIKE @var+'%'
end
GO
EXECUTE UpdateTelPersbyInitName '5568479525',4, 'EL';
GO

CREATE PROC UpdateTelPSPersbyEndMS
@tel varchar(10),
@ps varchar(50),
@var nvarchar(10)
as
begin
 UPDATE [dbo].[Personnel]
   SET [Telephone number] = @tel
      ,[Paternal surname] = @ps
 WHERE [Maternal surname] LIKE '%'+@var
end
GO
EXECUTE UpdateTelPSPersbyEndMS '5548730664','Acosta', 'lles';
GO

CREATE PROC UpdateTelMSPersbyBETPS
@tel varchar(10),
@ms varchar(50),
@var nvarchar(10)
as
begin
 UPDATE [dbo].[Personnel]
   SET [Telephone number] = @tel
      ,[Maternal surname] = @ms
 WHERE [Paternal surname] LIKE '%'+@var+'%'
end
GO
EXECUTE UpdateTelMSPersbyBETPS '5514990646','Zamudio','orte';

GO
/*UPDATES FOR PERSONNEL KEY*/
CREATE PROC UpdateProfname
@nn varchar(50),
@var nvarchar(10)
as
begin
 UPDATE [dbo].[Personnel key]
   SET [Name]=@nn
 WHERE [Name] LIKE '%'+@var+'%'
end

GO 
EXECUTE UpdateProfname 'Promoter','Promotor';
EXECUTE UpdateProfname 'Adm','Adm';
EXECUTE UpdateProfname 'Security','idad';

GO

/*UPDATES  FOR CITIZEN REPORT*/
GO

CREATE PROC UpdateCitiReport
@idcam tinyint,
@idvac tinyint,
@donu tinyint,
@varD nvarchar(20),
@varC nvarchar(10)
as
begin
 UPDATE [dbo].[Citizen report]
   SET [idCampus] = @idcam
      ,[idVaccine] = @idvac
      ,[Dose number] = @donu
 WHERE ([Vaccination date] <@varD AND @varC='<')
 OR ([Vaccination date] >@varD AND @varC='>')
 OR([Vaccination date] =@varD AND @varC='=')
end
GO
EXECUTE UpdateCitiReport 4,2,1,'2021-09-17','>';
EXECUTE UpdateCitiReport 6,4,1,'2021-05-16','<';
EXECUTE UpdateCitiReport 5,3,2,'2021-07-16 11:00:00','=';

GO

/*UPDATES  FOR CITIZEN*/
 go
CREATE PROC UpdateCitizen
@age tinyint,
@idcam tinyint,
@idvaccine tinyint,
@var nvarchar(10)
as
begin

 UPDATE [dbo].[Citizen]
   SET [Age] = @age
      ,[idCampus] = @idcam
      ,[idVaccine] = @idvaccine
 WHERE [Telephone number] LIKE @var+'%'

end
GO
EXECUTE UpdateCitizen 18,4, 3,'72745';
EXECUTE UpdateCitizen 18,4, 3,'62736';
EXECUTE UpdateCitizen 18,4, 3,'72726';

GO
CREATE PROC UpdateCamp
@dir varchar(100),
@fecha smalldatetime,
@varid tinyint
as
begin

 UPDATE [dbo].[Campus]
   SET [Address] = @dir
      ,[Date] = @fecha
 WHERE [idCampus]= @varid

end
GO
EXECUTE UpdateCamp 'Calle Gastón Melo 41','2021-03-07 13:30:00',1;
EXECUTE UpdateCamp 'Av. Taxqueña 1620','2021-05-17 21:30:00',3;
EXECUTE UpdateCamp 'Av. de los Maestros 217','2021-07-27 18:30:00',6;
GO
CREATE PROC UpdateState
@nom varchar(30),
@var nvarchar(10)
as
begin

 UPDATE [dbo].[State]
   SET [Name] = @nom
 WHERE [Name] LIKE '%'+@var+'%'
end
GO
EXECUTE UpdateState 'Zacatecas', 'cateca';
EXECUTE UpdateState 'Tabasco', 'abaZc';
EXECUTE UpdateState 'Tamaulipas', 'aulipa';

GO
CREATE PROC UpdateVacc
@nom varchar(30),
@var nvarchar(10)
as
begin

 UPDATE [dbo].[Vaccine]
   SET [Name] = @nom
 WHERE [Name] LIKE '%'+@var+'%'
end
GO
EXECUTE UpdateVacc 'Sput.V','utnik';
EXECUTE UpdateVacc 'J.J','Johnso';
EXECUTE UpdateVacc 'Cansino','anS';

/*DELETE PROCEDURES*/
GO
CREATE PROC DelState
@var nvarchar(10)
as
DELETE FROM [dbo].[State]
      WHERE [Name] LIKE '%'+@var+'%'
GO
EXECUTE DelState 'racru';
EXECUTE DelState 'ayar';
EXECUTE DelState 'ebl';
GO
CREATE PROC DelVacc
@var nvarchar(10)
as
begin 
BEGIN TRY
DELETE FROM [dbo].[Vaccine]
	WHERE [Name]=@var
	PRINT 'SE HA ELIMINADO CORRECTAMENTE'
END TRY
BEGIN CATCH 
PRINT 'NO SE PUEDE BORRAR EL ELEMENTO TIENE DEPENCIAS DE OTRAS TABLAS INTENTE CONFIGURAR PARA BORRADO EN CASCADA'
END CATCH 
end
GO
EXECUTE DelVacc 'Moderna';
EXECUTE DelVacc 'Sinovac';
EXECUTE DelVacc 'AztraZeneca';
GO
CREATE PROC DelPk
@var nvarchar(10)
as
begin 
BEGIN TRY
DELETE FROM [dbo].[Personnel key]
	WHERE [Name]=@var
	PRINT 'SE HA ELIMINADO CORRECTAMENTE'
END TRY
BEGIN CATCH 
PRINT 'NO SE PUEDE BORRAR EL ELEMENTO TIENE DEPENCIAS DE OTRAS TABLAS INTENTE CONFIGURAR PARA BORRADO EN CASCADA'
END CATCH 
end
GO
EXECUTE DelPk 'Adm';
EXECUTE DelPk 'Nurse';
EXECUTE DelPk 'Security';

GO
CREATE PROC DelPerso
@var nvarchar(10)
as
begin 
BEGIN TRY
DELETE FROM [dbo].[Personnel]
	WHERE [Name]=@var
	PRINT 'SE HA ELIMINADO CORRECTAMENTE'
END TRY
BEGIN CATCH 
PRINT 'NO SE PUEDE BORRAR EL ELEMENTO TIENE DEPENCIAS DE OTRAS TABLAS INTENTE CONFIGURAR PARA BORRADO EN CASCADA'
END CATCH 
end
GO
EXECUTE DelPerso 'Amadeo';
EXECUTE DelPerso 'Francisco';
EXECUTE DelPerso 'Adrian';
EXECUTE DelPerso 'Fabian';
/*DROP procedure*/
GO
CREATE PROC DelCitiRepo
@var tinyint
as
begin 
BEGIN TRY
DELETE FROM [dbo].[Citizen report]
	WHERE [idCitizen]=@var
	PRINT 'SE HA ELIMINADO CORRECTAMENTE'
END TRY
BEGIN CATCH 
PRINT 'NO SE PUEDE BORRAR EL ELEMENTO TIENE DEPENCIAS DE OTRAS TABLAS INTENTE CONFIGURAR PARA BORRADO EN CASCADA'
END CATCH 
end
GO
EXECUTE DelCitiRepo 7;
EXECUTE DelCitiRepo 6;
EXECUTE DelCitiRepo 3;
EXECUTE DelCitiRepo 1;
EXECUTE DelCitiRepo 2;
EXECUTE DelCitiRepo 4;
EXECUTE DelCitiRepo 8;
GO
CREATE PROC DelCitizen
@var tinyint
as
begin 
BEGIN TRY
DELETE FROM [dbo].[Citizen]
	WHERE [idCitizen]=@var
	PRINT 'SE HA ELIMINADO CORRECTAMENTE'
END TRY
BEGIN CATCH 
PRINT 'NO SE PUEDE BORRAR EL ELEMENTO TIENE DEPENCIAS DE OTRAS TABLAS INTENTE CONFIGURAR PARA BORRADO EN CASCADA'
END CATCH 
end
GO
EXECUTE DelCitizen 7;
EXECUTE DelCitizen 6;
EXECUTE DelCitizen 3;
EXECUTE DelCitizen 1;
EXECUTE DelCitizen 2;
EXECUTE DelCitizen 4;
EXECUTE DelCitizen 8;
GO
CREATE PROC DelCamp
@var tinyint
as
begin 
BEGIN TRY
DELETE FROM [dbo].[Campus]
	WHERE [idCampus]=@var
	PRINT 'SE HA ELIMINADO CORRECTAMENTE'
END TRY
BEGIN CATCH 
PRINT 'NO SE PUEDE BORRAR EL ELEMENTO TIENE DEPENCIAS DE OTRAS TABLAS INTENTE CONFIGURAR PARA BORRADO EN CASCADA'
END CATCH 
end
GO
EXECUTE DelCamp 3;
EXECUTE DelCamp 1;
EXECUTE DelCamp 2;

/*REINSERT DATA IN ORDER TO HAVE DATA ENOUGH TO MAKE VIEWS */


EXECUTE InsertState  N'Puebla';
EXECUTE InsertState  N'Veracruz';
EXECUTE InsertState  N'Nayarit';
GO
EXECUTE InsertCampus  N'Estadio Alfonso Lastras, Malaquita #1030,Valle Dorado', N'2021-05-13 09:00:00', 24;
EXECUTE InsertCampus  N'Tecnologico,Av. Adolfo López Mateos #1801 Ote. Fracc. Bona Gens', N'2021-06-01 09:30:00', 1;
EXECUTE InsertCampus  N'Tecnologico, Blvd. Insurgentes #18235 Col. Libramiento', N'2021-10-01 09:30:00', 2;

EXECUTE InsertCampus N'Unidad Deportiva Salvador Escalante, El artesano #1030, Sta. Clara', N'2021-03-13 09:00:00', 16;

GO

EXECUTE InsertVaccine N'Jonhson & Johnsons', N'1';

EXECUTE InsertVaccine N'Sputnik V', N'2';

GO
EXECUTE InsertCitizen N'Ulises', N'Gomez', N'Antonio', N'20 DE NOVIEMBRE NO. 1081', N'6518353171', 30, 6, 2;
EXECUTE InsertCitizen N'Diana', N'Mendez', N'Bautista', N'AV DANIEL SOTO 738', N'8465835317', 51, 10, 2;
EXECUTE InsertCitizen N'Juan', N'Azuela', N'Sossa', N'AV. JESUS CARRANZA NO. 991', N'9215835317', 31, 5, 3;
EXECUTE InsertCitizen N'Araceli', N'Flores', N'Aguilar', N'CALLE OCAMPO NO 14, 752', N'5272435311', 29, 6, 5;
EXECUTE InsertCitizen N'Alejandro', N'Flores', N'Huerta', N'AV. 5 DE MAYO NO 1100-A', N'5271836312', 22, 12, 4;
EXECUTE InsertCitizen N'Danae', N'Garcia', N'Gil', N'BLVD. BENITO JUAREZ S / N', N'6272005319', 18, 5, 1;
EXECUTE InsertCitizen N'Erendira', N'Dominguez', N'Nava', N'CALLE MATAMOROS NO. 127', N'6200835355', 23, 11, 1;

GO
EXECUTE InsertCitzenRep 10, 6, 2, 2, N'2021-05-15 09:30:00';
EXECUTE InsertCitzenRep 9, 5, 3, 2, N'2021-07-16T11:00:00';
EXECUTE InsertCitzenRep 11, 8, 2, 2, N'2021-06-25T19:30:00';
EXECUTE InsertCitzenRep 12, 10, 5, 2, N'2021-08-03T20:00:00';
EXECUTE InsertCitzenRep 13, 13, 6, 2, N'2021-09-18T18:30:00' ;
EXECUTE InsertCitzenRep 14, 9, 4, 1, N'2021-07-19T15:00:00' ;
EXECUTE InsertCitzenRep 15, 7, 1, 1, N'2021-05-17T16:30:00';

GO

EXECUTE InsertPerKey 230, N'Administrative';

EXECUTE InsertPerKey 050, N'Seguridad';
GO
EXECUTE InsertPer N'Fabian', N'Romero', N'Hernández', N'FRATERNIDAD 14 SAN PABLO CHIMALPA', N'5530715158', 120, 7;
EXECUTE InsertPer N'Francisco', N'Calvo', N'Castro', N'AV. CENTRAL UNIDAD HABITACIONAL 13', N'5634213148', 210, 10;

EXECUTE InsertPer N'Adrian', N'Martinez', N'Rivas', N'AV. DE LAS GRANJAS 618', N'5540613152', 210, 9;
EXECUTE InsertPer N'Nareli', N'Cruz', N'Cortes', N'MAR MEDITERRANEO 227', N'5580708159', 210, 4;
EXECUTE InsertPer N'Amadeo', N'Arguelles', N'Cruz', N'AV. DE LOS MAESTROS 217', N'5545415159', 100, 12;
EXECUTE InsertPer N'Elsa', N'Rubio', N'Espino', N'PASEO DE LAS JACARANDAS 196', N'5534765188', 100, 10;
GO

CREATE PROC SelecStatebyFL
@var nvarchar(1)
as
SELECT [idState],[Name] FROM [dbo].[State]
WHERE [Name] LIKE @var+'%'
GO
EXECUTE SelecStatebyFL 'A';
EXECUTE SelecStatebyFL 'B';
EXECUTE SelecStatebyFL 'C';

GO
CREATE PROC SelecStatebyName
@var nvarchar(30)
as
SELECT [idState],[Name]  FROM [dbo].[State]
WHERE [Name] =@var
GO
EXECUTE SelecStatebyName 'Nayarit';
EXECUTE SelecStatebyName 'Sonora';
EXECUTE SelecStatebyName 'Sinaloa';

GO
CREATE PROC SelecCambyStateName
@var nvarchar(30)
as
SELECT [Address]  FROM [dbo].[Campus]
WHERE [idState] =(SELECT [idState] FROM [dbo].[State]
					WHERE [Name] =@var)
GO

EXECUTE SelecCambyStateName 'San Luis Potosi';
EXECUTE SelecCambyStateName 'Estado de México';
EXECUTE SelecCambyStateName 'Michoacan';

GO
CREATE PROC SelecPersbyKeyName
@var nvarchar(30)
as
SELECT [Name],[Paternal surname],[Maternal surname]  FROM [dbo].[Personnel]
WHERE [idPersonnel key] =(SELECT [idPersonnel key] FROM [dbo].[Personnel key]
					WHERE [Name] =@var)
GO

EXECUTE SelecPersbyKeyName 'Doctor';
EXECUTE SelecPersbyKeyName 'Nurse';
EXECUTE SelecPersbyKeyName 'Promoter';
GO
CREATE PROC SelecProffByPersName
@var nvarchar(30)
as
SELECT [Name] FROM [dbo].[Personnel key]
WHERE [idPersonnel key] =(SELECT TOP 1 [idPersonnel key] FROM [dbo].[Personnel]
					WHERE [Name] =@var)
GO

EXECUTE SelecProffByPersName 'Ricardo';
EXECUTE SelecProffByPersName 'Elsa';
EXECUTE SelecProffByPersName 'Adrian';

GO
CREATE PROC SelecCitbyState
@var nvarchar(30),
@numoff tinyint
as
SELECT [Name],[Paternal surname],[Maternal surname] FROM [dbo].[Citizen]
WHERE [idCampus] =(  SELECT [idCampus] FROM [dbo].[Campus]
					WHERE [idState] = (SELECT [idState] FROM [dbo].[State] WHERE [Name]=@var ) ORDER BY [idstate] OFFSET @numoff ROWS FETCH NEXT 1 ROWS ONLY)
GO
EXECUTE SelecCitbyState 'San Luis Potosi',0;
EXECUTE SelecCitbyState 'San Luis Potosi',2 ;
EXECUTE SelecCitbyState 'Michoacan',0 ;

GO
CREATE PROC SelecCitRepoByNameCit
@varnam nvarchar(30),
@varPS nvarchar(30),
@varMS nvarchar(30)
as
SELECT [Dose number],[Vaccination date] FROM [dbo].[Citizen report]
WHERE [idCitizen] =(SELECT [idCitizen] FROM [dbo].[Citizen]
					WHERE [Name] =@varnam AND [Paternal surname]=@varPS AND [Maternal surname]=@varMS)
GO

EXECUTE SelecCitRepoByNameCit	'Araceli',	'Aguilar',	'Flores';
EXECUTE SelecCitRepoByNameCit	'Ulises','Antonio',	'Gomez'	;
EXECUTE SelecCitRepoByNameCit	 'Diana',	'Bautista', 'Mendez';	

GO
CREATE PROC SelecVaccByCitizen
@varnam nvarchar(30),
@varPS nvarchar(30),
@varMS nvarchar(30)
as
SELECT [Name] FROM [dbo].[Vaccine]
WHERE [idVaccine] =(SELECT [idVaccine] FROM [dbo].[Citizen]
					WHERE [Name] =@varnam AND [Paternal surname]=@varPS AND [Maternal surname]=@varMS)
GO

EXECUTE SelecVaccByCitizen 'Araceli',	'Aguilar',	'Flores';
EXECUTE SelecVaccByCitizen	'Ulises','Antonio',	'Gomez'	;
EXECUTE SelecVaccByCitizen 'Diana',	'Bautista', 'Mendez';




























































