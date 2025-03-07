with
    bronze_salesorderdetail as (
        select
            cast(SALESORDERDETAILID as int) as ID_PEDIDO_DETALHE 
            , cast(SALESORDERID as int) as ID_PEDIDO
            , cast(PRODUCTID as int) as ID_PRODUTO
            , cast(ORDERQTY as int) as QUANTIDADE
            , cast(UNITPRICE as numeric(18,6)) as PRECO_UNITARIO
            , cast(UNITPRICEDISCOUNT as numeric(18,6)) as DESCONTO_PRECO_UNITARIO
        from {{ source('erp', 'salesorderdetail') }}
    )


select *
from bronze_salesorderdetail
order by DESCONTO_PRECO_UNITARIO desc