with orders as (

    select * from {{ ref('fct_orders') }}

),

final as (

    select
        to_char(date_trunc('month', order_date), 'YYYY-MM') as year_month,
        store_name as store_name,
        count(order_id) as number_of_orders,
        sum(subtotal) as revenue
    from orders
    group by 1,2

)

select * from final