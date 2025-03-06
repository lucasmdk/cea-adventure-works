with
    bronze_stateprovince as (
        select
            cast(STATEPROVINCEID as int)        as UID_ESTADO
            , cast(COUNTRYREGIONCODE as string) as UID_PAIS
            , cast(NAME as string)              as NOM_ESTADO
            , cast(STATEPROVINCECODE as string) as SIG_ESTADO
        from {{ source('erp', 'stateprovince') }}
    )


select *
from bronze_stateprovince