with
    motivos_venda_pedidos as (
        select *
        from {{ ref('bronze_erp__motivos_venda_pedidos') }}
    )

    , motivos_venda as (
        select *
        from {{ ref('bronze_erp__motivos_venda') }}
    )

    , silver_motivos_venda as (
        select
            motivos_venda_pedidos.ID_PEDIDO
            , motivos_venda.DESCRICAO_MOTIVO_VENDA
            , motivos_venda.TIPO_MOTIVO_VENDA
        from motivos_venda_pedidos
        left join motivos_venda
            on motivos_venda_pedidos.ID_MOTIVO_VENDA = motivos_venda.ID_MOTIVO_VENDA

    )


select *
from silver_motivos_venda
