SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [otd].[delete_card](
    @card_id INT
    , @email VARCHAR(255)
)

as 

BEGIN


    declare @n int = (
        select count(*)
        from otd.cards
        where id = @card_id
        and email = @email
    );
    
    if @n = 0 BEGIN
        select 404 status, 'not found' message;
    END else BEGIN

        delete from otd.card_files
        where card_id = @card_id;
        
        delete from otd.cards
        where id = @card_id;
        
        select 200 status, 'ok' message;
    END


END;




GO
