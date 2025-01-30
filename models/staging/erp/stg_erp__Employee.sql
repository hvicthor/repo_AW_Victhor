   with
    fonte_Employee as (
        select*
        from FEA24_11.RAW_ADVENTURE_WORKS.Employee
    )

    , Employee_renomeado as (
        select 
            cast (BUSINESSENTITYID as int) as pk_employee,
            cast (JOBTITLE as string) as job_title,
            -- cast (NATIONALIDNUMBER as int) as national_id_number,
            -- cast (LOGINID as string) as login_id,
            -- cast (BIRTHDATE as date) as birth_date,
            -- cast (MARITALSTATUS as char(1)) as marital_status,
            -- cast (GENDER as char(1)) as gender_employee,
            -- cast (HIREDATE as date) as hire_date,
            -- cast (SALARIEDFLAG as boolean) as salaried_flag,
            -- cast (VACATIONHOURS as int) as vacation_hours,
            -- cast (SICKLEAVEHOURS as int) as sick_leave_hours,
            -- cast (CURRENTFLAG as boolean) as current_flag,
            -- cast (ROWGUID as string) as row_guid,
            -- cast (MODIFIEDDATE as date) as date_modified,
            -- cast (ORGANIZATIONNODE as string) as organization_node


        from fonte_Employee
    )

select *
from Employee_renomeado