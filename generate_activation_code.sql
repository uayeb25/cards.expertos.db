SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [otd].[generate_activation_code](
    @email NVARCHAR(255),
    @code INT
)
AS
BEGIN

    declare @n INT = ( SELECT COUNT(*) FROM otd.users WHERE email = @email );

    if @n > 0 BEGIN
        INSERT INTO otd.activation_codes (email, code) VALUES (@email, @code);
    END;
    
    select 1 completed


END;

GO
