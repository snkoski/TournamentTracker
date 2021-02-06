USE [Tournaments]
GO

ALTER TABLE [dbo].[MatchupEntries] DROP CONSTRAINT [FK_MatchupEntries_Teams]
GO

ALTER TABLE [dbo].[MatchupEntries] DROP CONSTRAINT [FK_MatchupEntries_ParentMatchups]
GO

ALTER TABLE [dbo].[MatchupEntries] DROP CONSTRAINT [FK_MatchupEntries_Matchups]
GO

/****** Object:  Table [dbo].[MatchupEntries]    Script Date: 2/5/2021 7:27:43 PM ******/
DROP TABLE [dbo].[MatchupEntries]
GO

/****** Object:  Table [dbo].[MatchupEntries]    Script Date: 2/5/2021 7:27:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MatchupEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MatchupId] [int] NOT NULL,
	[ParentMatchupId] [int] NULL,
	[TeamCompetingId] [int] NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_MatchupEntries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_Matchups] FOREIGN KEY([MatchupId])
REFERENCES [dbo].[Matchups] ([id])
GO

ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_Matchups]
GO

ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_ParentMatchups] FOREIGN KEY([ParentMatchupId])
REFERENCES [dbo].[Matchups] ([id])
GO

ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_ParentMatchups]
GO

ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_Teams] FOREIGN KEY([TeamCompetingId])
REFERENCES [dbo].[Teams] ([id])
GO

ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_Teams]
GO


