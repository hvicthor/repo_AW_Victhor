   with
    fonte_state_province as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.STATEPROVINCE
    )

    , state_province_renomeado as (
        select  
            cast(STATEPROVINCEID as int) as pk_state_province,
            -- cast(TERRITORYID as int) as fk_territory,
            cast(COUNTRYREGIONCODE as string) as fk_country_region,
            -- cast(MODIFIEDDATE as date) as date_modified,
            cast(STATEPROVINCECODE as string) as state_province_code,
            cast(NAME as string) as state_province_name,
            -- cast(ISONLYSTATEPROVINCEFLAG as boolean) as is_only_state_province_flag,
            -- cast(ROWGUID as string) as row_guid
        from fonte_state_province
    )

select *
from state_province_renomeado        