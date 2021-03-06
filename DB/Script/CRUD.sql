
USE [VaccinationVFabian]
GO

/*#################################*/
/*###############
  ___                  _        _        _         ___                                 
 |_ _|_ _  ___ ___ _ _| |_   __| |_ __ _| |_ ___  | _ \_ _ ___  __ ___ __ _  _ _ _ ___ 
  | || ' \(_-</ -_) '_|  _| (_-<  _/ _` |  _/ -_) |  _/ '_/ _ \/ _/ -_) _| || | '_/ -_)
 |___|_||_/__/\___|_|  \__| /__/\__\__,_|\__\___| |_| |_| \___/\__\___\__|\_,_|_| \___|
##################*/
/*##############
USING IDENTITY_INSERT
###################*/
CREATE PROC InsertState
	@idsta tinyint,
	@name varchar(30)
	as
	begin
	if ((select COUNT(*) from [dbo].[State]  where [Name] like @name)=0)
		BEGIN TRY
			SET IDENTITY_INSERT [dbo].[State] ON;
				INSERT [dbo].[State] ([idState], [Name]) 
					VALUES (@idsta, @name);
			SET IDENTITY_INSERT [dbo].[State] OFF;
		PRINT 'The data has been inserted correctly'+@name
			END TRY
			BEGIN CATCH
				PRINT 'There is an error in the data'+@name
			END CATCH
		else 
			begin
				print ' [!] Error the record is already in State'+@name
			end
	end
GO
/*#################################*/
/*#################################*/
/*#################################*/
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
/*#################################*/
/*#################################*/
/*#################################*/

GO 
/*#################################*/
/*#################################*/
/*#################################*/
/* INSERT VALUES WITHOUT THE USE OF IDENTITY_INSERT, AS WE CAN SEE WE NOW INSERT DATA WITHUOT THE IDSTATE*/
ALTER PROC InsertState
	@name varchar(30)
	as
	begin
	if ((select COUNT(*) from [dbo].[State]  where [Name] like @name)=0)
		BEGIN TRY
			INSERT [dbo].[State] ([Name]) 
				VALUES  (@name);
				PRINT 'The data has been inserted correctly'+@name
			END TRY
			BEGIN CATCH
				PRINT 'There is an error in the data'+@name
			END CATCH
		else 
			begin
				print ' [!] Error the record is already in Citizen State'+@name
			end
	end
GO
/*#################################*/
/*#################################*/
/*#################################*/
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
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*############
  ___                  _      ___                           ___                                 
 |_ _|_ _  ___ ___ _ _| |_   / __|__ _ _ __  _ __ _  _ ___ | _ \_ _ ___  __ ___ __ _  _ _ _ ___ 
  | || ' \(_-</ -_) '_|  _| | (__/ _` | '  \| '_ \ || (_-< |  _/ '_/ _ \/ _/ -_) _| || | '_/ -_)
 |___|_||_/__/\___|_|  \__|  \___\__,_|_|_|_| .__/\_,_/__/ |_| |_| \___/\__\___\__|\_,_|_| \___|
#####################*/
/*#############
USING IDENTITY_INSERT
####################*/
CREATE PROC InsertCampus
@idcam tinyint,
@direc varchar(100),
@fecha smalldatetime,
@idsta tinyint
	as
	begin
		if ((select COUNT(*) from [dbo].[Campus]  where [Address] like @direc)=0)
			BEGIN TRY
				SET IDENTITY_INSERT [dbo].[Campus] ON;
					INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) 
						VALUES (@idcam, @direc,@fecha,@idsta);
				SET IDENTITY_INSERT [dbo].[Campus] OFF;
				PRINT 'The data has been inserted correctly'+@direc
			END TRY
			BEGIN CATCH
				PRINT 'There is an error in the data'+@direc
			END CATCH
		else 
			begin
				print ' [!] Error the record is already in Campus'+@direc
			end
	end
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE InsertCampus 1, N'Estadio Alfonso Lastras, Malaquita #1030,Valle Dorado', N'2021-05-13 09:00:00', 24;
EXECUTE InsertCampus 2, N'Tecnologico,Av. Adolfo López Mateos #1801 Ote. Fracc. Bona Gens', N'2021-06-01 09:30:00', 1;
EXECUTE InsertCampus 3, N'Tecnologico, Blvd. Insurgentes #18235 Col. Libramiento', N'2021-10-01 09:30:00', 2;
EXECUTE InsertCampus 4, N'Unidad deportiva Crea, Blvd. Dolores #16841 Col. Parotas',N'2021-01-07 09:30:00', 12;
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
WITHOUT IDENTITY_INSERT
##################*/
/*#################################*/
ALTER PROC InsertCampus
@direc varchar(100),
@fecha smalldatetime,
@idsta tinyint
	as
	begin
		if ((select COUNT(*) from [dbo].[Campus]  where [Address] like @direc)=0)
			BEGIN TRY
				INSERT [dbo].[Campus] ([Address], [Date], [idState]) 
					VALUES ( @direc,@fecha,@idsta);
			PRINT 'The data has been inserted correctly'+@direc
			END TRY
			BEGIN CATCH
				PRINT 'There is an error in the data'+@direc
			END CATCH
		else 
			begin
				print ' [!] Error the record is already in Campus'+@direc
			end
	end
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE InsertCampus N'Centro Cultural Universitario, Av. Sierra Leona #550, Lomas 3ra sección', N'2021-05-13 09:00:00', 24;
EXECUTE InsertCampus N'Unidad Deportiva Salvador Escalante, El artesano #1030, Sta. Clara', N'2021-03-13 09:00:00', 16;
EXECUTE InsertCampus N'Domo del Parque de las Casitas, Carranza S/N, Chetumal',N'2021-07-13 09:00:00', 23;
EXECUTE InsertCampus N'Unidad Deportiva, Ignacio Ramirez S/N, Tepecoacuilco',N'2021-10-06 09:00:00', 24;
EXECUTE InsertCampus N'CECYTE Justo Sierra, Sierra del Sur #311, Solidaridad',N'2021-09-23 09:00:00', 26;

/*#################################*/
/*#################################*/
/*#################################*/
GO

/*#################################*/
/*################
  ___                  _    __   __          _            ___                                 
 |_ _|_ _  ___ ___ _ _| |_  \ \ / /_ _ __ __(_)_ _  ___  | _ \_ _ ___  __ ___ __ _  _ _ _ ___ 
  | || ' \(_-</ -_) '_|  _|  \ V / _` / _/ _| | ' \/ -_) |  _/ '_/ _ \/ _/ -_) _| || | '_/ -_)
 |___|_||_/__/\___|_|  \__|   \_/\__,_\__\__|_|_||_\___| |_| |_| \___/\__\___\__|\_,_|_| \___|
#################*/
/*#################################*/
CREATE PROC InsertVaccine
@nombre varchar(100),
@dosis tinyint
	as
	begin
		if ((select COUNT(*) from [dbo].[Vaccine]  where [Name] like @nombre)=0)
			BEGIN TRY
				INSERT [dbo].[Vaccine] ([Name], [Dose])
					VALUES ( @nombre, @dosis);
			PRINT 'The data has been inserted correctly'+@nombre
			END TRY
			BEGIN CATCH
				PRINT 'There is an error in the data'+@nombre
			END CATCH
		else 
			begin
				print ' [!] Error the record is already in Vaccine'+@nombre
			end
	end
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE InsertVaccine N'Jonhson & Johnsons', N'1';
EXECUTE InsertVaccine N'Sinovac', N'2';
EXECUTE InsertVaccine N'Sputnik V', N'2';
EXECUTE InsertVaccine N'AztraZeneca', N'2';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
  ___                  _      ___ _ _   _               ___                                 
 |_ _|_ _  ___ ___ _ _| |_   / __(_) |_(_)______ _ _   | _ \_ _ ___  __ ___ __ _  _ _ _ ___ 
  | || ' \(_-</ -_) '_|  _| | (__| |  _| |_ / -_) ' \  |  _/ '_/ _ \/ _/ -_) _| || | '_/ -_)
 |___|_||_/__/\___|_|  \__|  \___|_|\__|_/__\___|_||_| |_| |_| \___/\__\___\__|\_,_|_| \___|
##################*/
/*#################################*/
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
			BEGIN TRY
				INSERT [dbo].[Citizen] ([Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) 
				VALUES ( @nombre, @ms,@ps,@dir,@tel,@edad,@idcam,@idvac);
			PRINT 'The data has been inserted correctly'+@nombre+','+ @ms+','+@ps+','+@dir+','+@tel
			END TRY
			BEGIN CATCH
				PRINT 'There is an error in the data'+@nombre+','+ @ms+','+@ps+','+@dir+','+@tel
			END CATCH
		else 
			begin
				print ' [!] Error the record is already in Citizen'+@nombre+','+ @ms+','+@ps+','+@dir+','+@tel
			end
	end
	GO
	/*#################################*/
/*#################################*/
/*#################################*/

EXECUTE InsertCitizen N'Fernanda', N'Cruz', N'Arroyo', N'CALLE MORELOS NO. 72-B', N'1672835317', 60, 3, 6;
EXECUTE InsertCitizen N'Araceli', N'Flores', N'Aguilar', N'CALLE OCAMPO NO 14, 752', N'5272435311', 29, 6, 5;
EXECUTE InsertCitizen N'Alejandro', N'Flores', N'Huerta', N'AV. 5 DE MAYO NO 1100-A', N'5271836312', 22, 1, 4;
EXECUTE InsertCitizen N'Danae', N'Garcia', N'Gil', N'BLVD. BENITO JUAREZ S / N', N'6272005319', 18, 5, 1;
EXECUTE InsertCitizen N'Erendira', N'Dominguez', N'Nava', N'CALLE MATAMOROS NO. 127', N'6200835355', 23, 2, 2;


EXECUTE InsertCitizen N'Keylor', N'Sandi', N'Nava', N'AV. INDEPENDENCIA NO. 241', N'7274535337', 59, 2, 3;
EXECUTE InsertCitizen N'Daniela', N'Lopez', N'Mendez', N'AV. 510 núm. 1000', N'6273695312', 46, 2, 3;
EXECUTE InsertCitizen N'Jose', N'García', N'Acundo', N'AV. NUEVA CASA DE MONEDA 133', N'7272625383', 36, 2, 2;
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################
  ___                  _      ___ _ _   _               ___                   _     ___                                 
 |_ _|_ _  ___ ___ _ _| |_   / __(_) |_(_)______ _ _   | _ \___ _ __  ___ _ _| |_  | _ \_ _ ___  __ ___ __ _  _ _ _ ___ 
  | || ' \(_-</ -_) '_|  _| | (__| |  _| |_ / -_) ' \  |   / -_) '_ \/ _ \ '_|  _| |  _/ '_/ _ \/ _/ -_) _| || | '_/ -_)
 |___|_||_/__/\___|_|  \__|  \___|_|\__|_/__\___|_||_| |_|_\___| .__/\___/_|  \__| |_| |_| \___/\__\___\__|\_,_|_| \___|
################*/
/*#################################*/
CREATE PROC InsertCitzenRep
@idcit int,
@idcam tinyint,
@idvac tinyint,
@donu tinyint,
@vada smalldatetime
	as
	begin
		if ((select COUNT(*) from [dbo].[Citizen report]  where [idCitizen] like @idcit)=0)
			BEGIN TRY
				INSERT [dbo].[Citizen report] ([idCitizen], [idCampus], [idVaccine], [Dose number], [Vaccination date]) 
					VALUES ( @idcit,@idcam,@idvac,@donu,@vada);
			PRINT 'The data has been inserted correctly IN Citizen report'
			END TRY
			BEGIN CATCH
				PRINT 'There is an error in the data, Citizen report'
			END CATCH
		else 
			begin
				print ' [!] Error the record is already in Citizen report'
			end
	end
GO
/*#################################*/
/*#################################*/
/*#################################*/

EXECUTE InsertCitzenRep 5, 6, 5, 2, N'2021-08-03 20:00:00';
EXECUTE InsertCitzenRep 4, 3, 6, 2, N'2021-09-18 18:30:00' ;
EXECUTE InsertCitzenRep 6, 1, 4, 1, N'2021-07-19 15:00:00' ;
EXECUTE InsertCitzenRep 8, 4, 1, 1, N'2021-05-17 16:30:00';
EXECUTE InsertCitzenRep 7, 5, 1, 1, N'2021-08-04 14:00:00';

/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*################
  ___                  _     ___                               _   _              ___                                 
 |_ _|_ _  ___ ___ _ _| |_  | _ \___ _ _ ___ ___ _ _  _ _  ___| | | |_____ _  _  | _ \_ _ ___  __ ___ __ _  _ _ _ ___ 
  | || ' \(_-</ -_) '_|  _| |  _/ -_) '_(_-</ _ \ ' \| ' \/ -_) | | / / -_) || | |  _/ '_/ _ \/ _/ -_) _| || | '_/ -_)
 |___|_||_/__/\___|_|  \__| |_| \___|_| /__/\___/_||_|_||_\___|_| |_\_\___|\_, | |_| |_| \___/\__\___\__|\_,_|_| \___|
                                                                           |__/                                       
#################*/
/*#################################*/
CREATE PROC InsertPerKey
@pek tinyint,
@nom varchar(30)
	as
	begin
		if ((select COUNT(*) from [dbo].[Personnel key]  where [idPersonnel key] = @pek)=0)
			BEGIN TRY
				INSERT [dbo].[Personnel key] ([idPersonnel key], [Name]) 
					VALUES ( @pek,@nom);
				PRINT 'The data has been inserted correctly'+@nom
			END TRY
			BEGIN CATCH
				PRINT 'There is an error in the data'+@nom
			END CATCH
		else 
			begin
				PRINT ' [!] Error the record is already in Personnel key'+@nom;
			end
	end
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE InsertPerKey 210, N'Promotor';
EXECUTE InsertPerKey 050, N'Security';
EXECUTE InsertPerKey 060, N'Guard';
EXECUTE InsertPerKey 130, N'Susana Distancia';
EXECUTE InsertPerKey 140, N'Pandemio';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
  ___                  _     ___                               _   ___                                 
 |_ _|_ _  ___ ___ _ _| |_  | _ \___ _ _ ___ ___ _ _  _ _  ___| | | _ \_ _ ___  __ ___ __ _  _ _ _ ___ 
  | || ' \(_-</ -_) '_|  _| |  _/ -_) '_(_-</ _ \ ' \| ' \/ -_) | |  _/ '_/ _ \/ _/ -_) _| || | '_/ -_)
 |___|_||_/__/\___|_|  \__| |_| \___|_| /__/\___/_||_|_||_\___|_| |_| |_| \___/\__\___\__|\_,_|_| \___|
##################*/
/*#################################*/
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
			BEGIN TRY
				INSERT [dbo].[Personnel] ([Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) 
					VALUES (@nom,@ms,@ps ,@dir ,@tel ,@idper, @idcam);
				PRINT 'The data has been inserted correctly'+@nom+','+@ms+','+@ps+','+@dir +','+@tel
			END TRY
			BEGIN CATCH
				PRINT 'There is an error in the data'+@nom+','+@ms+','+@ps+','+@dir +','+@tel
			END CATCH
		else 
			begin
				PRINT ' [!] Error the record is already in Personnel'+@nom+','+@ms+','+@ps+','+@dir +','+@tel
			end
	end
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE InsertPer N'Fabian', N'Romero', N'Hernández', N'FRATERNIDAD 14 SAN PABLO CHIMALPA', N'5530715158', 120, 1;
EXECUTE InsertPer N'Francisco', N'Calvo', N'Castro', N'AV. CENTRAL UNIDAD HABITACIONAL 13', N'5634213148', 210, 3;
EXECUTE InsertPer N'Ricardo', N'Barron', N'Fernández', N'AV. CONSTITUYENTES núm. 813', N'5527711337', 120, 5;
EXECUTE InsertPer N'Juan', N'Chimal', N'Eguía', N'CALLE ERMITA 3241', N'5525715153', 100, 6;
EXECUTE InsertPer N'Adrian', N'Martinez', N'Rivas', N'AV. DE LAS GRANJAS 618', N'5540613152', 210, 4;
EXECUTE InsertPer N'Nareli', N'Cruz', N'Cortes', N'MAR MEDITERRANEO 227', N'5580708159', 210, 5;
EXECUTE InsertPer N'Amadeo', N'Arguelles', N'Cruz', N'AV. DE LOS MAESTROS 217', N'5545415159', 100, 2;
EXECUTE InsertPer N'Elsa', N'Rubio', N'Espino', N'PASEO DE LAS JACARANDAS 196', N'5534765188', 100, 1;
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*##############
  _   _          _      _         ___                               _   ___                    _              
 | | | |_ __  __| |__ _| |_ ___  | _ \___ _ _ ___ ___ _ _  _ _  ___| | | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |_| | '_ \/ _` / _` |  _/ -_) |  _/ -_) '_(_-</ _ \ ' \| ' \/ -_) | |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
  \___/| .__/\__,_\__,_|\__\___| |_| \___|_| /__/\___/_||_|_||_\___|_| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
       |_|      
###################*/
/*#################################*/
/*UPDATES FOR PERSONNEL*/
CREATE PROC UpdateTelPersbyInitName
@tel varchar(10),
@idcam tinyint,
@var nvarchar(10)
as
begin
	BEGIN TRY
	UPDATE [dbo].[Personnel]
	   SET [Telephone number] = @tel
		  ,[idCampus] = @idcam
		WHERE [Name] LIKE @var+'%'
	  	PRINT 'Successfully updated, using'+' '+@tel+' and '+@var
	END TRY
	BEGIN CATCH 
		PRINT 'Data could not be updated using' +' '+@tel+' and '+@var+ 'possible dependency modification' 
	END CATCH

end
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE UpdateTelPersbyInitName '5568479525',4, 'EL';
GO
/*#################################*/
/*#################################*/
/*#################################*/
CREATE PROC UpdateTelPSPersbyEndMS
@tel varchar(10),
@ps varchar(50),
@var nvarchar(10)
as
begin
	BEGIN TRY
	 UPDATE [dbo].[Personnel]
	   SET [Telephone number] = @tel
		  ,[Paternal surname] = @ps
		WHERE [Maternal surname] LIKE '%'+@var
	  	PRINT 'Successfully updated, using'+' '+@tel+','+@ps+' and '+@var
	END TRY
	BEGIN CATCH 
		PRINT 'Data could not be updated using' +' '+@tel+','+@ps+' and '+@var+ 'possible dependency modification' 
	END CATCH


end
GO
EXECUTE UpdateTelPSPersbyEndMS '5548730664','Acosta', 'lles';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
CREATE PROC UpdateTelMSPersbyBETPS
@tel varchar(10),
@ms varchar(50),
@var nvarchar(10)
as
begin
	BEGIN TRY
	 UPDATE [dbo].[Personnel]
	   SET [Telephone number] = @tel
		  ,[Maternal surname] = @ms
		 WHERE [Paternal surname] LIKE '%'+@var+'%'
	  	PRINT 'Successfully updated, using'+' '+@tel+','+@ms+' and '+@var
	END TRY
	BEGIN CATCH 
		PRINT 'Data could not be updated using' +' '+@tel+','+@ms+' and '+@var+ 'possible dependency modification' 
	END CATCH

end
GO
EXECUTE UpdateTelMSPersbyBETPS '5514990646','Zamudio','orte';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
  _   _          _      _         ___                               _   _              ___                    _              
 | | | |_ __  __| |__ _| |_ ___  | _ \___ _ _ ___ ___ _ _  _ _  ___| | | |_____ _  _  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |_| | '_ \/ _` / _` |  _/ -_) |  _/ -_) '_(_-</ _ \ ' \| ' \/ -_) | | / / -_) || | |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
  \___/| .__/\__,_\__,_|\__\___| |_| \___|_| /__/\___/_||_|_||_\___|_| |_\_\___|\_, | |_| |_| \___/\__\___\__,_|\_,_|_| \___|
       |_|                                                                      |__/             
##################*/
/*#################################*/
/*UPDATES FOR PERSONNEL KEY*/
CREATE PROC UpdateProfname
@nn varchar(50),
@var nvarchar(10)
as
begin
	BEGIN TRY
	 UPDATE [dbo].[Personnel key]
	   SET [Name]=@nn
		 WHERE [Name] LIKE '%'+@var+'%'
	  	PRINT 'Successfully updated, using'+' '+@nn+','+' and '+@var
	END TRY
	BEGIN CATCH 
		PRINT 'Data could not be updated using' +' '+@nn+','+' and '+@var+ 'possible dependency modification' 
	END CATCH

end

GO 
EXECUTE UpdateProfname 'Promoter','Promotor';
EXECUTE UpdateProfname 'Adm','Adm';
EXECUTE UpdateProfname 'Security','idad';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#############
  _   _          _      _          ___ _ _   _               ___                   _     ___                    _              
 | | | |_ __  __| |__ _| |_ ___   / __(_) |_(_)______ _ _   | _ \___ _ __  ___ _ _| |_  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |_| | '_ \/ _` / _` |  _/ -_) | (__| |  _| |_ / -_) ' \  |   / -_) '_ \/ _ \ '_|  _| |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
  \___/| .__/\__,_\__,_|\__\___|  \___|_|\__|_/__\___|_||_| |_|_\___| .__/\___/_|  \__| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
       |_|                                                          |_|       
####################*/
/*#################################*/
/*UPDATES  FOR CITIZEN REPORT*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
CREATE PROC UpdateCitiReport
@idcam tinyint,
@idvac tinyint,
@donu tinyint,
@varD nvarchar(20),
@varC nvarchar(10)
as
begin
	BEGIN TRY
	 UPDATE [dbo].[Citizen report]
	   SET [idCampus] = @idcam
		  ,[idVaccine] = @idvac
		  ,[Dose number] = @donu
		 WHERE ([Vaccination date] <@varD AND @varC='<')
			OR ([Vaccination date] >@varD AND @varC='>')
			OR([Vaccination date] =@varD AND @varC='=')
	  	PRINT 'Successfully updated, using'+@varD+' and '+@varC
	END TRY
	BEGIN CATCH 
		PRINT 'Data could not be updated using'+@varD+' and '+@varC+ 'possible dependency modification or bad simbol' 
	END CATCH

end
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE UpdateCitiReport 4,2,1,'2021-09-17','>';
EXECUTE UpdateCitiReport 6,4,1,'2021-05-16','<';
EXECUTE UpdateCitiReport 11,3,1,'2021-07-16 11:00:00','=';
EXECUTE UpdateCitiReport 10,3,1,'2021-05-15 09:30:00','='; 
/*#################################*/
/*#################################*/
/*##############
  _   _          _      _          ___ _ _   _               ___                    _              
 | | | |_ __  __| |__ _| |_ ___   / __(_) |_(_)______ _ _   | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |_| | '_ \/ _` / _` |  _/ -_) | (__| |  _| |_ / -_) ' \  |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
  \___/| .__/\__,_\__,_|\__\___|  \___|_|\__|_/__\___|_||_| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
       |_|                                                                                       
###################*/
GO

/*UPDATES  FOR CITIZEN*/
 go
 /*#################################*/
/*#################################*/
/*#################################*/
CREATE PROC UpdateCitizen
@age tinyint,
@idcam tinyint,
@idvaccine tinyint,
@var nvarchar(10)
as
begin
	BEGIN TRY
	 UPDATE [dbo].[Citizen]
	   SET [Age] = @age
		  ,[idCampus] = @idcam
		  ,[idVaccine] = @idvaccine
		 WHERE [Telephone number] LIKE @var+'%'
	  	PRINT 'Successfully updated, using'+@var
	END TRY
	BEGIN CATCH 
		PRINT 'Data could not be updated using' +@var+ 'possible dependency modification' 
	END CATCH


end
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE UpdateCitizen 18,4, 3,'72745';
EXECUTE UpdateCitizen 18,4, 3,'62736';
EXECUTE UpdateCitizen 18,4, 3,'72726';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
  _   _          _      _          ___                           ___                    _              
 | | | |_ __  __| |__ _| |_ ___   / __|__ _ _ __  _ __ _  _ ___ | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |_| | '_ \/ _` / _` |  _/ -_) | (__/ _` | '  \| '_ \ || (_-< |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
  \___/| .__/\__,_\__,_|\__\___|  \___\__,_|_|_|_| .__/\_,_/__/ |_| |_| \___/\__\___\__,_|\_,_|_| \___|
       |_|                                       |_|                                         
##################*/
/*#################################*/
CREATE PROC UpdateCamp
@dir varchar(100),
@fecha smalldatetime,
@varid tinyint
as
begin
	BEGIN TRY
	 UPDATE [dbo].[Campus]
	   SET [Address] = @dir
		  ,[Date] = @fecha
		WHERE [idCampus]= @varid
	  	PRINT 'Successfully updated, using'+' '+@dir
	END TRY
	BEGIN CATCH 
		PRINT 'Data could not be updated using' +' '+@dir+ 'possible dependency modification' 
	END CATCH
end
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE UpdateCamp 'Calle Gastón Melo 41','2021-03-07 13:30:00',1;
EXECUTE UpdateCamp 'Av. Taxqueña 1620','2021-05-17 21:30:00',3;
EXECUTE UpdateCamp 'Av. de los Maestros 217','2021-07-27 18:30:00',6;
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*##############
  _   _          _      _         ___ _        _         ___                    _              
 | | | |_ __  __| |__ _| |_ ___  / __| |_ __ _| |_ ___  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |_| | '_ \/ _` / _` |  _/ -_) \__ \  _/ _` |  _/ -_) |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
  \___/| .__/\__,_\__,_|\__\___| |___/\__\__,_|\__\___| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
       |_|                                                                                   
###################*/
CREATE PROC UpdateState
@nom varchar(30),
@var nvarchar(10)
as
begin
	BEGIN TRY
	 UPDATE [dbo].[State]
	   SET [Name] = @nom
		WHERE [Name] LIKE '%'+@var+'%'
	  	PRINT 'Successfully updated, using'+' '+@var+' and '+@nom
	END TRY
	BEGIN CATCH 
		PRINT 'Data could not be updated using' +' '+@var+','+@nom+' '+ 'possible dependency modification' 
	END CATCH


end
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE UpdateState 'Zacatecas', 'cateca';
EXECUTE UpdateState 'Tabasco', 'abaZc';
EXECUTE UpdateState 'Tamaulipas', 'aulipa';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*################
  _   _          _      _        __   __          _            ___                    _              
 | | | |_ __  __| |__ _| |_ ___  \ \ / /_ _ __ __(_)_ _  ___  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |_| | '_ \/ _` / _` |  _/ -_)  \ V / _` / _/ _| | ' \/ -_) |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
  \___/| .__/\__,_\__,_|\__\___|   \_/\__,_\__\__|_|_||_\___| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
       |_|                                                                                         
#################*/
/*#################################*/
CREATE PROC UpdateVacc
@nom varchar(30),
@var nvarchar(10)
as
begin
	BEGIN TRY
		UPDATE [dbo].[Vaccine]
			SET [Name] = @nom
				WHERE [Name] LIKE '%'+@var+'%'
	  	PRINT 'Successfully updated, using'+' '+@var+' and '+@nom
	END TRY
	BEGIN CATCH 
		PRINT 'Data could not be updated using' +' '+@var+','+@nom+' '+ 'possible dependency modification' 
	END CATCH

end
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE UpdateVacc 'Sput.V','utnik';
EXECUTE UpdateVacc 'J.J','Johnso';
EXECUTE UpdateVacc 'Cansino','anS';
/*#################################*/
/*#################################*/
/*#################################*/
/*DELETE PROCEDURES*/
GO
/*#################################*/
/*##############
  ___      _     _         ___ _        _         ___                    _              
 |   \ ___| |___| |_ ___  / __| |_ __ _| |_ ___  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |) / -_) / -_)  _/ -_) \__ \  _/ _` |  _/ -_) |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___|\__\___| |___/\__\__,_|\__\___| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
###################*/
/*#################################*/
CREATE PROC DelState
@var nvarchar(10)
as
BEGIN
	BEGIN TRY
		DELETE FROM [dbo].[State]
			WHERE [Name] LIKE '%'+@var+'%'
	  	PRINT 'The element has been successfully deleted'+' '+@var
	END TRY
	BEGIN CATCH 
		PRINT 'The element cannot be deleted' +' '+@var+' '+'has dependencies, try cascading delete'
	END CATCH
END
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE DelState 'racru';
EXECUTE DelState 'ayar';
EXECUTE DelState 'ebl';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*################
  ___      _     _        __   __          _            ___                    _              
 |   \ ___| |___| |_ ___  \ \ / /_ _ __ __(_)_ _  ___  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |) / -_) / -_)  _/ -_)  \ V / _` / _/ _| | ' \/ -_) |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___|\__\___|   \_/\__,_\__\__|_|_||_\___| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
#################*/
/*#################################*/
CREATE PROC DelVacc
@var nvarchar(10)
as
begin 
	BEGIN TRY
		DELETE FROM [dbo].[Vaccine]
			WHERE [Name]=@var
		PRINT 'The element has been successfully deleted'+' '+@var
	END TRY
	BEGIN CATCH 
		PRINT 'The element cannot be deleted' +' '+@var+' '+'has dependencies, try cascading delete'
	END CATCH 
end
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE DelVacc 'Moderna';
EXECUTE DelVacc 'Sinovac';
EXECUTE DelVacc 'AztraZeneca';
/*#################################*/
/*################
  ___      _     _         ___                               _   _              ___                    _              
 |   \ ___| |___| |_ ___  | _ \___ _ _ ___ ___ _ _  _ _  ___| | | |_____ _  _  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |) / -_) / -_)  _/ -_) |  _/ -_) '_(_-</ _ \ ' \| ' \/ -_) | | / / -_) || | |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___|\__\___| |_| \___|_| /__/\___/_||_|_||_\___|_| |_\_\___|\_, | |_| |_| \___/\__\___\__,_|\_,_|_| \___|
                                                                         |__/                                      
#################*/
/*#################################*/
GO
CREATE PROC DelPk
@var nvarchar(10)
as
begin 
	BEGIN TRY
		DELETE FROM [dbo].[Personnel key]
			WHERE [Name]=@var
		PRINT 'The element has been successfully deleted'+' '+@var
	END TRY
	BEGIN CATCH 
		PRINT 'The element cannot be deleted' +' '+@var+' '+'has dependencies, try cascading delete'
	END CATCH 
end
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE DelPk 'Adm';
EXECUTE DelPk 'Nurse';
EXECUTE DelPk 'Security';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*################
  ___      _     _         ___                               _   ___                    _              
 |   \ ___| |___| |_ ___  | _ \___ _ _ ___ ___ _ _  _ _  ___| | | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |) / -_) / -_)  _/ -_) |  _/ -_) '_(_-</ _ \ ' \| ' \/ -_) | |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___|\__\___| |_| \___|_| /__/\___/_||_|_||_\___|_| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
#################*/
/*#################################*/
CREATE PROC DelPerso
@var nvarchar(10)
as
begin 
	BEGIN TRY
		DELETE FROM [dbo].[Personnel]
			WHERE [Name]=@var
		PRINT 'The element has been successfully deleted'+' '+@var
	END TRY
	BEGIN CATCH 
		PRINT 'The element cannot be deleted' +' '+@var+' '+'has dependencies, try cascading delete'
	END CATCH 
end
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE DelPerso 'Amadeo';
EXECUTE DelPerso 'Francisco';
EXECUTE DelPerso 'Adrian';
EXECUTE DelPerso 'Fabian';
/*#################################*/
/*##############
  ___      _     _          ___ _ _   _               ___                   _     ___                    _              
 |   \ ___| |___| |_ ___   / __(_) |_(_)______ _ _   | _ \___ _ __  ___ _ _| |_  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |) / -_) / -_)  _/ -_) | (__| |  _| |_ / -_) ' \  |   / -_) '_ \/ _ \ '_|  _| |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___|\__\___|  \___|_|\__|_/__\___|_||_| |_|_\___| .__/\___/_|  \__| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
                                                             |_|                                                 
###################*/
/*#################################*/
GO
CREATE PROC DelCitiRepo
@var tinyint
as
begin 
	BEGIN TRY
		DELETE FROM [dbo].[Citizen report]
			WHERE [idCitizen]=@var
		PRINT 'The element has been successfully deleted'
	END TRY
	BEGIN CATCH 
		PRINT 'The element cannot be deleted,has dependencies, try cascading delete'
	END CATCH 
end
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE DelCitiRepo 7;
EXECUTE DelCitiRepo 6;
EXECUTE DelCitiRepo 3;
EXECUTE DelCitiRepo 1;
EXECUTE DelCitiRepo 2;
EXECUTE DelCitiRepo 4;
EXECUTE DelCitiRepo 8;
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
  ___      _     _          ___ _ _   _               ___                    _              
 |   \ ___| |___| |_ ___   / __(_) |_(_)______ _ _   | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |) / -_) / -_)  _/ -_) | (__| |  _| |_ / -_) ' \  |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___|\__\___|  \___|_|\__|_/__\___|_||_| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
##################*/
/*#################################*/
CREATE PROC DelCitizen
@var tinyint
as
begin 
	BEGIN TRY
		DELETE FROM [dbo].[Citizen]
			WHERE [idCitizen]=@var
		PRINT 'The element has been successfully deleted'
	END TRY
	BEGIN CATCH 
		PRINT 'The element cannot be deleted,has dependencies, try cascading delete'
	END CATCH 
end
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE DelCitizen 7;
EXECUTE DelCitizen 6;
EXECUTE DelCitizen 3;
EXECUTE DelCitizen 1;
EXECUTE DelCitizen 2;
EXECUTE DelCitizen 4;
EXECUTE DelCitizen 8;
/*#################################*/
/*################
  ___      _     _          ___                           ___                    _              
 |   \ ___| |___| |_ ___   / __|__ _ _ __  _ __ _  _ ___ | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 | |) / -_) / -_)  _/ -_) | (__/ _` | '  \| '_ \ || (_-< |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___|\__\___|  \___\__,_|_|_|_| .__/\_,_/__/ |_| |_| \___/\__\___\__,_|\_,_|_| \___|
                                          |_|                                              
#################*/
/*#################################*/
GO
CREATE PROC DelCamp
@var tinyint
as
begin 
	BEGIN TRY
		DELETE FROM [dbo].[Campus]
			WHERE [idCampus]=@var
		PRINT 'The element has been successfully deleted'
	END TRY
	BEGIN CATCH 
		PRINT 'The element cannot be deleted,has dependencies, try cascading delete'
	END CATCH 
end
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE DelCamp 3;
EXECUTE DelCamp 1;
EXECUTE DelCamp 2;
/*#################################*/
/*#################################*/
/*#################################*/
/*REINSERT DATA IN ORDER TO HAVE DATA ENOUGH TO MAKE VIEWS */

/*#################################*/
/*################
  ___     _                  _     ___       _        
 | _ \___(_)_ _  ___ ___ _ _| |_  |   \ __ _| |_ __ _ 
 |   / -_) | ' \(_-</ -_) '_|  _| | |) / _` |  _/ _` |
 |_|_\___|_|_||_/__/\___|_|  \__| |___/\__,_|\__\__,_|
                                                      
#################*/
/*#################################*/
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
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
  ___      _        _     ___ _        _         ___                    _              
 / __| ___| |___ __| |_  / __| |_ __ _| |_ ___  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 \__ \/ -_) / -_) _|  _| \__ \  _/ _` |  _/ -_) |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___\__|\__| |___/\__\__,_|\__\___| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
                                                                                       
##################*/
/*#################################*/
CREATE PROC SelecStatebyFL
@var nvarchar(1)
as
	BEGIN TRY
		SELECT [idState] as Id,[Name] as Estado FROM [dbo].[State]
			WHERE [Name] LIKE @var+'%'
	END TRY
	BEGIN CATCH 
		PRINT 'An error has occurred using'+''+@var+', check the values and if the table  State exists'
	END CATCH 
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE SelecStatebyFL 'A';
EXECUTE SelecStatebyFL 'B';
EXECUTE SelecStatebyFL 'C';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
CREATE PROC SelecStatebyName
@var nvarchar(30)
as
	BEGIN TRY
		SELECT [idState] as Id,[Name] as Estado  FROM [dbo].[State]
			WHERE [Name] =@var
	END TRY
	BEGIN CATCH 
		PRINT 'An error has occurred using'+''+@var+', check the values and if the table  State exists'
	END CATCH 
	/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE SelecStatebyName 'Nayarit';
EXECUTE SelecStatebyName 'Sonora';
EXECUTE SelecStatebyName 'Sinaloa';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*################
  ___      _        _      ___                           ___                    _              
 / __| ___| |___ __| |_   / __|__ _ _ __  _ __ _  _ ___ | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 \__ \/ -_) / -_) _|  _| | (__/ _` | '  \| '_ \ || (_-< |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___\__|\__|  \___\__,_|_|_|_| .__/\_,_/__/ |_| |_| \___/\__\___\__,_|\_,_|_| \___|
                                         |_|                                                 
#################*/
/*#################################*/
CREATE PROC SelecCambyStateName
@var nvarchar(30)
as
	BEGIN TRY
		SELECT [Address] as Direccion FROM [dbo].[Campus]
			WHERE [idState] =(SELECT [idState] FROM [dbo].[State]
							WHERE [Name] =@var)
	END TRY
	BEGIN CATCH 
		PRINT 'An error has occurred using'+''+@var+', check the values and if the table Campus or State exists'
	END CATCH 
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE SelecCambyStateName 'San Luis Potosi';
EXECUTE SelecCambyStateName 'Estado de México';
EXECUTE SelecCambyStateName 'Guerrero';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
  ___      _        _     ___                               _   ___                    _              
 / __| ___| |___ __| |_  | _ \___ _ _ ___ ___ _ _  _ _  ___| | | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 \__ \/ -_) / -_) _|  _| |  _/ -_) '_(_-</ _ \ ' \| ' \/ -_) | |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___\__|\__| |_| \___|_| /__/\___/_||_|_||_\___|_| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
##################*/
/*#################################*/
CREATE PROC SelecPersbyKeyName
@var nvarchar(30)
as
	BEGIN TRY
		SELECT [Name],[Paternal surname],[Maternal surname]  FROM [dbo].[Personnel]
			WHERE [idPersonnel key] =(SELECT [idPersonnel key] FROM [dbo].[Personnel key]
									WHERE [Name] =@var)
	END TRY
	BEGIN CATCH 
		PRINT 'An error has occurred using'+''+@var+', check the values and if the table Personnel or Personnel key exists'
	END CATCH 
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE SelecPersbyKeyName 'Doctor';
EXECUTE SelecPersbyKeyName 'Nurse';
EXECUTE SelecPersbyKeyName 'Promoter';
GO
CREATE PROC SelecProffByPersName
@var nvarchar(30)
as
	BEGIN TRY
		SELECT [Name] as Profesion FROM [dbo].[Personnel key]
			WHERE [idPersonnel key] =(SELECT TOP 1 [idPersonnel key] FROM [dbo].[Personnel]
									WHERE [Name] =@var)
	END TRY
	BEGIN CATCH 
		PRINT 'An error has occurred using'+''+@var+', check the values and if the table Vaccione or Citizen report exists'
	END CATCH 
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE SelecProffByPersName 'Ricardo';
EXECUTE SelecProffByPersName 'Elsa';
EXECUTE SelecProffByPersName 'Adrian';
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
  ___      _        _      ___ _ _   _               ___                    _              
 / __| ___| |___ __| |_   / __(_) |_(_)______ _ _   | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 \__ \/ -_) / -_) _|  _| | (__| |  _| |_ / -_) ' \  |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___\__|\__|  \___|_|\__|_/__\___|_||_| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
##################*/
/*#################################*/
CREATE PROC SelecCitbyState
@var nvarchar(30),
@numoff tinyint
as
	BEGIN TRY
		SELECT [Name] +' '+[Paternal surname]+' '+[Maternal surname] as Nombre FROM [dbo].[Citizen]
			WHERE [idCampus] =(  SELECT [idCampus] FROM [dbo].[Campus]
								WHERE [idState] = (SELECT [idState] FROM [dbo].[State] 
													WHERE [Name]=@var ) ORDER BY [idstate] OFFSET @numoff ROWS FETCH NEXT 1 ROWS ONLY)
	END TRY
	BEGIN CATCH 
		PRINT 'An error has occurred using'+''+@var+', check the values and if the table State,Campus or Citizen report exists'
	END CATCH 
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE SelecCitbyState 'Estado de México',1;
EXECUTE SelecCitbyState 'San Luis Potosi',1 ;
EXECUTE SelecCitbyState 'Guerrero',0 ;
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
  ___      _        _      ___ _ _   _               ___                   _     ___                    _              
 / __| ___| |___ __| |_   / __(_) |_(_)______ _ _   | _ \___ _ __  ___ _ _| |_  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 \__ \/ -_) / -_) _|  _| | (__| |  _| |_ / -_) ' \  |   / -_) '_ \/ _ \ '_|  _| |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___\__|\__|  \___|_|\__|_/__\___|_||_| |_|_\___| .__/\___/_|  \__| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
                                                            |_|                                                      
##################*/
/*#################################*/
CREATE PROC SelecCitRepoByNameCit
@varnam nvarchar(30),
@varPS nvarchar(30),
@varMS nvarchar(30)
as
	BEGIN TRY
		SELECT [Dose number] as Dosis,[Vaccination date] as Fecha FROM [dbo].[Citizen report]
			WHERE [idCitizen] =(SELECT [idCitizen] FROM [dbo].[Citizen]
								WHERE [Name] =@varnam AND [Paternal surname]=@varPS AND [Maternal surname]=@varMS)
	END TRY
	BEGIN CATCH 
		PRINT 'An error has occurred using'+''+@varnam+@varPS+@varMS+' '+', check the values and if the table Citizen or Citizen report exists'
	END CATCH 
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE SelecCitRepoByNameCit	'Keylor',	'Nava',	'Sandi';
EXECUTE SelecCitRepoByNameCit	'Jose','Acundo',	'García';
EXECUTE SelecCitRepoByNameCit	 'Juan',	'Sossa', 'Azuela';	
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*###############
  ___      _        _    __   __          _            ___                    _              
 / __| ___| |___ __| |_  \ \ / /_ _ __ __(_)_ _  ___  | _ \_ _ ___  __ ___ __| |_  _ _ _ ___ 
 \__ \/ -_) / -_) _|  _|  \ V / _` / _/ _| | ' \/ -_) |  _/ '_/ _ \/ _/ -_) _` | || | '_/ -_)
 |___/\___|_\___\__|\__|   \_/\__,_\__\__|_|_||_\___| |_| |_| \___/\__\___\__,_|\_,_|_| \___|
                                                                                                                                                                                  
##################*/
/*#################################*/
CREATE PROC SelecVaccByCitizen
@varnam nvarchar(30),
@varPS nvarchar(30),
@varMS nvarchar(30)
as
begin 
	BEGIN TRY
			SELECT [Name] as Vacuna FROM [dbo].[Vaccine]
				WHERE [idVaccine] =(SELECT [idVaccine] FROM [dbo].[Citizen]
										WHERE [Name] =@varnam AND [Paternal surname]=@varPS AND [Maternal surname]=@varMS)
	END TRY
	BEGIN CATCH 
		PRINT 'An error has occurred using'+''+@varnam+@varPS+@varMS+' '+', check the values and if the table Vaccione or Citizen exists'
	END CATCH 
end
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*#################################*/
/*#################################*/
EXECUTE SelecVaccByCitizen 'Keylor',	'Nava',	'Sandi';
EXECUTE SelecVaccByCitizen	'Jose','Acundo',	'García'	;
EXECUTE SelecVaccByCitizen 'Diana',	'Bautista', 'Mendez';
/*#################################*/
/*#################################*/
/*#################################*/
