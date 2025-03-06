with
    dim_cliente as (
        select *
        from {{ ref('silver__cliente') }}
    )

select *
from dim_cliente