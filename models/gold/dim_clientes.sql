with
    dim_clientes as (
        select
            {{ dbt_utils.generate_surrogate_key(['ID_CLIENTE'])}} as SK_CLIENTE
            , NOME_COMPLETO
            , DESCRICAO_EMAIL
            , NUMERO_TELEFONE
        from {{ ref('silver__clientes') }}
    )


select *
from dim_clientes
