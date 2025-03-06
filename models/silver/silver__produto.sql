with
    product as (
        select *
        from {{ ref('bronze_erp__produto') }}
    )

    , subcategory as (
        select *
        from {{ ref('bronze_erp__subcategoria') }}
    )

    , category as (
        select *
        from {{ ref('bronze_erp__categoria') }}
    )

    , silver_product as (
        select
            product.ID_PRODUTO
            , product.DESCRICAO_PRODUTO
            , product.CODIGO_PRODUTO
            , subcategory.DESCRICAO_SUBCATEGORIA
            , category.DESCRICAO_CATEGORIA
        from product
        left join subcategory on (product.ID_SUBCATEGORIA = subcategory.ID_SUBCATEGORIA)
        left join category    on (subcategory.ID_CATEGORIA = category.ID_CATEGORIA)
    )

select *
from silver_product