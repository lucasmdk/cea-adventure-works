with
    dim_produto as (
        select *
        from {{ ref('silver__produto') }}
    )

select *
from dim_produto