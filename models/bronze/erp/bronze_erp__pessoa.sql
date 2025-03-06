with
    bronze_person as (
        select
            cast(BUSINESSENTITYID as int)    as UID_PESSOA
            , cast(FIRSTNAME as string)      as NOM_PRIMEIRO
            , cast(MIDDLENAME as string)     as NOM_MEIO
            , cast(LASTNAME as string)       as NOM_ULTIMO
        from {{ source('erp', 'person') }}
    )


select *
from bronze_person