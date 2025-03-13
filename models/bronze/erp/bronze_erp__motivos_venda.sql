with
    bronze_motivos_venda as (
        select
            cast(SALESREASONID as int)   as ID_MOTIVO_VENDA
            , cast(NAME as string)       as DESCRICAO_MOTIVO_VENDA
            , cast(REASONTYPE as string) as TIPO_MOTIVO_VENDA
        from {{ source('erp', 'salesreason') }}
    )


select *
from bronze_motivos_venda
