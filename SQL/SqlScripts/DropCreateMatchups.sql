USE [Tournaments]
GO

ALTER TABLE [dbo].[Matchups] DROP CONSTRAINT [FK_Matchups_WinningTeams]
GO

/****** Object:  Table [dbo].[Matchups]    Script Date: 2/5/2021 7:23:38 PM ******/
DROP TABLE [dbo].[Matchups]
GO

/****** Object:  Table [dbo].[Matchups]    Script Date: 2/5/2021 7:23:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Matchups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[WinnerId] [int] NOT NULL,
	[MatchupRound] [int] NOT NULL,
	[TournamentId] [int] NOT NULL,
 CONSTRAINT [PK_Matchups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD  CONSTRAINT [FK_Matchups_WinningTeams] FOREIGN KEY([WinnerId])
REFERENCES [dbo].[Teams] ([id])
GO

ALTER TABLE [dbo].[Matchups] CHECK CONSTRAINT [FK_Matchups_WinningTeams]
GO

ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD  CONSTRAINT [FK_Matchups_Tournaments] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([id])
GO

ALTER TABLE [dbo].[Matchups] CHECK CONSTRAINT [FK_Matchups_Tournaments]
GO