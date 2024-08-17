SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [otd].[activate_user](
    @email VARCHAR(255)
)
AS
BEGIN
    
    UPDATE otd.users
    SET active = 1
    WHERE email = @email;

    select 1 as success;

END
GO
