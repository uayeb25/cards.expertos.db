SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [otd].[sp_insert_card_files](
    @card_id int
    , @file_name varchar(255)
    , @email varchar(255)
) 
AS
BEGIN

    declare @n int = ( select count(*) from otd.cards where id = @card_id and email = @email )

    if @n > 0 begin

        declare @file_exists int = ( select count(*) from otd.card_files where card_id = @card_id and file_name = @file_name )

        if @file_exists > 0 begin
            update otd.card_files 
            set updated_at = getdate()
            where card_id = @card_id
            and file_name = @file_name
            
            select 200 as status, 'OK' as message
        end else begin
           
            insert into otd.card_files(card_id, file_name)
            values(@card_id, @file_name)
            select 200 as status, 'OK' as message
            
        end

    end else begin
        select 404 as status, 'Card not found' as message 
    end

END
GO
