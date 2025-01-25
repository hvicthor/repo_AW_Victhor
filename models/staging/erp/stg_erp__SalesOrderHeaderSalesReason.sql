with
    fonte_sales_order_header_sales_reason as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.SALESORDERHEADERSALESREASON
    )

    , sales_order_header_sales_reason_renomeado as (
        select
            cast(SALESORDERID as int) as pk_sales_order,
            cast(SALESREASONID as int) as fk_sales_reason,
            -- cast(MODIFIEDDATE as date) as date_modified
        from fonte_sales_order_header_sales_reason
    )

select *
from sales_order_header_sales_reason_renomeado