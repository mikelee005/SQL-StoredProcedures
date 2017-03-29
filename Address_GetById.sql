USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[Address_GetById]    Script Date: Tue  Mar  28 11:54:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Address_GetById]
	@id int
AS

BEGIN

SELECT
	 [Id]
	,[CompanyId]
	,[Date]
	,[Address1]
	,[City]
	,[State]
	,[ZipCode]
	,[Latitude]
	,[Longitude]
	,[Slug]
	,[AddressType]
FROM [dbo].[Addresses]
WHERE Id = @id

END

/*------------TEST CODE ---------------------

DECLARE @Id int = 2

EXECUTE [dbo].[Address_GetById]
	@id

*/