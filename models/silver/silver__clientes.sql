with
    clientes as (
        select *
        from {{ ref('bronze_erp__clientes') }}
    )

    , pessoas as (
        select *
        from {{ ref('bronze_erp__pessoas') }}
    )

    , emails as (
        select *
        from {{ ref('bronze_erp__clientes_emails') }}
    )

    , telefones as (
        select *
        from {{ ref('bronze_erp__clientes_telefones') }}
    )

    , silver_clientes as (
        select
            clientes.ID_CLIENTE
            , case
                when pessoas.NOME_MEIO is null then pessoas.NOME_PRIMEIRO || ' ' || pessoas.NOME_ULTIMO
                else pessoas.NOME_PRIMEIRO || ' ' || pessoas.NOME_MEIO || ' ' || pessoas.NOME_ULTIMO
            end as NOME_COMPLETO
            , emails.DESCRICAO_EMAIL
            , telefones.NUMERO_TELEFONE
        from clientes
        left join pessoas
            on clientes.ID_PESSOA = pessoas.ID_PESSOA
        left join emails
            on pessoas.ID_PESSOA = emails.ID_PESSOA
        left join telefones
            on pessoas.ID_PESSOA = telefones.ID_PESSOA
    )


select *
from silver_clientes
