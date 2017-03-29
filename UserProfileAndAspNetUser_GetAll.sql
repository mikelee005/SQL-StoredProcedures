USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[UserProfileAndAspNetUser_GetAll]    Script Date: Tue  Mar  28 11:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[UserProfileAndAspNetUser_GetAll]

AS

BEGIN

SELECT 

	 [AspNetUsers].[Id]
	,[AspNetUsers].[Email]
	,[AspNetUsers].[LockoutEndDateUtc]
	,[AspNetUsers].[LockoutEnabled]
	,[UserProfile].[firstName]
	,[UserProfile].[lastName]
	,[UserProfile].[companyId]
	,[UserProfile].[phoneNumber]
	,[UserProfile].[mediaId]
	,[AspNetUserRoles].[RoleId]
	,[AspNetRoles].[Name]
	,[Media].[url]

FROM [dbo].[AspNetUsers]

INNER JOIN [dbo].[UserProfile]
ON AspNetUsers.Id = UserProfile.userId
LEFT JOIN [dbo].[AspNetUserRoles]
ON AspNetUsers.Id = AspNetUserRoles.UserId
LEFT JOIN [dbo].[AspNetRoles]
ON AspNetUserRoles.RoleId = AspNetRoles.Id
LEFT JOIN [dbo].[Media]
ON UserProfile.mediaId = Media.id	   

END

/*-------------TEST CODE -------------------



EXECUTE [dbo].[UserProfileAndAspNetUser_GetAll]


*/