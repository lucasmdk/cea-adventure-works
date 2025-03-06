with
    bronze_creditcard as (
        select
            cast(CREDITCARDID as int)  as UID_CARTAO_CREDITO
            , cast(CARDTYPE as string) as TIP_CARTAO
        from {{ source('erp', 'creditcard') }}
    )


select *
from bronze_creditcard