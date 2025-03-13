with
    enderecos as (
        select *
        from {{ ref('bronze_erp__enderecos') }}
    )

    , estados as (
        select *
        from {{ ref('bronze_erp__estados') }}
    )

    , paises as (
        select *
        from {{ ref('bronze_erp__paises') }}
    )

    , silver_locais as (
        select
            enderecos.ID_ENDERECO                                                      as ID_ENDERECO
            , enderecos.DESCRICAO_ENDERECO || ' - ' || DESCRICAO_COMPLEMENTO_ENDERECO  as DESCRICAO_ENDERECO
            , enderecos.NOME_CIDADE                                                    as NOME_CIDADE
            , estados.NOME_ESTADO                                                      as NOME_ESTADO
            , estados.SIGLA_ESTADO                                                     as SIGLA_ESTADO
            , paises.NOME_PAIS                                                          as NOME_PAIS
        from enderecos
        left join estados
            on enderecos.ID_ESTADO = estados.ID_ESTADO
        left join paises
            on estados.ID_PAIS = paises.ID_PAIS
    )

select *
from silver_locais
