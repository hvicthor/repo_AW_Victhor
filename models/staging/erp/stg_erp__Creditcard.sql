with
    fonte_Creditcard as (
        select*
        from fea24_11.RAW_ADVENTURE_WORKS.creditcard
    )
    
     , credit_card_renomeado as (
        select
            cast(CREDITCARDID as int) as pk_credit_card,
            cast(CARDTYPE as string) as card_type,
            -- cast(CARDNUMBER as numeric(18, 2)) as card_number,
            -- cast(EXPMONTH as int) as expiration_month,
            -- cast(EXPYEAR as int) as expiration_year,
            -- cast(MODIFIEDDATE as date) as date_modified
        from fonte_Creditcard
    )

select *
from credit_card_renomeado