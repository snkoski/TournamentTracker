USE [Tournaments]
GO

/****** Object:  Table [dbo].[Tournaments]    Script Date: 2/5/2021 7:34:58 PM ******/



DROP TABLE [dbo].[MatchupEntries]

DROP TABLE [dbo].[Matchups]

DROP TABLE [dbo].[TeamMembers]

DROP TABLE [dbo].[TournamentPrizes]

DROP TABLE [dbo].[TournamentEntries]

DROP TABLE [dbo].[Tournaments]

DROP TABLE [dbo].[Prizes]

DROP TABLE [dbo].[People]

DROP TABLE [dbo].[Teams]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Create:  Table [dbo].[Teams] ******/
CREATE TABLE [dbo].[Teams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Create:  Table [dbo].[People] ******/
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[EmailAddress] [nvarchar](200) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Create:  Table [dbo].[Prizes] ******/
CREATE TABLE [dbo].[Prizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceNumber] [int] NOT NULL,
	[PlaceName] [nvarchar](50) NOT NULL,
	[PrizeAmount] [money] NOT NULL,
	[PrizePercentage] [float] NOT NULL,
 CONSTRAINT [PK_Prizes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Create:  Table [dbo].[Tournaments] ******/
CREATE TABLE [dbo].[Tournaments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentName] [nvarchar](100) NOT NULL,
	[EntryFee] [money] NOT NULL,
 CONSTRAINT [PK_Tournaments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Create:  Table [dbo].[TournamentEntries] ******/
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

/****** Create:  Table [dbo].[TournamentPrizes] ******/
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

/****** Create:  Table [dbo].[TeamMembers] ******/
CREATE TABLE [dbo].[TeamMembers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_TeamMembers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([id])
GO

ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_People]
GO

ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([id])
GO

ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_Team]
GO

/****** Create:  Table [dbo].[Matchups] ******/
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

/****** Create:  Table [dbo].[MatchupEntries] ******/
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


/******                             ******/
/****** Insert data into all tables ******/
/******                             ******/


/****** Insert:  Table [dbo].[Teams] ******/
INSERT INTO [dbo].[Teams]
VALUES ('Team1'),('Team2'),('Team3'),('Team4');
GO

/****** Insert:  Table [dbo].[People] ******/
INSERT INTO [dbo].[People]
VALUES 
('Shawn','Koski','shawn@fake.com','555-555-0001'),
('Bill','Billson','bill@fake.com','555-555-0002'),
('Dan','Danson','dan@fake.com','555-555-0003'),
('Tom','Tomson','tom@fake.com','555-555-0004'),
('Kent','Kentson','kent@fake.com','555-555-0005'),
('Ash','Ashson','ash@fake.com','555-555-0006'),
('Jessica','Jessicason','jessica@fake.com','555-555-0007'),
('Lisa','Lisason','lisa@fake.com','555-555-0008');
GO

/****** Insert:  Table [dbo].[Tournaments] ******/
INSERT INTO [dbo].[Tournaments]
VALUES 
('First Tourney', 10.00),
('Free Tourney', 0);
GO

/****** Insert:  Table [dbo].[Prizes] ******/
INSERT INTO [dbo].[Prizes]
VALUES 
(1, 'First Place', 10.00, 0),
(2, 'Second Place', 5.00, 0),
(1, 'Champion', 0, 0),
(2, 'Runner-Up', 0, 0);
GO

/****** Insert:  Table [dbo].[TournamentEntries] ******/
INSERT INTO [dbo].[TournamentEntries]
VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4);
GO

/****** Insert:  Table [dbo].[TournamentPrizes] ******/
INSERT INTO [dbo].[TournamentPrizes]
VALUES 
(1, 1),
(1, 2),
(2, 1), 
(2, 2);
GO

/****** Insert:  Table [dbo].[TeamMembers] ******/
INSERT INTO [dbo].[TeamMembers]
VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8);
GO

/****** Insert:  Table [dbo].[Matchups] ******/
INSERT INTO [dbo].[Matchups]
VALUES 
(1, 1, 1),
(3, 1, 1),
(1, 2, 1),
(1, 1, 2),
(4, 1, 2), 
(4, 2, 2);
GO

/****** Insert:  Table [dbo].[MatchupEntries] ******/
INSERT INTO [dbo].[MatchupEntries]
VALUES 
(1, NULL, 1, 1),
(1, NULL, 2, 0),
(2, NULL, 3, 3),
(2, NULL, 4, 1),
(3, 1, 1, 5),
(3, 2, 3, 0),
(4, NULL, 1, 2),
(4, NULL, 2, 1),
(5, NULL, 3, 3),
(5, NULL, 4, 4),
(6, 4, 1, 1),
(6, 5, 4, 4);
GO

