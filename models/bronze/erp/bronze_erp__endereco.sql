with
    bronze_address as (
        select
            cast(ADDRESSID as int)         as UID_ENDERECO
            , cast(STATEPROVINCEID as int) as UID_ESTADO
            , cast(CITY as string)         as NOM_CIDADE
            , cast(ADDRESSLINE1 as string) as DES_ENDERECO
            , cast(ADDRESSLINE2 as string) as DES_COMPLEMENTO_ENDERECO
        from {{ source('erp', 'address') }}
    )


select *
from bronze_address