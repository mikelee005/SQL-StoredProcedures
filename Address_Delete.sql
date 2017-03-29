USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[Address_Delete]    Script Date: Tue  Mar  28 11:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Address_Delete]
	@Id int
AS

BEGIN

DELETE FROM [dbo].[Addresses]
WHERE Id = @Id

END

/*------------TEST CODE ---------------------

DECLARE @Id int = 6

EXECUTE [dbo].[Address_Delete]
	@Id

*/