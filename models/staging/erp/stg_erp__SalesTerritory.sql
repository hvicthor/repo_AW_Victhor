   with
    fonte_sales_territory as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.SALESTERRITORY
    )

    , sales_territory_renomeado as (
        select 
            cast(TERRITORYID as int) as pk_territory,
            cast(COUNTRYREGIONCODE as string) fk_country,
            cast(NAME as string) as name_territory,
            -- cast(GROUP as string) as group_region,
            -- cast(SALESYTD as numeric(18, 4)) as sales_id,
            -- cast(SALESLASTYEAR as numeric(18, 4)) as sales_last_year,
            -- cast(COSTYTD as int) as cost_id,
            -- cast(COSTLASTYEAR as int) as cost_last_year,
            -- cast(ROWGUID as string) as row_guid,
            -- cast(MODIFIEDDATE as date) as date_modified 

        from fonte_sales_territory
    )

    select * 
    from sales_territory_renomeado