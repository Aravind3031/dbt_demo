{{ config(materialized='table') }}

with customers as (
    select * from {{ ref('stg_crm__customers') }}
),
orders as (
    select * from {{ ref('int_orders_by_customers') }}
)

select
    c.customer_id,
    c.customer_name,
    case when o.total_orders > 5 then true else false end as is_frequent_buyer
from customers c
left join orders o on c.customer_id = o.customer_id