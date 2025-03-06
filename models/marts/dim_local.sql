with
    dim_local as (
        select *
        from {{ ref('int_comercial__prep_local') }}
    )


select *
from dim_local