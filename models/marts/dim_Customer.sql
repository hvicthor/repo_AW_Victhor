with

dim_Customer as (
    select *
    from {{ ref('int_sales__prep_Customer') }}    
)

select *

from dim_Customer






