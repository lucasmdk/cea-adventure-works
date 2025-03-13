with
    bronze_clientes as (
        select
            cast(CUSTOMERID as int) as ID_CLIENTE
            , cast(PERSONID as int)   as ID_PESSOA
            , cast(STOREID as int)    as ID_LOJA
        from {{ source('erp', 'customer') }}
    )


select *
from bronze_clientes
