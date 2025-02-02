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
    SELECT 
        pk_sales_order, 
        LISTAGG(name_sales_reason, ', ') WITHIN GROUP (ORDER BY name_sales_reason) AS name_sales_reason, 
        LISTAGG(reason_type, ', ') WITHIN GROUP (ORDER BY reason_type) AS reason_type
    FROM {{ ref('stg_erp__SalesOrderHeaderSalesReason') }} soh
    LEFT JOIN SalesReason sr ON soh.fk_sales_reason = sr.pk_sales_reason
    GROUP BY pk_sales_order
)

, enriquecer_SalesDetail as (
    SELECT DISTINCT
        MD5(CONCAT(SOD.fk_sales_order, ' ', SOD.pk_sales_order_detail)) AS sk_sales,
        SOD.pk_sales_order_detail,
        SOD.fk_sales_order,
        SOD.fk_product,
        SOH.fk_customer,
        SOH.fk_salesperson,
        SOH.fk_billto_address,
        SOH.fk_shipto_address,
        SOH.fk_credit_card,
        SOH.date_order,
        SOH.date_ship,
        SOH.date_due,
        SOD.order_quantity,
        SOH.status,
        SOD.unit_price,
        SOD.unit_price_discount,
        SOH.subtotal,
        SOH.tax_amount,
        SOH.freight,
        SOH.total_due,
        COALESCE(SOHSR.name_sales_reason, 'Sem razão especificada') AS name_sales_reason,
        COALESCE(SOHSR.reason_type, 'Sem tipo especificado') AS reason_type
    FROM SalesOrderDetail SOD
    LEFT JOIN SalesOrderHeader SOH ON SOD.fk_sales_order = SOH.pk_sales_order
    LEFT JOIN SalesOrderHeaderSalesReason SOHSR ON SOD.fk_sales_order = SOHSR.pk_sales_order

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
