with products as (

    select * from {{ ref('stg_products') }}

),

final as (

    select * from products

)

select * from final