   with
    fonte_person as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.Person
    )

    , person_renomeado as (
        select 
            cast(BUSINESSENTITYID as int) as pk_person,
            -- cast(EMAILPROMOTION as int) as email_promotion,
            -- cast(PERSONTYPE as string) as person_type,
            -- cast(NAMESTYLE as boolean) as name_style,
            -- cast(TITLE as string) as title,
            cast(FIRSTNAME as string) as first_name,
            cast(MIDDLENAME as string) as middle_name,
            cast(LASTNAME as string) as last_name,
            -- cast(SUFFIX as string) as suffix,
            -- cast(ADDITIONALCONTACTINFO as string) as additional_contact_info,
            -- cast(DEMOGRAPHICS as string) as demographics,
            -- cast(ROWGUID as string) as row_guid,
            -- cast(MODIFIEDDATE as date) as date_modified
        from fonte_person
    )

select *
from person_renomeado