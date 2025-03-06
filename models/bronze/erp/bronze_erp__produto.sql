with
    bronze_product as (
        select
            cast(PRODUCTID as int)              as UID_PRODUTO
            , cast(PRODUCTSUBCATEGORYID as int) as UID_SUBCATEGORIA
            , cast(NAME as string)              as DES_PRODUTO
            , cast(PRODUCTNUMBER as string)     as COD_PRODUTO

        from {{ source('erp', 'product') }}
    )


select *
from bronze_product