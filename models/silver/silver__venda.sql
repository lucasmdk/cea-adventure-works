with
    venda_detalhe as (
        select *
        from {{ ref('bronze_erp__venda_detalhe') }}
    )

    , venda as (
        select *
        from {{ ref('bronze_erp__venda') }}
    )

    , motivo_venda_pedido as (
        select
            ID_PEDIDO
            , MAX(ID_MOTIVO_VENDA) as ID_MOTIVO_VENDA
        from {{ ref('bronze_erp__motivo_venda_pedido') }}
        group by ID_PEDIDO
    )

    , motivo_venda as (
        select *
        from {{ ref('bronze_erp__motivo_venda') }}
    )

    , cartao_credito as (
        select *
        from {{ ref('bronze_erp__cartao_credito') }}
    )

    , silver_venda as (
        select
            venda_detalhe.ID_PEDIDO_DETALHE
            --, venda_detalhe.ID_PEDIDO
            , venda_detalhe.ID_PRODUTO
            , venda_detalhe.QUANTIDADE
            , venda_detalhe.PRECO_UNITARIO
            , venda_detalhe.DESCONTO_PRECO_UNITARIO
            , venda.ID_CLIENTE
            --, venda.ID_ENDERECO_COBRANCA
            , venda.ID_ENDERECO_ENVIO
            --, venda.ID_CARTAO_CREDITO
            , venda.DATA_PEDIDO
            , venda.DATA_ENVIO
            , venda.NUMERO_PEDIDO
            , venda.STATUS
            --, motivo_venda_pedido.ID_MOTIVO_VENDA
            , motivo_venda.TIPO_MOTIVO_VENDA
            , cartao_credito.TIPO_CARTAO_CREDITO
            , cast(QUANTIDADE * PRECO_UNITARIO as numeric(18,6)) as VALOR_BRUTO
            , cast(QUANTIDADE * PRECO_UNITARIO * (1 - DESCONTO_PRECO_UNITARIO) as numeric(18,6)) as VALOR_LIQUIDO
        from venda_detalhe
        left join venda               on (venda_detalhe.ID_PEDIDO = venda.ID_PEDIDO)
        left join motivo_venda_pedido on (venda_detalhe.ID_PEDIDO = motivo_venda_pedido.ID_PEDIDO)
        left join motivo_venda        on (motivo_venda_pedido.ID_MOTIVO_VENDA = motivo_venda.ID_MOTIVO_VENDA)
        left join cartao_credito      on (venda.ID_CARTAO_CREDITO = cartao_credito.ID_CARTAO_CREDITO)
    )


select *
from silver_venda