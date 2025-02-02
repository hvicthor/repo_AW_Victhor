/*
    Este teste garante que as vendas brutas de 2011 estão corretas com o valo
    auditado pelo time de Contabilidade, em que o total de vendas brutas foram:
    $ 12.646.112,16
*/

with
    sales_in_2011 as (
        select sum(total_gross_amount) as total_gross_amount
        from {{ ref('int_sales__prep_Sales') }}
        where date_order between '2011-1-1' and '2011-12-31'
    )

select total_gross_amount
from sales_in_2011
where total_gross_amount not between 12646100.00 and 12646200.00