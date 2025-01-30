   with
    fonte_sales_reason as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.SALESREASON
    )

    , sales_reason_renomeado as (
        select 
            cast(SALESREASONID as int) as pk_sales_reason,
            cast(NAME as string) as name_sales_reason,
            cast(REASONTYPE as string) as reason_type,
            -- cast(MODIFIEDDATE as date) as date_modified
        from fonte_sales_reason
    )

select *
from sales_reason_renomeado