with
    bronze_categorias as (
        select
            cast(PRODUCTCATEGORYID as int)  as ID_CATEGORIA
            , cast(NAME as string)          as DESCRICAO_CATEGORIA
        from {{ source('erp', 'productcategory') }}
    )


select *
from bronze_categorias
