USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[Address_Update]    Script Date: Tue  Mar  28 11:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Address_Update]
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
	@Id int	
AS

BEGIN

UPDATE [dbo].[Addresses]
SET
	[CompanyId]		= @CompanyId,
	[Date]			= @Date,
	[Address1]		= @Address1,
	[City]			= @City,
	[State]			= @State,
	[ZipCode]		= @ZipCode,
	[Latitude]		= @Latitude,
	[Longitude]		= @Longitude,
	[Slug]			= @Slug,
	[AddressType]	= @AddressType
WHERE Id = @Id

END

/*------------TEST CODE ---------------------

DECLARE  @CompanyId nvarchar(128) = 77777
		,@Date datetime = '2007-05-08 12:35:29.123'
		,@Address1 nvarchar(200) = '130 Newport Center Dr'
		,@Address2 nvarchar(200) = null
		,@City nvarchar(200) = 'Irvine'
		,@State nvarchar(2) = 'CA'
		,@ZipCode nvarchar(7) = 92660
		,@Latitude decimal(9, 6) = null
		,@Longitude decimal(9,6) = null
		,@Slug nvarchar(200) = 'what-is-slug'
		,@AddressType int = 1
		,@Id int = 2 /* change this value for testing !!! */

EXECUTE [dbo].[Address_Update]
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

SELECT *
FROM [dbo].[Addresses]

*/