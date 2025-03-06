with
    bronze_countryregion as (
        select
            cast(COUNTRYREGIONCODE as string) as ID_PAIS
            , cast(NAME as string)            as NOME_PAIS
        from {{ source('erp', 'countryregion') }}
    )


select *
from bronze_countryregion