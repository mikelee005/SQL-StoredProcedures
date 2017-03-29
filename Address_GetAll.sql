USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[Address_GetAll]    Script Date: Tue  Mar  28 11:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Address_GetAll]
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

END

/*------------TEST CODE ---------------------

EXECUTE [dbo].[Address_GetAll]
*/