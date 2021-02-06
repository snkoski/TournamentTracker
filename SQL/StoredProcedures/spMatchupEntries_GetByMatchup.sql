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
CREATE PROCEDURE [dbo].[spMatchupEntries_GetByMatchup]
	@MatchupId int
AS
BEGIN

	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[MatchupEntries]
	WHERE [MatchupEntries].[MatchupId] = @MatchupId;

END
GO
