USE [Tec]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 19/9/2019 10:05:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion](
	[Provincia] [varchar](50) NOT NULL,
	[Distrito] [varchar](50) NOT NULL,
	[Canton] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
