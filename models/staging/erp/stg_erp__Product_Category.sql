with
    fonte_product_category as (
        select*
        from fea24_11.RAW_ADVENTURE_WORKS.PRODUCTCATEGORY

    )

    , product_category_renomeado as (
        select
            cast (PRODUCTCATEGORYID as int) as pk_product_category,
            cast (NAME as string) as name_product_category,
            -- cast (ROWGUID as string) as row_guid,
            -- cast (MODIFIEDDATE as date) as date_modified_date

        from fonte_product_category
    )

    select *

    from product_category_renomeado