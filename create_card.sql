SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [otd].[create_card](
    @email NVARCHAR(255),
    @title NVARCHAR(255),
    @description NVARCHAR(max)
)
as
BEGIN


    INSERT INTO otd.cards (email, title, description)
    VALUES (@email, @title, @description)

END
GO
