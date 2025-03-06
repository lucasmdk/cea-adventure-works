with
    dim_produto as (
        select 
        {{ dbt_utils.generate_surrogate_key(['ID_PRODUTO']) }} as SK_PRODUTO
        , DESCRICAO_PRODUTO
        , CODIGO_PRODUTO
        , DESCRICAO_SUBCATEGORIA
        , DESCRICAO_CATEGORIA
        from {{ ref('silver__produto') }}
    )


select *
from dim_produto