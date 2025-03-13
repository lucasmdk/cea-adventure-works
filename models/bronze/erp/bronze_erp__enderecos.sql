with
    bronze_enderecos as (
        select
            cast(ADDRESSID as int)         as ID_ENDERECO
            , cast(STATEPROVINCEID as int) as ID_ESTADO
            , cast(CITY as string)         as NOME_CIDADE
            , cast(ADDRESSLINE1 as string) as DESCRICAO_ENDERECO
            , cast(ADDRESSLINE2 as string) as DESCRICAO_COMPLEMENTO_ENDERECO
        from {{ source('erp', 'address') }}
    )


select *
from bronze_enderecos
