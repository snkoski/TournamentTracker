USE [Tournaments]
GO

/****** Object:  Table [dbo].[Tournaments]    Script Date: 2/5/2021 7:32:28 PM ******/
DROP TABLE [dbo].[Tournaments]
GO

/****** Object:  Table [dbo].[Tournaments]    Script Date: 2/5/2021 7:32:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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


