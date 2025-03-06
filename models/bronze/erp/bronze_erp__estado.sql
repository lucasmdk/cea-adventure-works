with
    bronze_stateprovince as (
        select
            cast(STATEPROVINCEID as int)        as ID_ESTADO
            , cast(COUNTRYREGIONCODE as string) as ID_PAIS
            , cast(NAME as string)              as NOME_ESTADO
            , cast(STATEPROVINCECODE as string) as SIGLA_ESTADO
        from {{ source('erp', 'stateprovince') }}
    )


select *
from bronze_stateprovince