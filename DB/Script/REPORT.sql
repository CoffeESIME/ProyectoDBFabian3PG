/* SELECT STATEMENTS WITH JOINS*/
USE VaccinationVFabian
go
/*#################################*/
/*#############
 / |
 | |
 |_|
#################*/
/*#################################*/
/*TABLE WITH CITIZEN AND THEIR VACCINE*/
CREATE VIEW VW_Citizen_Vaccine
AS
SELECT CR.idReport as [Numero Reporte], CI.[Name] as Nombre, CI.[Paternal surname] +' '+ CI.[Maternal surname] AS Apellidos, Va.[Name] as Vacuna
	FROM [dbo].[Citizen report] CR 
	INNER JOIN Citizen CI ON CR.idCitizen=CI.idCitizen 
	INNER JOIN Vaccine Va ON Va.[idVaccine]= CI.idVaccine

	GO
SELECT [Numero Reporte],Nombre, Apellidos FROM VW_Citizen_Vaccine
GO
/*#################################*/
/*##############
  ___ 
 |_  )
  / / 
 /___|
###################*/
/*#################################*/
/*NUMBER OF CAMPUS FOR EACH STATE*/
GO
CREATE VIEW VW_NumberCampus_ByState
AS
SELECT ES.[Name]as Estado, (SELECT COUNT(*) 
							FROM [Campus] Ca 
							WHERE ES.[idState]=Ca.idState) as [Cantidad de Campus] 
		FROM [State] ES
GO
SELECT Estado, [Cantidad de Campus] from VW_NumberCampus_ByState
/*Personnel, occupation and addres of campus, with State*/
GO
/*#################################*/
/*################
  ____
 |__ /
  |_ \
 |___/
#################*/
/*#################################*/
/*TABLE WITH Personnel AND THEIR DATA LIKE OCCUPATION, ADDRESS AND STATE*/
CREATE VIEW VW_Pers_GO_AddressWithState
AS
SELECT Per.[Name]+' '+Per.[Paternal surname]+' '+Per.[Maternal surname] as Nombre,PK.[Name] AS Ocupacion,Ca.[Address] as Direccion,Es.[Name] as Estado FROM Personnel Per 
																				INNER JOIN Campus Ca ON Per.idCampus=Ca.idCampus 
																				INNER JOIN [Personnel key] PK ON Per.[idPersonnel key]=PK.[idPersonnel key]
																				INNER JOIN [State] Es ON Es.idState=Ca.idState
GO
SELECT Nombre,Direccion,Estado FROM VW_Pers_GO_AddressWithState
GO
/*#################################*/
/*#############
  _ _  
 | | | 
 |_  _|
   |_| 
####################*/
/*#################################*/
/*TABLE WITH HOW MANY CITIZENS HAS A VACCINE ASSIGNED*/
CREATE VIEW VW_Ciudadanos_para_vacunar
as
SELECT Va.idVaccine as idVac,Va.[Name] AS NOMBRE,(SELECT COUNT(*) 
										FROM [Citizen] Cit 
										WHERE Va.[idVaccine]=Cit.idVaccine) as [Cantidad de Ciudadanos P/ Vac] 
		FROM Vaccine Va 
			WHERE (SELECT COUNT(*) 
					FROM [Citizen] Cit 
					WHERE Cit.[idVaccine]=Va.idVaccine)>0
GO
SELECT idVac,NOMBRE,[Cantidad de Ciudadanos P/ Vac] FROM VW_Ciudadanos_para_vacunar
GO
/*#################################*/
/*############
  ___ 
 | __|
 |__ \
 |___/
#####################*/
/*#############
TABLE SHOWING THE FULL NAME AND STATUS OF VACCINATION DOSES WHEN DOSES NEEDED IS EQUAL TO 1
####################*/
SELECT Cit.[Name]+' '+Cit.[Maternal surname]+' '+Cit.[Paternal surname] as Nombre, CASE WHEN CR.[Dose number]=2 THEN 'Vacunacion completa'
																					WHEN CR.[Dose number]=1 THEN 'Vacunacion incompleta'
																					END As [Estado Vacunacion]
						FROM Citizen Cit  
						INNER JOIN [Citizen report] CR ON CR.idCitizen=Cit.idCitizen
							WHERE CR.idVaccine NOT IN (SELECT Vac.idVaccine FROM Vaccine Vac WHERE Vac.Dose=1)
/*#################################*/
/*#############
   __ 
  / / 
 / _ \
 \___/
####################*/
/*####################
TABLE SHOWING THE FULL NAME AND STATUS OF VACCINATION DOSES WHEN DOSES NEEDED IS EQUAL TO 2
#############*/
SELECT Cit.[Name]+' '+Cit.[Maternal surname]+' '+Cit.[Paternal surname] As Nombre, CASE WHEN CR.[Dose number]=1 THEN 'Vacunacion completa'
																					WHEN CR.[Dose number]=0 THEN 'No ha recibido dosis'
																					END As [Estado Vacunacion]
				FROM Citizen Cit 
				INNER JOIN [Citizen report] CR ON CR.idCitizen=Cit.idCitizen
					WHERE CR.idVaccine IN (SELECT Vac.idVaccine FROM Vaccine Vac WHERE Vac.Dose=1)

/*#################################*/
/*###############
  ____ 
 |__  |
   / / 
  /_/ 
##################*/
/*##############
SELECTION OF CITIZEN WITH NUMBER, BOTH CITIZEN AND PERSONNEL, USING CAMPUS IDS
###################*/
GO
CREATE VIEW VW_Cit_Per_number
AS
SELECT CI.[Name]+' '+CI.[Maternal surname]+' '+CI.[Paternal surname] AS Nombre, CI.[Telephone number] AS TELEFONO  
				FROM Citizen CI 
				INNER JOIN Campus CA ON CI.idCampus=CA.idCampus 
					WHERE CA.idCampus=5
UNION 
SELECT PE.[Name]+' '+PE.[Maternal surname]+' '+PE.[Paternal surname]AS Nombre,PE.[Telephone number]  AS TELEFONO  
				FROM Campus CA
				INNER JOIN Personnel PE ON CA.idCampus=PE.idCampus 
					WHERE PE.idCampus=10
GO
SELECT Nombre, TELEFONO FROM VW_Cit_Per_number
GO
/*#################################*/
/*################
  ___ 
 ( _ )
 / _ \
 \___/
#################*/
/*###############
AVERAGE NUMBER OF CITIZENS WHO HAVE VACCINE ASSIGNED USING THE NAME OF THE VACCINES
##################*/
SELECT AVG([Cantidad de Ciudadanos P/ Vac] ) as [Promedio Personas c/ Vacuna asignada] 
			FROM VW_Ciudadanos_para_vacunar 
			WHERE NOMBRE IN ('Cansino', 'Moderna')
/*#################################*/
/*##############
  ___ 
 / _ \
 \_, /
  /_/ 
###################*/
/*#############
FUNCTION TO SEPARATE STRINGS USING A SIMBOL
####################*/
GO
CREATE FUNCTION [dbo].SEPARADOR(@Palabra varchar(100),@deli char(1),@add int)
	RETURNS VARCHAR(200) AS
	BEGIN 
	DECLARE @NewPal varchar(200)='';
	DECLARE @Count INT= 1;
	WHILE @Count<LEN(@Palabra) BEGIN
		if LEN(@Palabra)-@add>@Count
			begin
				SET @NewPal+=SUBSTRING(@Palabra,@Count,@add) +@deli;
			end
		else
			begin
				SET @NewPal+=SUBSTRING(@Palabra,@Count,@add);
			end
		SET @Count+=@add;
	END
	RETURN @NewPal
END 
GO
/*###########
EXAMPLE OF USING THE FUNCTION SEPARADOR TO MAKE THE TELEPHONE NUMBER NOW SEPARATED BY 2 DIGITS
######################*/
SELECT Nombre, [dbo].SEPARADOR(TELEFONO,'-',2) FROM VW_Cit_Per_number
/*#################################*/
/*#################################*/
/*#################################*/
GO
/*#################################*/
/*##############
  _  __  
 / |/  \ 
 | | () |
 |_|\__/ 
###################*/
/*############
NUMBER OF CITIZENS THAT HAVE AT LEAST ONE VACCINATION
#####################*/
CREATE VIEW VW_Cit_C_Vac
as
SELECT VA.[Name],COUNT(CR.[Dose number]) as [Cit C/Vac]  
	FROM [Citizen report] CR 
	RIGHT JOIN Vaccine VA ON VA.idVaccine=CR.idVaccine 
	GROUP BY VA.[Name]
GO
SELECT VW_CCV.[Name], VW_CCV.[Cit C/Vac] 
	FROM VW_Cit_C_Vac VW_CCV 
	WHERE VW_CCV.[Cit C/Vac]>0;
/*#################################*/
/*#############
  _   _ 
 / | / |
 | | | |
 |_| |_|
        
####################*/
/*###############
NUMBER OF CITIZENS WHO HAVE BEEN VACCINATED AT LEAST ONCE AND NUMBER OF DOSES OF A VACCINE
##################*/
GO
CREATE VIEW VW_Vac_Dosis
as
SELECT VA.[Name],SUM(CR.[Dose number]) AS [Cant Dosis aplicadas] 
	FROM [Citizen report] CR 
	INNER JOIN Vaccine VA ON VA.idVaccine=CR.idVaccine 
	GROUP BY VA.[Name]
go

SELECT VW_C.[Name],VW_V.[Cant Dosis aplicadas],VW_C.[Cit C/Vac] 
		FROM VW_Cit_C_Vac VW_C 
		INNER JOIN VW_Vac_Dosis VW_V ON VW_C.[Name]=VW_V.[Name];

/*
*/
GO
/*#################################*/
/*############
  _   ___ 
 / | |_  )
 | |  / / 
 |_| /___|
#####################*/
/*##############
TABLE WITH CITIZEN'S IDENTITY, DATE OF VACCINATION AND ADDRESS BETWEEN 2 DATES ORDER BY DATE
###################*/

CREATE VIEW Nom_vac_address
as
SELECT CI.[Name] as Nombre,CI.[Paternal surname] as Apellido,CR.[Vaccination date] AS [Fecha de vacunacion],CA.[Address] as Direccion 
		FROM [Citizen report] CR 
		INNER JOIN Citizen CI ON  CI.idCitizen=CR.idCitizen 
		INNER JOIN Campus CA ON CA.idCampus=CR.idCampus
		WHERE CR.[Vaccination date] BETWEEN
		'2021-06-17 16:30:00' AND '2021-08-03 20:00:00'
		
	GO
SELECT NVA.Nombre,NVA.Apellido,NVA.[Fecha de vacunacion],NVA.Direccion FROM Nom_vac_address NVA ORDER BY NVA.[Fecha de vacunacion]

/*#################################*/
/*#############
  _   ____
 / | |__ /
 | |  |_ \
 |_| |___/
####################*/
/*#################
TABLE SHOWING THE STATE OF THE REPUBLIC AND ITS NUMBER OF VACCINATED CITIZENS
################*/
GO
CREATE VIEW VW_Num_Per_idCampus
as
	SELECT CA.idState AS idState,COUNT(CI.[Name]) AS NumPers 
		FROM  Campus CA 
		LEFT JOIN Citizen CI ON CA.idCampus=CI.idCampus  
		LEFT JOIN Personnel PE ON PE.idCampus=CA.idCampus 
		GROUP BY CA.idState
GO
SELECT ST.[Name] as Nombre, ISNULL( VW_NP.NumPers,0) AS NumPers FROM VW_Num_Per_idCampus VW_NP 
								RIGHT JOIN [State] ST ON ST.idState=VW_NP.idState
/*#################################*/
/*#############
  _   _ _  
 / | | | | 
 | | |_  _|
 |_|   |_| 
####################*/
/*#############
TABLE SHOWING THE STATE OF THE REPUBLIC AND ITS NUMBER OF VACCINATED CITIZENS GREATER THAN 0 AND NOT IN SOME STATES
####################*/
GO
SELECT VW_NP.idState , ST.[Name], VW_NP.NumPers FROM VW_Num_Per_idCampus VW_NP 
								RIGHT JOIN [State] ST ON ST.idState=VW_NP.idState 
								WHERE (VW_NP.NumPers IS NOT NULL) AND 
								(VW_NP.NumPers>0) AND ST.[Name] 
								NOT IN ('Guerrero','Michoacan')
								ORDER BY ST.[Name] 
/*#################################*/
/*#################################*/
/*#################################*/

/*#################################*/
/*##############
  _   ___ 
 / | | __|
 | | |__ \
 |_| |___/
###################*/
/*################
TABLE SHOWING THE STATE OF THE REPUBLIC WITH ITS RESPECTIVE VACCINES
#################*/
GO
CREATE VIEW VW_VAC_CAM
AS
SELECT DISTINCT(VA.[Name]) AS VACUNA,CA.idState FROM Vaccine VA 
							INNER JOIN Citizen CI ON VA.idVaccine=CI.idVaccine 
							INNER JOIN Campus CA ON CA.idCampus=CI.idCampus 
							
GO
SELECT ST.[Name], isnull(VW_VC.VACUNA,'No se ha asigando vacuna') AS VACUNA FROM VW_VAC_CAM VW_VC 
							RIGHT JOIN [State] ST ON ST.idState=VW_VC.idState







