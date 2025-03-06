with
    bronze_person as (
        select
            cast(BUSINESSENTITYID as int)    as ID_PESSOA
            , cast(FIRSTNAME as string)      as NOME_PRIMEIRO
            , cast(MIDDLENAME as string)     as NOME_MEIO
            , cast(LASTNAME as string)       as NOME_ULTIMO
        from {{ source('erp', 'person') }}
    )


select *
from bronze_person