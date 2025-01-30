with

dim_SalesReason as (
    select *
    from {{ ref('int_sales__prep_SalesReason') }}    
)

select *

from dim_SalesReason






