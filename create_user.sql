SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [otd].[create_user](
    @email VARCHAR(255),
    @firstname VARCHAR(255),
    @lastname VARCHAR(255)
) 
AS

INSERT into otd.users(email, firstname, lastname, active)
values(@email, @firstname, @lastname, 0)

select 1 completed
GO
