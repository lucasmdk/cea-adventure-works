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
            cliente.UID_CLIENTE
            , CASE
                WHEN pessoa.NOM_MEIO is null THEN pessoa.NOM_PRIMEIRO || ' ' || pessoa.NOM_ULTIMO
                ELSE pessoa.NOM_PRIMEIRO || ' ' || pessoa.NOM_MEIO || ' ' || pessoa.NOM_ULTIMO
            END AS NOM_COMPLETO
            , email.DES_EMAIL
            , telefone.NUM_TELEFONE
        from cliente
        left join pessoa   on (cliente.UID_PESSOA = pessoa.UID_PESSOA)
        left join email    on (pessoa.UID_PESSOA = email.UID_PESSOA)
        left join telefone on (pessoa.UID_PESSOA = telefone.UID_PESSOA)
    )


select *
from silver_cliente