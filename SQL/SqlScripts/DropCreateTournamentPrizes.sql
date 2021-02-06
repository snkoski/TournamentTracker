USE [Tournaments]
GO

ALTER TABLE [dbo].[TournamentPrizes] DROP CONSTRAINT [FK_TournamentPrizes_Tournaments]
GO

ALTER TABLE [dbo].[TournamentPrizes] DROP CONSTRAINT [FK_TournamentPrizes_Prizes]
GO

/****** Object:  Table [dbo].[TournamentPrizes]    Script Date: 2/5/2021 7:32:21 PM ******/
DROP TABLE [dbo].[TournamentPrizes]
GO

/****** Object:  Table [dbo].[TournamentPrizes]    Script Date: 2/5/2021 7:32:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TournamentPrizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[PrizeId] [int] NOT NULL,
 CONSTRAINT [PK_TournamentPrizes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrizes_Prizes] FOREIGN KEY([PrizeId])
REFERENCES [dbo].[Prizes] ([id])
GO

ALTER TABLE [dbo].[TournamentPrizes] CHECK CONSTRAINT [FK_TournamentPrizes_Prizes]
GO

ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrizes_Tournaments] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([id])
GO

ALTER TABLE [dbo].[TournamentPrizes] CHECK CONSTRAINT [FK_TournamentPrizes_Tournaments]
GO

