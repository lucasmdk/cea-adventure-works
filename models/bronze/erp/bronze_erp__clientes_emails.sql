with
    bronze_emails as (
        select
            cast(BUSINESSENTITYID as int)  as ID_PESSOA
            , cast(EMAILADDRESS as string) as DESCRICAO_EMAIL
        from {{ source('erp', 'emailaddress') }}
    )


select *
from bronze_emails
