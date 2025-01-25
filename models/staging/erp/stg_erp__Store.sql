   with
    fonte_store as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.STORE
    )

    , store_renomeado as (
        select 
            cast(BUSINESSENTITYID as int) as pk_store,
            cast(SALESPERSONID as int) as fk_salesperson,
            cast(NAME as string) as name_store,
            -- cast(DEMOGRAPHICS as string) as demographics,
            -- cast(ROWGUID as string) as row_guid,
            -- cast(MODIFIEDDATE as date) as date_modified
        from fonte_store
    )

select *
from store_renomeado