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
            endereco.ID_ENDERECO                                                      as ID_ENDERECO
            , endereco.DESCRICAO_ENDERECO || ' - ' || DESCRICAO_COMPLEMENTO_ENDERECO  as DESCRICAO_ENDERECO
            , endereco.NOME_CIDADE                                                    as NOME_CIDADE
            , estado.NOME_ESTADO                                                      as NOME_ESTADO
            , estado.SIGLA_ESTADO                                                     as SIGLA_ESTADO
            , pais.NOME_PAIS                                                          as NOME_PAIS
        from endereco
        left join estado on (endereco.ID_ESTADO = estado.ID_ESTADO)
        left join pais   on (estado.ID_PAIS = pais.ID_PAIS)
    )

select *
from silver_local