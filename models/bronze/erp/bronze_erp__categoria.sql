with
    bronze_productcategory as (
        select
            cast(PRODUCTCATEGORYID as int)  as UID_CATEGORIA
            , cast(NAME as string)          as NOM_CATEGORIA
        from {{ source('erp', 'productcategory') }}
    )


select *
from bronze_productcategory