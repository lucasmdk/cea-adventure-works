with
    bronze_telefones as (
        select
            cast(BUSINESSENTITYID as int) as ID_PESSOA
            , cast(PHONENUMBER as string) as NUMERO_TELEFONE
        from {{ source('erp', 'personphone') }}
    )


select *
from bronze_telefones
