with
    dim_calendario as (
        select *
        from {{ ref('silver__calendario') }}
    )


select *
from dim_calendario