with

dim_Product as (
    select *
    from {{ ref('int_sales__prep_Product') }}    
)

select *

from dim_Product






