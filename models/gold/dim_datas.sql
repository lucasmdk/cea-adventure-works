with
    dim_datas as (
        select *
        from {{ ref('silver__datas') }}
    )


select *
from dim_datas
