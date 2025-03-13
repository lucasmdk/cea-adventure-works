with
    produtos as (
        select *
        from {{ ref('bronze_erp__produtos') }}
    )

    , subcategorias as (
        select *
        from {{ ref('bronze_erp__subcategorias') }}
    )

    , categorias as (
        select *
        from {{ ref('bronze_erp__categorias') }}
    )

    , silver_produtos as (
        select
            produtos.ID_PRODUTO
            , produtos.DESCRICAO_PRODUTO
            , produtos.CODIGO_PRODUTO
            , subcategorias.DESCRICAO_SUBCATEGORIA
            , categorias.DESCRICAO_CATEGORIA
        from produtos
        left join subcategorias
            on produtos.ID_SUBCATEGORIA = subcategorias.ID_SUBCATEGORIA
        left join categorias
            on subcategorias.ID_CATEGORIA = categorias.ID_CATEGORIA
    )


select *
from silver_produtos
