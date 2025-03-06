with
    cliente as (
        select *
        from {{ ref('bronze_erp__cliente') }}
    )

    , pessoa as (
        select *
        from {{ ref('bronze_erp__pessoa') }}
    )

    , email as (
        select *
        from {{ ref('bronze_erp__cliente_email') }}
    )

    , telefone as (
        select *
        from {{ ref('bronze_erp__cliente_telefone') }}
    )

    , silver_cliente as (
        select
            cliente.ID_CLIENTE
            , case
                when pessoa.NOME_MEIO is null then pessoa.NOME_PRIMEIRO || ' ' || pessoa.NOME_ULTIMO
                else pessoa.NOME_PRIMEIRO || ' ' || pessoa.NOME_MEIO || ' ' || pessoa.NOME_ULTIMO
            end as NOME_COMPLETO
            , email.DESCRICAO_EMAIL
            , telefone.NUMERO_TELEFONE
        from cliente
        left join pessoa   on (cliente.ID_PESSOA = pessoa.ID_PESSOA)
        left join email    on (pessoa.ID_PESSOA = email.ID_PESSOA)
        left join telefone on (pessoa.ID_PESSOA = telefone.ID_PESSOA)
    )


select *
from silver_cliente