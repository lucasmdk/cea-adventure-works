with
    bronze_salesorderheadersalesreason as (
        select
            cast(SALESORDERID as int)    as ID_PEDIDO
            , cast(SALESREASONID as int) as ID_MOTIVO_VENDA
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )


select *
from bronze_salesorderheadersalesreason