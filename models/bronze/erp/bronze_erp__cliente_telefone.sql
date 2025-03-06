with
    bronze_personphone as (
        select
            cast(BUSINESSENTITYID as int) as UID_PESSOA
            , cast(PHONENUMBER as string) as NUM_TELEFONE
        from {{ source('erp', 'personphone') }}
    )


select *
from bronze_personphone