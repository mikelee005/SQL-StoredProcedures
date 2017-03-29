USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[Address_Insert]    Script Date: Tue  Mar  28 11:54:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Address_Insert]
	@CompanyId int,
	@Date datetime,
	@Address1 nvarchar(200),
	@City nvarchar(200),
	@State nvarchar(2),
	@ZipCode nvarchar(7),
	@Latitude decimal(9,6) = null,
	@Longitude decimal(9,6) = null,
	@Slug nvarchar(200) = null,
	@AddressType int,
	@Id int OUTPUT	
AS

BEGIN

INSERT INTO [dbo].[Addresses]
	([CompanyId]
	,[Date]
	,[Address1]
	,[City]
	,[State]
	,[ZipCode]
	,[Latitude]
	,[Longitude]
	,[Slug]
	,[AddressType])

VALUES
	(@CompanyId
	,@Date
	,@Address1
	,@City
	,@State
	,@ZipCode
	,@Latitude
	,@Longitude
	,@Slug
	,@AddressType)

SET @Id = SCOPE_IDENTITY()

END

/*------------TEST CODE ---------------------

DECLARE  @CompanyId nvarchar(128) = 12345
		,@Date datetime = getdate()
		,@Address1 nvarchar(200) = '130 Newport Center Dr'
		,@Address2 nvarchar(200) = null
		,@City nvarchar(200) = 'Newport Beach'
		,@State nvarchar(2) = 'CA'
		,@ZipCode nvarchar(7) = 92660
		,@Latitude decimal(9, 6) = 120.31
		,@Longitude decimal(9,6) = 130.42
		,@Slug nvarchar(200) = 'what-is-slug'
		,@AddressType int = 1
		,@Id int

EXECUTE [dbo].[Address_Insert]
		 @CompanyId
		,@Date
		,@Address1
		,@Address2
		,@City
		,@State
		,@ZipCode
		,@Latitude
		,@Longitude
		,@Slug
		,@AddressType
		,@Id

SELECT
		 [id]
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

*/