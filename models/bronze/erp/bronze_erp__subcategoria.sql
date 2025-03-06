with
    bronze_productsubcategory as (
        select
            cast(PRODUCTSUBCATEGORYID as int) as ID_SUBCATEGORIA
            , cast(PRODUCTCATEGORYID as int)  as ID_CATEGORIA
            , cast(NAME as string)            as DESCRICAO_SUBCATEGORIA
        from {{ source('erp', 'productsubcategory') }}
    )


select *
from bronze_productsubcategory