with recursive
    venda as (
        select *
        from {{ ref('bronze_erp__vendas') }}
    )

    , limites_data as (
        select
            min(DATA_PEDIDO) as DATA_MINIMA
            , max(DATA_PEDIDO) as DATA_MAXIMA
        from venda
    )

    , lista_data as (
        select
            DATA_MINIMA as DATA
        from limites_data
        
        union all
        
        select
            DATEADD(day, 1, DATA) as DATA
        from lista_data
        where DATA < (select DATA_MAXIMA from limites_data)
    )

    , datas as (
        select
            DATA
            , year(DATA) || '/' || lpad(month(DATA),2,0) as ANO_MES
            , year(DATA) as ANO
            , month(DATA) as MES
            , day(DATA) as DIA
            , case
                when month(DATA) = 1 then 'Janeiro'
                when month(DATA) = 2 then 'Fevereiro'
                when month(DATA) = 3 then 'Março'
                when month(DATA) = 4 then 'Abril'
                when month(DATA) = 5 then 'Maio'
                when month(DATA) = 6 then 'Junho'
                when month(DATA) = 7 then 'Julho'
                when month(DATA) = 8 then 'Agosto'
                when month(DATA) = 9 then 'Setembro'
                when month(DATA) = 10 then 'Outubro'
                when month(DATA) = 11 then 'Novembro'
                when month(DATA) = 12 then 'Dezembro'
            end as NOME_MES
            , case
                when dayofweek(DATA) = 1 then 'Domingo'
                when dayofweek(DATA) = 2 then 'Segunda-feira'
                when dayofweek(DATA) = 3 then 'Terça-feira'
                when dayofweek(DATA) = 4 then 'Quarta-feira'
                when dayofweek(DATA) = 5 then 'Quinta-feira'
                when dayofweek(DATA) = 6 then 'Sexta-feira'
                when dayofweek(DATA) = 7 then 'Sábado'
            end as DIA_SEMANA,
        from lista_data
    )

select *
from datas
