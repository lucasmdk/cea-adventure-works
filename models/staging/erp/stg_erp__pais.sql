with
    bronze_countryregion as (
        select
            cast(COUNTRYREGIONCODE as string) as UID_PAIS
            , cast(NAME as string)            as NOM_PAIS
        from {{ source('erp', 'countryregion') }}
    )


select *
from bronze_countryregion