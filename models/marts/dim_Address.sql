with

dim_Address as (
    select *
    from {{ ref('int_sales__prep_Address') }}    
)

select *

from dim_Address






