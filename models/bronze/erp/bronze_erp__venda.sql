with
    bronze_salesorderheader as (
        select
            cast(SALESORDERID as int)             as ID_PEDIDO
            , cast(CUSTOMERID as int)             as ID_CLIENTE
            , cast(BILLTOADDRESSID as int)        as ID_ENDERECO_COBRANCA
            , cast(SHIPTOADDRESSID as int)        as ID_ENDERECO_ENVIO
            , cast(CREDITCARDID as int)           as ID_CARTAO_CREDITO
            , cast(ORDERDATE as date)             as DATA_PEDIDO
            , cast(SHIPDATE as date)              as DATA_ENVIO
            , cast(PURCHASEORDERNUMBER as string) as NUMERO_PEDIDO
            , cast(STATUS as int)                 as STATUS
            , cast(SUBTOTAL as numeric)           as VALOR_SUBTOTAL
            , cast(TAXAMT as numeric)             as VALOR_TAXA
            , cast(FREIGHT as numeric)            as VALOR_FRETE
            , cast(TOTALDUE as numeric)           as VALOR_TOTAL
        from {{ source('erp', 'salesorderheader') }}
    )


select *
from bronze_salesorderheader