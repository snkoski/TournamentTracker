SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spTeam_GetByTournament]
	@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT t.*
	FROM [dbo].[Teams] AS t
	INNER JOIN [TournamentEntries] ON [TournamentEntries].[TeamId] = t.id
	INNER JOIN [Tournaments] ON [Tournaments].[id] = [TournamentEntries].[TournamentId]
	WHERE [Tournaments].[id] = @TournamentId;
END
GO
