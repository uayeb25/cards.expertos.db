SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [otd].[cards](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [otd].[cards] ADD PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [otd].[cards]  WITH CHECK ADD  CONSTRAINT [fk_cards_users] FOREIGN KEY([email])
REFERENCES [otd].[users] ([email])
GO
ALTER TABLE [otd].[cards] CHECK CONSTRAINT [fk_cards_users]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [otd].[trg_cards_insert]
ON [otd].[cards]
AFTER INSERT
AS
BEGIN
    UPDATE otd.cards
    SET created_at = GETDATE(),
        updated_at = GETDATE()
    FROM otd.cards u
    INNER JOIN inserted i ON u.id = i.id;
END;
GO
ALTER TABLE [otd].[cards] ENABLE TRIGGER [trg_cards_insert]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [otd].[trg_cards_updated]
ON [otd].[cards]
AFTER update
AS
BEGIN

    UPDATE otd.cards
    SET updated_at = GETDATE()
    FROM otd.cards u
    INNER JOIN inserted i ON u.id = i.id;

END;
GO
ALTER TABLE [otd].[cards] ENABLE TRIGGER [trg_cards_updated]
GO
