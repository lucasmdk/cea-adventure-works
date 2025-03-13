with
    fato_vendas as (
        select 
        {{ dbt_utils.generate_surrogate_key(['ID_PEDIDO_DETALHE']) }} as SK_PEDIDO_DETALHE
        , {{ dbt_utils.generate_surrogate_key(['ID_PEDIDO']) }} as SK_PEDIDO
        , {{ dbt_utils.generate_surrogate_key(['ID_PRODUTO']) }} as SK_PRODUTO
        , {{ dbt_utils.generate_surrogate_key(['ID_CLIENTE']) }} as SK_CLIENTE
        , {{ dbt_utils.generate_surrogate_key(['ID_ENDERECO_ENVIO']) }} as SK_ENDERECO_ENVIO
        , DATA_PEDIDO
        , DATA_ENVIO
        , NUMERO_PEDIDO
        , STATUS
        , TIPO_CARTAO_CREDITO
        , VALOR_BRUTO
        , VALOR_LIQUIDO
        , QUANTIDADE
        , PRECO_UNITARIO
        , DESCONTO_PRECO_UNITARIO
        from {{ ref('silver__vendas') }}
    )


select *
from fato_vendas
