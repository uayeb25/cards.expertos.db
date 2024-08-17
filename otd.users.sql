SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [otd].[users](
	[email] [varchar](255) NOT NULL,
	[firstname] [varchar](255) NULL,
	[lastname] [varchar](255) NULL,
	[active] [bit] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [otd].[users] ADD PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [otd].[trg_users_insert]
ON [otd].[users]
AFTER INSERT
AS
BEGIN
    UPDATE otd.users
    SET created_at = GETDATE(),
        updated_at = GETDATE()
    FROM otd.users u
    INNER JOIN inserted i ON u.email = i.email;
END;
GO
ALTER TABLE [otd].[users] ENABLE TRIGGER [trg_users_insert]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [otd].[trg_users_update]
ON [otd].[users]
AFTER UPDATE
AS
BEGIN
    UPDATE otd.users
    SET updated_at = GETDATE()
    FROM otd.users u
    INNER JOIN inserted i ON u.email = i.email;
END;
GO
ALTER TABLE [otd].[users] ENABLE TRIGGER [trg_users_update]
GO
