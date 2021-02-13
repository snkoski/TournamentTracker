SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spTournaments_Insert]
	@TournamentName nvarchar(100),
	@EntryFee money,
	@id int = 0 output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[Tournaments] (TournamentName, EntryFee, Active)
	VALUES (@TournamentName, @EntryFee, 1);

	SELECT @id = SCOPE_IDENTITY();
END
GO