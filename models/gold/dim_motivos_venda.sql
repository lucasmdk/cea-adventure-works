with
    dim_motivos_venda as (
        select 
            {{ dbt_utils.generate_surrogate_key(['ID_PEDIDO']) }} as SK_PEDIDO
            , DESCRICAO_MOTIVO_VENDA
            , TIPO_MOTIVO_VENDA
        from {{ ref('silver__motivos_venda') }}
    )


select *
from dim_motivos_venda
