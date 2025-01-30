with

dim_SalesPerson as (
    select *
    from {{ ref('int_sales__prep_SalesPerson') }}    
)

select *

from dim_SalesPerson






