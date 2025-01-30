with
/* Chamada dos modelos necessários. */

SalesReason as (
    select *
    from {{ ref('stg_erp__SalesReason') }}    
)
  
, enriquecer_SalesReason as (
    select
        SalesReason.pk_sales_reason as pk_sales_reason,
        SalesReason.name_sales_reason as name_sales_reason,
        SalesReason.reason_type as reason_type
        
    from SalesReason

)

select *

from enriquecer_SalesReason
