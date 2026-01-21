with stores as (

    select * from {{ ref('stg_stores') }}

),

final as (

    select * from stores
    where store_opened_date < DATE '2020-01-01'

)

select * from final