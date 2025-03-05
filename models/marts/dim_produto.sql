with
    dim_produto as (
        select *
        from {{ ref('int_comercial__prep_produto') }}
    )

select *
from dim_produto