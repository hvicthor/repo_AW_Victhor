with
/* Chamada dos modelos necessários. */

SalesPerson as (
    select *
    from {{ ref('stg_erp__SalesPerson') }}    
)

, Employee as (
    select *
    from {{ ref('stg_erp__Employee') }}    
)

, SalesTerritory as (
    select *
    from {{ ref('stg_erp__SalesTerritory') }}    
)

, enriquecer_SalesPerson as (
    select
        SalesPerson.pk_SalesPerson as pk_SalesPerson,
        Employee.job_title as job_title,
        SalesTerritory.name_territory as name_territory

    from SalesPerson

    left join Employee on SalesPerson.pk_salesperson = Employee.pk_employee
    left join SalesTerritory on SalesPerson.fk_territory = SalesTerritory.pk_territory

)

select *

from enriquecer_SalesPerson






