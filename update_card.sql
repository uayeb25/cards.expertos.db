SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [otd].[update_card](
    @id INT,
    @title NVARCHAR(255),
    @description NVARCHAR(max)
)
as
BEGIN

    declare @n int = (
        select count(*) 
        from otd.cards 
        where id = @id
    )

    if @n = 0
    begin 
        select 404 status , 'Card not found' message
    end else begin
        UPDATE otd.cards
        SET 
            title = @title
            , description = @description
        WHERE id = @id   
    end
    
END

GO
