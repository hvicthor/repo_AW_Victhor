with
    fonte_product_sub_category as (
        select*
        from fea24_11.RAW_ADVENTURE_WORKS.PRODUCTSUBCATEGORY

    )

    , product_sub_category_renomeado as (
        select
            cast (PRODUCTSUBCATEGORYID as int) as pk_product_sub_category,
            cast (PRODUCTCATEGORYID as int) as fk_product_category,
            cast (NAME as string) as name_product_sub_category,
            -- cast (ROWGUID as string) as row_guid,
            -- cast (MODIFIEDDATE as date) as date_modified_date

        from fonte_product_sub_category
    )

    select *

    from product_sub_category_renomeado