with
    dim_locais as (
        select
            {{ dbt_utils.generate_surrogate_key(['ID_ENDERECO']) }} as SK_ENDERECO
            , DESCRICAO_ENDERECO
            , NOME_CIDADE
            , NOME_ESTADO
            , SIGLA_ESTADO
            , NOME_PAIS
        from {{ ref('silver__locais') }}
    )


select *
from dim_locais
