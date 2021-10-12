/* SELECT STATEMENTS WITH JOINS*/
USE VaccinationVFabian
go
/*TABLE WITH CITIZEN AND THEIR VACCINE*/
CREATE VIEW Persona_y_vacuna
AS
SELECT CR.idReport as [Numero Reporte], CI.[Name] as Nombre, CI.[Paternal surname] +' '+ CI.[Maternal surname] AS Apellidos, Va.[Name] as Vacuna
	FROM [dbo].[Citizen report] CR INNER JOIN Citizen CI 
	ON CR.idCitizen=CI.idCitizen INNER JOIN Vaccine Va ON Va.[idVaccine]= CI.idVaccine

	GO
SELECT [Numero Reporte],Nombre, Apellidos FROM Persona_y_vacuna
GO
/*NUMBER OF CAMPUS FOR EACH STATE*/
SELECT ES.[Name], (SELECT COUNT(*) FROM [Campus] Ca WHERE ES.[idState]=Ca.idState) as [Cantidad de Campus]  FROM [State] ES

/**/