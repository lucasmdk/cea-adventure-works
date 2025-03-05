with
    product as (
        select *
        from {{ ref('stg_erp__produto') }}
    )

    , subcategory as (
        select *
        from {{ ref('stg_erp__subcategoria') }}
    )

    , category as (
        select *
        from {{ ref('stg_erp__categoria') }}
    )

    , silver_product as (
        select
            product.UID_PRODUTO
            , product.DES_PRODUTO
            , product.COD_PRODUTO
            , subcategory.NOM_SUBCATEGORIA
            , category.NOM_CATEGORIA
        from product
        left join subcategory on (product.UID_SUBCATEGORIA = subcategory.UID_SUBCATEGORIA)
        left join category    on (subcategory.UID_CATEGORIA = category.UID_CATEGORIA)
    )

select *
from silver_product