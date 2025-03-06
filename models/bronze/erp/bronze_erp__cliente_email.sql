with
    bronze_emailaddress as (
        select
            cast(BUSINESSENTITYID as int)  as UID_PESSOA
            , cast(EMAILADDRESS as string) as DES_EMAIL
        from {{ source('erp', 'emailaddress') }}
    )


select *
from bronze_emailaddress