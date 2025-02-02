with
/* Chamada dos modelos necessários. */

SalesOrderDetail as (
    select *
    from {{ ref('stg_erp__SalesOrderDetail') }}    
)

, SalesOrderHeader as (
    select *
    from {{ ref('stg_erp__SalesOrderHeader') }}    
)

, SalesReason as (
    select *
    from {{ ref('stg_erp__SalesReason') }}    
)

, SalesOrderHeaderSalesReason as (
    select *
    from {{ ref('stg_erp__SalesOrderHeaderSalesReason') }}    
)

, enriquecer_SalesDetail as (
    select
        MD5 (SalesOrderDetail.fk_sales_order || ' '  || SalesOrderDetail.pk_sales_order_detail) as sk_sales,
        SalesOrderDetail.pk_sales_order_detail as pk_sales_order_detail,
        SalesOrderDetail.fk_sales_order as fk_sales_order,
        SalesOrderDetail.fk_product as fk_product,
        SalesOrderHeader.fk_customer as fk_customer,
        SalesOrderHeader.fk_salesperson as fk_salesperson,
        SalesOrderHeader.fk_billto_address as fk_billto_address,
        SalesOrderHeader.fk_shipto_address as fk_shipto_address,
        SalesOrderHeader.fk_credit_card as fk_credit_card,
        SalesOrderHeader.date_order as date_order,
        SalesOrderHeader.date_ship as date_ship,
        SalesOrderHeader.date_due as date_due,
        SalesOrderDetail.order_quantity as order_quantity,
        SalesOrderHeader.status as status,
        SalesOrderDetail.unit_price as unit_price,
        SalesOrderDetail.unit_price_discount as unit_price_discount,
        SalesOrderHeader.subtotal as subtotal,
        SalesOrderHeader.tax_amount as tax_amount,
        SalesOrderHeader.freight as freight,
        SalesOrderHeader.total_due as total_due,
        coalesce(SalesReason.name_sales_reason, 'Sem razão especificada') as name_sales_reason,
        coalesce(SalesReason.reason_type, 'Sem tipo especificado') as reason_type
    
    from SalesOrderDetail

    left join SalesOrderHeader on SalesOrderDetail.fk_sales_order = SalesOrderHeader.pk_sales_order
    left join SalesOrderHeaderSalesReason on SalesOrderHeader.pk_sales_order = SalesOrderHeaderSalesReason.pk_sales_order
    left join SalesReason on SalesOrderHeaderSalesReason.fk_sales_reason = SalesReason.pk_sales_reason

)

, metric as (
    select
        sk_sales,
        pk_sales_order_detail,
        fk_sales_order,
        fk_product,
        fk_customer,
        fk_salesperson,
        fk_billto_address,
        fk_shipto_address,
        fk_credit_card,
        date_order,
        date_ship,
        date_due,
        order_quantity,
        status,
        name_sales_reason,
        reason_type,
        unit_price,
        unit_price_discount,
        subtotal,
        tax_amount,
        freight,
        total_due,
        cast (count(fk_product) OVER (PARTITION BY fk_product) as int) * unit_price as total_gross_sales,
        (order_quantity * unit_price) as total_gross_amount,
        (order_quantity * unit_price) - (1-unit_price_discount) as net_amount,
        (unit_price * order_quantity) / count (sk_sales) over(partition by sk_sales) as total_gross_amount_per_sales,
        cast (((count(fk_product) OVER (PARTITION BY fk_product)) * unit_price*(1 - unit_price_discount)) / 
        (count(fk_product) OVER (PARTITION BY fk_product)) as numeric(18,2)) as average_ticket

    from enriquecer_SalesDetail

)

select *

from metric
