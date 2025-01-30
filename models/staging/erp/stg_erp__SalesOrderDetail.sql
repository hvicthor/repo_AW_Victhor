   with
    fonte_sales_order_detail as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.SALESORDERDETAIL
    )

    , sales_order_detail_renomeado as (
        select  
            cast(SALESORDERDETAILID as int) as pk_sales_order_detail,
            cast(SALESORDERID as int) as fk_sales_order,
            cast(PRODUCTID as int) as fk_product,
            -- cast(SPECIALOFFERID as int) as fk_special_offer,
            -- cast(MODIFIEDDATE as date) as date_modified,
            cast(ORDERQTY as int) as order_quantity,
            cast(UNITPRICE as numeric(18, 2)) as unit_price,
            cast(UNITPRICEDISCOUNT as numeric(18, 2)) as unit_price_discount,
            -- cast(CARRIERTRACKINGNUMBER as string) as carrier_tracking_number,
            -- cast(ROWGUID as string) as row_guid
        from fonte_sales_order_detail
    )

select *
from sales_order_detail_renomeado