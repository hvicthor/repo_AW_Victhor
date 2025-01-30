with
/* Chamada dos modelos necessários. */

Address as (
    select *
    from {{ ref('stg_erp__Address') }}    
)

, StateProvince as (
    select *
    from {{ ref('stg_erp__StateProvince') }}    
)

, CountryRegion as (
    select *
    from {{ ref('stg_erp__CountryRegion') }}    
)

, enriquecer_Address as (
    select
        Address.pk_address as pk_address,
        Address.city as City,
        CountryRegion.pk_country_region as Country_Region_Code,
        CountryRegion.Country_Region_Name as Country_Region_Name,
        StateProvince.state_province_name as State_Province_Name,
        StateProvince.state_province_code as State_Province_Code
    from Address

    left join StateProvince on Address.fk_state_province = StateProvince.pk_state_province
    left join CountryRegion on StateProvince.fk_country_region = CountryRegion.pk_country_region

)

select *

from enriquecer_Address






