with
    vendas_detalhe as (
        select *
        from {{ ref('bronze_erp__vendas_detalhe') }}
    )

    , vendas as (
        select *
        from {{ ref('bronze_erp__vendas') }}
    )

    , cartoes_credito as (
        select *
        from {{ ref('bronze_erp__cartoes_credito') }}
    )

    , silver_vendas as (
        select
            vendas_detalhe.ID_PEDIDO_DETALHE
            , vendas_detalhe.ID_PEDIDO
            , vendas_detalhe.ID_PRODUTO
            , vendas_detalhe.QUANTIDADE
            , vendas_detalhe.PRECO_UNITARIO
            , vendas_detalhe.DESCONTO_PRECO_UNITARIO
            , vendas.ID_CLIENTE
            --, vendas.ID_ENDERECO_COBRANCA
            , vendas.ID_ENDERECO_ENVIO
            --, vendas.ID_CARTAO_CREDITO
            , vendas.DATA_PEDIDO
            , vendas.DATA_ENVIO
            , vendas.NUMERO_PEDIDO
            , case
                when vendas.STATUS = 1 then 'Em processo'
                when vendas.STATUS = 2 then 'Aprovado'
                when vendas.STATUS = 3 then 'Em espera'
                when vendas.STATUS = 4 then 'Rejeitado'
                when vendas.STATUS = 5 then 'Enviado'
                else 'Cancelado'
            end as STATUS
            , coalesce(cartoes_credito.TIPO_CARTAO_CREDITO, 'Other') as TIPO_CARTAO_CREDITO
            , cast(QUANTIDADE * PRECO_UNITARIO as numeric(18,6)) as VALOR_BRUTO
            , cast(QUANTIDADE * PRECO_UNITARIO * (1 - DESCONTO_PRECO_UNITARIO) as numeric(18,6)) as VALOR_LIQUIDO
        from vendas_detalhe
        left join vendas
            on vendas_detalhe.ID_PEDIDO = vendas.ID_PEDIDO
        left join cartoes_credito
            on vendas.ID_CARTAO_CREDITO = cartoes_credito.ID_CARTAO_CREDITO
    )


select *
from silver_vendas
