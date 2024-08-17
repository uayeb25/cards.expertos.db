SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [otd].[card_files](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[card_id] [int] NULL,
	[file_name] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [otd].[card_files] ADD PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [otd].[card_files] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [otd].[card_files] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [otd].[card_files]  WITH CHECK ADD  CONSTRAINT [FK_card_files_card_id] FOREIGN KEY([card_id])
REFERENCES [otd].[cards] ([id])
GO
ALTER TABLE [otd].[card_files] CHECK CONSTRAINT [FK_card_files_card_id]
GO
