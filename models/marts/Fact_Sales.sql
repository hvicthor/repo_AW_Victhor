with

fct_Sales as (
    select *
    from {{ ref('int_sales__prep_Sales') }}    
)

select *

from fct_Sales






