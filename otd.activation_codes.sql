SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [otd].[activation_codes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NULL,
	[code] [int] NULL,
	[created_at] [datetime] NULL,
	[expired_at] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [otd].[activation_codes] ADD PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [otd].[activation_codes] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [otd].[activation_codes] ADD  DEFAULT (dateadd(day,(2),getdate())) FOR [expired_at]
GO
ALTER TABLE [otd].[activation_codes]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [otd].[users] ([email])
GO
