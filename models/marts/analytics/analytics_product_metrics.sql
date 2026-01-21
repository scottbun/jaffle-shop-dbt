with items as (

    select * from {{ ref('fct_items') }}

),

final as (

    select
        product_id,
        product_name,
        product_type,
        store_name,
        count(item_id) as number_sold,
        sum(item_price) as product_revenue
    from items
    group by 1,2,3,4

)

select * from final