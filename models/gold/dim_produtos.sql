with
    dim_produtos as (
        select 
            {{ dbt_utils.generate_surrogate_key(['ID_PRODUTO']) }} as SK_PRODUTO
            , DESCRICAO_PRODUTO
            , CODIGO_PRODUTO
            , DESCRICAO_SUBCATEGORIA
            , DESCRICAO_CATEGORIA
        from {{ ref('silver__produtos') }}
    )


select *
from dim_produtos
