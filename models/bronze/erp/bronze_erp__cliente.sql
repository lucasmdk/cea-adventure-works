with
    bronze_customer as (
        select
            cast(CUSTOMERID as int) as UID_CLIENTE
            , cast(PERSONID as int)   as UID_PESSOA
            , cast(STOREID as int)    as UID_LOJA
        from {{ source('erp', 'customer') }}
    )


select *
from bronze_customer