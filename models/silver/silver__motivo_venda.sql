with
    motivo_venda_pedido as (
        select *
        from {{ ref('bronze_erp__motivo_venda_pedido') }}
    )

    , motivo_venda as (
        select *
        from {{ ref('bronze_erp__motivo_venda') }}
    )

    , silver_motivo_venda as (
        select
            motivo_venda_pedido.ID_PEDIDO
            , motivo_venda.DESCRICAO_MOTIVO_VENDA
            , motivo_venda.TIPO_MOTIVO_VENDA
        from motivo_venda_pedido
        left join motivo_venda on (motivo_venda_pedido.ID_MOTIVO_VENDA = motivo_venda.ID_MOTIVO_VENDA)

    )


select *
from silver_motivo_venda