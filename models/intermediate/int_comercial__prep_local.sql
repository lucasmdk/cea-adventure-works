with
    endereco as (
        select *
        from {{ ref('stg_erp__endereco') }}
    )

    , estado as (
        select *
        from {{ ref('stg_erp__estado') }}
    )

    , pais as (
        select *
        from {{ ref('stg_erp__pais') }}
    )

    , silver_local as (
        select
            cast(endereco.UID_ENDERECO as int)                                            as UID_ENDERECO
            , cast(endereco.NOM_CIDADE as string)                                         as NOM_CIDADE
            , cast(endereco.DES_ENDERECO || ' - ' || DES_COMPLEMENTO_ENDERECO as string)  as DES_ENDERECO
            , cast(estado.NOM_ESTADO as string)                                           as NOM_ESTADO
            , cast(estado.SIG_ESTADO as string)                                           as SIG_ESTADO
            , cast(pais.NOM_PAIS as string)                                               as NOM_PAIS
        from endereco
        left join estado on (endereco.UID_ESTADO = estado.UID_ESTADO)
        left join pais   on (estado.UID_PAIS = pais.UID_PAIS)
    )

select *
from silver_local