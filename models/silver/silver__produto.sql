with
    produto as (
        select *
        from {{ ref('bronze_erp__produto') }}
    )

    , subcategoria as (
        select *
        from {{ ref('bronze_erp__subcategoria') }}
    )

    , categoria as (
        select *
        from {{ ref('bronze_erp__categoria') }}
    )

    , silver_produto as (
        select
            produto.ID_PRODUTO
            , produto.DESCRICAO_PRODUTO
            , produto.CODIGO_PRODUTO
            , subcategoria.DESCRICAO_SUBCATEGORIA
            , categoria.DESCRICAO_CATEGORIA
        from produto
        left join subcategoria on (produto.ID_SUBCATEGORIA = subcategoria.ID_SUBCATEGORIA)
        left join categoria    on (subcategoria.ID_CATEGORIA = categoria.ID_CATEGORIA)
    )


select *
from silver_produto