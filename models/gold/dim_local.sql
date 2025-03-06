with
    dim_local as (
        select
            {{ dbt_utils.generate_surrogate_key(['ID_ENDERECO']) }} as SK_ENDERECO
            , DESCRICAO_ENDERECO
            , NOME_CIDADE
            , NOME_ESTADO
            , SIGLA_ESTADO
            , NOME_PAIS
        from {{ ref('silver__local') }}
    )


select *
from dim_local