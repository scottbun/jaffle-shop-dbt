with items as (

    select * from {{ ref('stg_items') }}

),

orders as (

    select * from {{ ref('fct_orders') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

final as (
    
    select
        items.*,
        orders.order_date,
        orders.store_name,
        products.product_name,
        products.product_type,
        product_price as item_price
    from items
    inner join orders using (order_id)
    left join products using (product_id)

)

select * from final