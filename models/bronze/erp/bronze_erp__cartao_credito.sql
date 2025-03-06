with
    bronze_creditcard as (
        select
            cast(CREDITCARDID as int)  as ID_CARTAO_CREDITO
            , cast(CARDTYPE as string) as TIPO_CARTAO_CREDITO
        from {{ source('erp', 'creditcard') }}
    )


select *
from bronze_creditcard