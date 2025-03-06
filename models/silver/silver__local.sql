with
    endereco as (
        select *
        from {{ ref('bronze_erp__endereco') }}
    )

    , estado as (
        select *
        from {{ ref('bronze_erp__estado') }}
    )

    , pais as (
        select *
        from {{ ref('bronze_erp__pais') }}
    )

    , silver_local as (
        select
            endereco.UID_ENDERECO                                         as UID_ENDERECO
            , endereco.DES_ENDERECO || ' - ' || DES_COMPLEMENTO_ENDERECO  as DES_ENDERECO
            , endereco.NOM_CIDADE                                         as NOM_CIDADE
            , estado.NOM_ESTADO                                           as NOM_ESTADO
            , estado.SIG_ESTADO                                           as SIG_ESTADO
            , pais.NOM_PAIS                                               as NOM_PAIS
        from endereco
        left join estado on (endereco.UID_ESTADO = estado.UID_ESTADO)
        left join pais   on (estado.UID_PAIS = pais.UID_PAIS)
    )

select *
from silver_local