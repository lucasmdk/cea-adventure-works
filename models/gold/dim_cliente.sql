with
    dim_cliente as (
        select
            {{ dbt_utils.generate_surrogate_key(['ID_CLIENTE'])}} as SK_CLIENTE
            , NOME_COMPLETO
            , DESCRICAO_EMAIL
            , NUMERO_TELEFONE
        from {{ ref('silver__cliente') }}
    )


select *
from dim_cliente