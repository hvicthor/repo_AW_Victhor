   with
    fonte_sales_person as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.SalesPerson
    )

    , sales_person_renomeado as (
        select 
            cast(BUSINESSENTITYID as int ) as pk_salesperson,
            -- cast(TERRITORYID as int) as fk_territory,
            -- cast(SALESQUOTA as int) as sales_quota,
            cast(BONUS as int) as bonus,
            -- cast(COMMISSIONPCT as numeric(18, 3)) as commissionpct,
            -- cast(SALESYTD as numeric(18, 4)) as sales_ytd,
            cast(SALESLASTYEAR as numeric(18, 4)) as sales_last_year,
            -- cast(ROWGUID as string) as row_guid,
            -- cast(MODIFIEDDATE as date) as date_modified

        from fonte_sales_person
    )

select *
from sales_person_renomeado