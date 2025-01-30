with
/* Chamada dos modelos necessários. */

Customer as (
    select *
    from {{ ref('stg_erp__Customer') }}    
)

, Person as (
    select *
    from {{ ref('stg_erp__Person') }}    
)

, SalesTerritory as (
    select *
    from {{ ref('stg_erp__SalesTerritory') }}    
)

, enriquecer_Address as (
    select
        Customer.pk_customer as pk_customer,
        Person.full_name as full_name,
        SalesTerritory.name_territory as name_territory,
    from Customer

    left join Person on Customer.fk_person = Person.pk_person
    left join SalesTerritory on Customer.fk_territory = SalesTerritory.pk_territory

)

select *

from enriquecer_Address






