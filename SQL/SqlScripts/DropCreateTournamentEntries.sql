USE [Tournaments]
GO

ALTER TABLE [dbo].[TournamentEntries] DROP CONSTRAINT [FK_TournamentEntries_Tournaments]
GO

ALTER TABLE [dbo].[TournamentEntries] DROP CONSTRAINT [FK_TournamentEntries_Teams]
GO

/****** Object:  Table [dbo].[TournamentEntries]    Script Date: 2/5/2021 7:31:49 PM ******/
DROP TABLE [dbo].[TournamentEntries]
GO

/****** Object:  Table [dbo].[TournamentEntries]    Script Date: 2/5/2021 7:31:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TournamentEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NULL,
	[TeamId] [int] NULL,
 CONSTRAINT [PK_TournamentEntries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntries_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([id])
GO

ALTER TABLE [dbo].[TournamentEntries] CHECK CONSTRAINT [FK_TournamentEntries_Teams]
GO

ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntries_Tournaments] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([id])
GO

ALTER TABLE [dbo].[TournamentEntries] CHECK CONSTRAINT [FK_TournamentEntries_Tournaments]
GO

