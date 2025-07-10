with orders as (
    select * from {{ ref('stg_crm__orders') }}
),
order_summary as (
    select
        customer_id,
        min(ordered_at) as first_order_date,
        max(ordered_at) as most_recent_order_date,
        count(*) as total_orders,
        sum(order_total) as total_amount
    from orders
    group by customer_id
)

select * from order_summary