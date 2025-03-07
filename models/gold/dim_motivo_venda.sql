with
    dim_motivo_venda as (
        select 
            {{ dbt_utils.generate_surrogate_key(['ID_PEDIDO']) }} as SK_PEDIDO
            , DESCRICAO_MOTIVO_VENDA
            , TIPO_MOTIVO_VENDA
        from {{ ref('silver__motivo_venda') }}
    )


select *
from dim_motivo_venda