with
/* Chamada dos modelos necessários. */

Creditcard as (
    select *
    from {{ ref('stg_erp__Creditcard') }}    
)

, enriquecer_Creditcard as (
    select
        Creditcard.pk_credit_card as pk_credit_card,
        Creditcard.card_type as card_type
        
    from Creditcard

)

select *

from enriquecer_Creditcard






