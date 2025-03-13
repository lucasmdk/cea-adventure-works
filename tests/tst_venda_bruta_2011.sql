/*
Este teste foi um pedido do CEO, Carlos Silveira
a fim de realizar uma validação dos dados
ce venda bruta de 2012: $12.646.112,16 
*/

with
    venda_bruta_2011 as (
        select
            sum(VALOR_BRUTO) as VALOR_BRUTO
        from {{ ref('silver__vendas') }}
        where YEAR(DATA_PEDIDO) = 2011
    )

select VALOR_BRUTO
from venda_bruta_2011
where VALOR_BRUTO not between 12646112.00 and 12646113.00