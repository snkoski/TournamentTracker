USE [Tournaments]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPrizes_GetByTournament]
	@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT p.*
	FROM dbo.Prizes p
	INNER JOIN dbo.TournamentPrizes t on p.id = t.PrizeId
	WHERE t.TournamentId = @TournamentId;

END
GO
