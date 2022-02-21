USE [Challenge]
GO

/****** Object:  Table [dbo].[File3]    Script Date: 21/02/2022 09:05:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[File3](
	[region] [nvarchar](50) NOT NULL,
	[origin_coord] [nvarchar](50) NOT NULL,
	[destination_coord] [nvarchar](50) NOT NULL,
	[datetime] [datetime2](7) NOT NULL,
	[datasource] [nvarchar](50) NOT NULL,
	[Distance] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


