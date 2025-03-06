with
    dim_local as (
        select *
        from {{ ref('silver__local') }}
    )


select *
from dim_local