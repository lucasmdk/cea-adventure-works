with
    bronze_produtos as (
        select
            cast(PRODUCTID as int)              as ID_PRODUTO
            , cast(PRODUCTSUBCATEGORYID as int) as ID_SUBCATEGORIA
            , cast(NAME as string)              as DESCRICAO_PRODUTO
            , cast(PRODUCTNUMBER as string)     as CODIGO_PRODUTO

        from {{ source('erp', 'product') }}
    )


select *
from bronze_produtos
