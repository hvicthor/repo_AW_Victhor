   with
    fonte_customer as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.CUSTOMER
    )

    , customer_renomeado as (
        select  
            cast(CUSTOMERID as int) as pk_customer,
            cast(PERSONID as int) as fk_person,
            cast(STOREID as int) as fk_store,
            -- cast(TERRITORYID as int) as fk_territory, 
            -- cast(ROWGUID as string) as row_guid,
            -- cast(MODIFIEDDATE as date) as date_modified
        from fonte_customer
    )

select *
from customer_renomeado