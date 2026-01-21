with orders as (

    select * from {{ ref('stg_orders') }}

),

stores as (

    select * from {{ ref('stg_stores') }}
),

final as (

    select 
        orders.*,
        stores.store_name
    from orders
    left join stores on orders.store_id = stores.store_id
    where order_date >= DATE '2019-01-01'
        and order_date < DATE '2020-01-01'

)

select * from final