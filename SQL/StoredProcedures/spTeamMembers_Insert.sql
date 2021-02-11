SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTeamMembers_Insert]
	@TeamId int,
	@PersonId int,
	@id int = 0 output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[TeamMembers] (TeamId, PersonId)
	VALUES (@TeamId, @PersonId);

	SELECT @id = SCOPE_IDENTITY(); 
END
GO
