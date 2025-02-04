with
/* Chamada dos modelos necessários. */

Product as (
    select *
    from {{ ref('stg_erp__Product') }}
)

, ProductCategory as (
    select *
    from {{ ref('stg_erp__Product_Category') }}
)

, ProductSubCategory as (
    select *
    from {{ ref('stg_erp__Product_Sub_Category') }}
)

, enriquecer_Product as (
    select
        P.pk_product,
        P.name_product,
        P.product_number,
        P.standard_cost,
        P.list_price,
        PC.name_product_category,
        PSC.name_product_sub_category,
        
    from  Product P

    left join ProductSubCategory PSC on PSC.pk_product_sub_category = P.fk_product_sub_category
    left join  ProductCategory PC on PC.pk_product_category = PSC.fk_product_category
)

select *

from enriquecer_Product






