with
    bronze_productsubcategory as (
        select
            cast(PRODUCTSUBCATEGORYID as int) as UID_SUBCATEGORIA
            , cast(PRODUCTCATEGORYID as int)  as UID_CATEGORIA
            , cast(NAME as string)            as NOM_SUBCATEGORIA
        from {{ source('erp', 'productsubcategory') }}
    )


select *
from bronze_productsubcategory