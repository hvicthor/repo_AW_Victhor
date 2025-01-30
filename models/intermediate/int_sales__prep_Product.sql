with
/* Chamada dos modelos necessários. */

Product as (
    select *
    from {{ ref('stg_erp__Product') }}    
)

, enriquecer_Product as (
    select
            Product.pk_product,
            Product.name_product,
            Product.product_number,
            Product.standard_cost,
            Product.list_price
        
    from Product

)

select *

from enriquecer_Product






