   with
    fonte_sales_order_header as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.SALESORDERHEADER
    )

    , sales_order_header_renomeado as (
        select  
            cast(SALESORDERID as int) as pk_sales_order,
            cast(CUSTOMERID as int) as fk_customer,
            -- cast(SALESPERSONID as int) as fk_salesperson,
            -- cast(TERRITORYID as int) as fk_territory,
            cast(BILLTOADDRESSID as int) as fk_billto_address,
            cast(SHIPTOADDRESSID as int) as fk_shipto_address,
            cast(SHIPMETHODID as int) as fk_ship_method,
            cast(CREDITCARDID as int) as fk_credit_card,
            -- cast(CURRENCYRATEID as int) as fk_currency_rate,
            cast(ORDERDATE as date) as date_order,
            cast(DUEDATE as date) as date_due,
            cast(SHIPDATE as date) as date_ship,
            cast(SUBTOTAL as numeric(18, 2)) as subtotal,
            cast(TAXAMT as numeric(18, 2)) as tax_amount,
            cast(FREIGHT as numeric(18, 2)) as freight,
            cast(TOTALDUE as numeric(18, 2)) as total_due,
            cast(REVISIONNUMBER as int) as revision_number,
            cast(STATUS as int) as status,
            -- cast(ONLINEORDERFLAG as boolean) as online_order_flag,
            -- cast(PURCHASEORDERNUMBER as string) as purchase_order_number,
            -- cast(ACCOUNTNUMBER as string) as account_number,
            -- cast(CREDITCARDAPPROVALCODE as string) as credit_card_approval_code,
            -- cast(COMMENT as int) as comment,
            -- cast(ROWGUID as string) as row_guid,
            -- cast(MODIFIEDDATE as date) as date_modified
        from fonte_sales_order_header
    )

select *
from sales_order_header_renomeado