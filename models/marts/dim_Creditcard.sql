with

dim_Creditcard as (
    select *
    from {{ ref('int_sales__prep_Creditcard') }}    
)

select *

from dim_Creditcard






