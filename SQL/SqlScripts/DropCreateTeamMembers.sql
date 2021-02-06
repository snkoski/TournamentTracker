USE [Tournaments]
GO

ALTER TABLE [dbo].[TeamMembers] DROP CONSTRAINT [FK_TeamMembers_Team]
GO

ALTER TABLE [dbo].[TeamMembers] DROP CONSTRAINT [FK_TeamMembers_People]
GO

/****** Object:  Table [dbo].[TeamMembers]    Script Date: 2/5/2021 7:30:24 PM ******/
DROP TABLE [dbo].[TeamMembers]
GO

/****** Object:  Table [dbo].[TeamMembers]    Script Date: 2/5/2021 7:30:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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


