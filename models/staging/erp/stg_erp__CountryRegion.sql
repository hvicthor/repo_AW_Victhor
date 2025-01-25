with
    fonte_CountryRegion as (
        select*
        from fea24_11.RAW_ADVENTURE_WORKS.CountryRegion
    )
    
    , Country_Region_renomeado as (
        select 
            cast(COUNTRYREGIONCODE as string) as pk_country_region,
            cast(NAME as string) as name_country_region,
            -- cast(MODIFIEDDATE as date) as date_modified
        from fonte_CountryRegion
    )

select *
from Country_Region_renomeado